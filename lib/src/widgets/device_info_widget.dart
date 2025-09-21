import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/device_info_model.dart';
import '../providers/device_info_provider.dart';

/// Виджет для отображения информации об устройстве
class DeviceInfoWidget extends ConsumerWidget {
  /// Показывать ли детальную информацию
  final bool showDetails;

  /// Показывать ли кнопки действий
  final bool showActions;

  /// Стиль отображения
  final DeviceInfoDisplayStyle displayStyle;

  /// Callback при копировании информации
  final VoidCallback? onCopyInfo;

  const DeviceInfoWidget({
    super.key,
    this.showDetails = true,
    this.showActions = true,
    this.displayStyle = DeviceInfoDisplayStyle.card,
    this.onCopyInfo,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceInfoAsync = ref.watch(deviceInfoProvider);

    return deviceInfoAsync.when(
      data: (deviceInfo) => _buildDeviceInfo(context, ref, deviceInfo),
      loading: () => _buildLoading(context),
      error: (error, stack) => _buildError(context, error, ref),
    );
  }

  Widget _buildDeviceInfo(
    BuildContext context,
    WidgetRef ref,
    DeviceInfoModel deviceInfo,
  ) {
    switch (displayStyle) {
      case DeviceInfoDisplayStyle.card:
        return _buildCard(context, ref, deviceInfo);
      case DeviceInfoDisplayStyle.list:
        return _buildList(context, ref, deviceInfo);
      case DeviceInfoDisplayStyle.compact:
        return _buildCompact(context, ref, deviceInfo);
    }
  }

  Widget _buildCard(
    BuildContext context,
    WidgetRef ref,
    DeviceInfoModel deviceInfo,
  ) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context, deviceInfo),
            if (showDetails) ...[
              const SizedBox(height: 16),
              _buildDetails(context, ref, deviceInfo),
            ],
            if (showActions) ...[
              const SizedBox(height: 16),
              _buildActions(context, ref, deviceInfo),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildList(
    BuildContext context,
    WidgetRef ref,
    DeviceInfoModel deviceInfo,
  ) {
    final items = _getInfoItems(deviceInfo);

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length + (showActions ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == items.length) {
          return _buildActions(context, ref, deviceInfo);
        }

        final item = items[index];
        return ListTile(
          leading: Icon(item.icon),
          title: Text(item.title),
          subtitle: Text(item.value),
          trailing: item.copyable
              ? IconButton(
                  icon: const Icon(Icons.copy),
                  onPressed: () => _copyToClipboard(context, item.value),
                )
              : null,
        );
      },
    );
  }

  Widget _buildCompact(
    BuildContext context,
    WidgetRef ref,
    DeviceInfoModel deviceInfo,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            _getPlatformIcon(deviceInfo.platform),
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  deviceInfo.shortDescription,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  '${deviceInfo.platform} • ${deviceInfo.isPhysicalDevice ? 'Physical' : 'Emulator'}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          if (showActions)
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  onTap: () => _copyDeviceInfo(context, deviceInfo),
                  child: const Row(
                    children: [
                      Icon(Icons.copy),
                      SizedBox(width: 8),
                      Text('Copy Info'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  onTap: () => _showDetailDialog(context, ref, deviceInfo),
                  child: const Row(
                    children: [
                      Icon(Icons.info),
                      SizedBox(width: 8),
                      Text('Details'),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, DeviceInfoModel deviceInfo) {
    return Row(
      children: [
        Icon(
          _getPlatformIcon(deviceInfo.platform),
          size: 32,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                deviceInfo.shortDescription,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                deviceInfo.platform,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
        ),
        _buildPerformanceBadge(context, deviceInfo.performanceInfo.category),
      ],
    );
  }

  Widget _buildDetails(
    BuildContext context,
    WidgetRef ref,
    DeviceInfoModel deviceInfo,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoSection(context, 'System Information', [
          _InfoItem(
            'System',
            '${deviceInfo.systemName} ${deviceInfo.systemVersion}',
          ),
          _InfoItem('Model', deviceInfo.model),
          _InfoItem('Brand', deviceInfo.brand),
          _InfoItem(
            'Device Type',
            deviceInfo.isPhysicalDevice ? 'Physical Device' : 'Emulator',
          ),
          if (deviceInfo.screenResolution != 'unknown')
            _InfoItem('Screen', deviceInfo.screenResolution),
          if (deviceInfo.ramMb != null)
            _InfoItem('RAM', '${deviceInfo.ramMb} MB'),
          if (deviceInfo.storageGb != null)
            _InfoItem('Storage', '${deviceInfo.storageGb} GB'),
        ]),
        const SizedBox(height: 16),
        _buildPerformanceSection(context, ref, deviceInfo),
      ],
    );
  }

  Widget _buildInfoSection(
    BuildContext context,
    String title,
    List<_InfoItem> items,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 100,
                  child: Text(
                    '${item.title}:',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    item.value,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPerformanceSection(
    BuildContext context,
    WidgetRef ref,
    DeviceInfoModel deviceInfo,
  ) {
    final performanceInfo = deviceInfo.performanceInfo;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Performance', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Row(
          children: [
            _buildPerformanceBadge(context, performanceInfo.category),
            const SizedBox(width: 12),
            Text(
              'Score: ${performanceInfo.score}/100',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        if (performanceInfo.recommendations.isNotEmpty) ...[
          const SizedBox(height: 8),
          Text(
            'Recommendations:',
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500),
          ),
          ...performanceInfo.recommendations.map(
            (rec) => Padding(
              padding: const EdgeInsets.only(left: 16, top: 2),
              child: Text(
                '• $rec',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildPerformanceBadge(
    BuildContext context,
    DevicePerformanceCategory category,
  ) {
    Color color;
    String text;

    switch (category) {
      case DevicePerformanceCategory.high:
        color = Colors.green;
        text = 'High';
        break;
      case DevicePerformanceCategory.medium:
        color = Colors.orange;
        text = 'Medium';
        break;
      case DevicePerformanceCategory.low:
        color = Colors.red;
        text = 'Low';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildActions(
    BuildContext context,
    WidgetRef ref,
    DeviceInfoModel deviceInfo,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton.icon(
          onPressed: () => _copyDeviceInfo(context, deviceInfo),
          icon: const Icon(Icons.copy),
          label: const Text('Copy Info'),
        ),
        TextButton.icon(
          onPressed: () => _showDetailDialog(context, ref, deviceInfo),
          icon: const Icon(Icons.info),
          label: const Text('Details'),
        ),
        TextButton.icon(
          onPressed: () => ref.refresh(deviceInfoProvider),
          icon: const Icon(Icons.refresh),
          label: const Text('Refresh'),
        ),
      ],
    );
  }

  Widget _buildLoading(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildError(BuildContext context, Object error, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(
              Icons.error,
              color: Theme.of(context).colorScheme.error,
              size: 48,
            ),
            const SizedBox(height: 16),
            Text(
              'Failed to load device information',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              error.toString(),
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => ref.refresh(deviceInfoProvider),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getPlatformIcon(String platform) {
    switch (platform.toLowerCase()) {
      case 'android':
        return Icons.android;
      case 'ios':
        return Icons.phone_iphone;
      case 'web':
        return Icons.web;
      case 'windows':
        return Icons.desktop_windows;
      case 'macos':
        return Icons.desktop_mac;
      case 'linux':
        return Icons.computer;
      default:
        return Icons.device_unknown;
    }
  }

  List<_InfoItem> _getInfoItems(DeviceInfoModel deviceInfo) {
    return [
      _InfoItem('Platform', deviceInfo.platform, Icons.devices),
      _InfoItem('Model', deviceInfo.model, Icons.phone_android),
      _InfoItem('Brand', deviceInfo.brand, Icons.business),
      _InfoItem(
        'System',
        '${deviceInfo.systemName} ${deviceInfo.systemVersion}',
        Icons.info,
      ),
      _InfoItem(
        'Type',
        deviceInfo.isPhysicalDevice ? 'Physical' : 'Emulator',
        Icons.device_hub,
      ),
      if (deviceInfo.screenResolution != 'unknown')
        _InfoItem(
          'Screen',
          deviceInfo.screenResolution,
          Icons.screen_lock_portrait,
        ),
      if (deviceInfo.ramMb != null)
        _InfoItem('RAM', '${deviceInfo.ramMb} MB', Icons.memory),
    ];
  }

  void _copyDeviceInfo(BuildContext context, DeviceInfoModel deviceInfo) {
    final info =
        '''
Device Information:
Platform: ${deviceInfo.platform}
Model: ${deviceInfo.model}
Brand: ${deviceInfo.brand}
System: ${deviceInfo.systemName} ${deviceInfo.systemVersion}
Type: ${deviceInfo.isPhysicalDevice ? 'Physical Device' : 'Emulator'}
Screen: ${deviceInfo.screenResolution}
Performance: ${deviceInfo.performanceInfo.category.displayName} (${deviceInfo.performanceInfo.score}/100)
''';

    Clipboard.setData(ClipboardData(text: info));

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Device information copied to clipboard')),
      );
    }

    onCopyInfo?.call();
  }

  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));

    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Copied: $text')));
    }
  }

  void _showDetailDialog(
    BuildContext context,
    WidgetRef ref,
    DeviceInfoModel deviceInfo,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Device Details'),
        content: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: DeviceInfoWidget(
              displayStyle: DeviceInfoDisplayStyle.list,
              showActions: false,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
          TextButton(
            onPressed: () {
              _copyDeviceInfo(context, deviceInfo);
              Navigator.of(context).pop();
            },
            child: const Text('Copy'),
          ),
        ],
      ),
    );
  }
}

/// Стили отображения виджета информации об устройстве
enum DeviceInfoDisplayStyle { card, list, compact }

/// Элемент информации для отображения
class _InfoItem {
  final String title;
  final String value;
  final IconData? icon;
  final bool copyable;

  const _InfoItem(this.title, this.value, [this.icon]) : copyable = false;
}
