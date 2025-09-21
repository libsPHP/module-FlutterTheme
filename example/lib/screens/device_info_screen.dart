import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_magento/flutter_magento.dart';

/// Экран для демонстрации функциональности Device Info
class DeviceInfoScreen extends StatefulWidget {
  const DeviceInfoScreen({super.key});

  @override
  State<DeviceInfoScreen> createState() => _DeviceInfoScreenState();
}

class _DeviceInfoScreenState extends State<DeviceInfoScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  
  String? _deviceFingerprint;
  DevicePerformanceCategory? _performanceCategory;
  DeviceOptimizationSettings? _optimizationSettings;
  DeviceCapabilities? _deviceCapabilities;
  Map<String, dynamic>? _analyticsData;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _loadAdditionalInfo();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadAdditionalInfo() async {
    setState(() => _isLoading = true);

    try {
      final fingerprint = await DeviceUtils.getDeviceFingerprint();
      final performanceCategory = await DeviceUtils.getPerformanceCategory();
      final optimizationSettings = await DeviceUtils.getOptimizationSettings();
      final deviceCapabilities = await DeviceUtils.getDeviceCapabilities();
      final analyticsData = await DeviceUtils.getAnalyticsPayload();

      setState(() {
        _deviceFingerprint = fingerprint;
        _performanceCategory = performanceCategory;
        _optimizationSettings = optimizationSettings;
        _deviceCapabilities = deviceCapabilities;
        _analyticsData = analyticsData;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading device info: $e')),
        );
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Device Information'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Overview', icon: Icon(Icons.info)),
            Tab(text: 'Performance', icon: Icon(Icons.speed)),
            Tab(text: 'Capabilities', icon: Icon(Icons.settings)),
            Tab(text: 'Analytics', icon: Icon(Icons.analytics)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshData,
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOverviewTab(),
          _buildPerformanceTab(),
          _buildCapabilitiesTab(),
          _buildAnalyticsTab(),
        ],
      ),
    );
  }

  Widget _buildOverviewTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DeviceInfoWidget(
            displayStyle: DeviceInfoDisplayStyle.card,
            showDetails: true,
            showActions: true,
          ),
          const SizedBox(height: 16),
          _buildFingerprintCard(),
          const SizedBox(height: 16),
          _buildQuickChecksCard(),
        ],
      ),
    );
  }

  Widget _buildPerformanceTab() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPerformanceCategoryCard(),
          const SizedBox(height: 16),
          _buildOptimizationSettingsCard(),
          const SizedBox(height: 16),
          _buildCompatibilityCard(),
        ],
      ),
    );
  }

  Widget _buildCapabilitiesTab() {
    if (_isLoading || _deviceCapabilities == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCapabilitiesCard(),
          const SizedBox(height: 16),
          _buildRecommendationsCard(),
        ],
      ),
    );
  }

  Widget _buildAnalyticsTab() {
    if (_isLoading || _analyticsData == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAnalyticsDataCard(),
          const SizedBox(height: 16),
          _buildAnalyticsActionsCard(),
        ],
      ),
    );
  }

  Widget _buildFingerprintCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.fingerprint),
                const SizedBox(width: 8),
                Text(
                  'Device Fingerprint',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (_deviceFingerprint != null) ...[
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _deviceFingerprint!,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontFamily: 'monospace',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.copy),
                      onPressed: () => _copyToClipboard(_deviceFingerprint!),
                    ),
                  ],
                ),
              ),
            ] else ...[
              const Center(child: CircularProgressIndicator()),
            ],
            const SizedBox(height: 8),
            Text(
              'Unique identifier for this device based on hardware and software characteristics',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickChecksCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quick Checks',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            _buildQuickCheckTile('Mobile Device', DeviceUtils.isMobile),
            _buildQuickCheckTile('Desktop Device', DeviceUtils.isDesktop),
            _buildQuickCheckTile('Web Platform', DeviceUtils.isWeb),
            _buildQuickCheckTile('Android Platform', DeviceUtils.isAndroid),
            _buildQuickCheckTile('iOS Platform', DeviceUtils.isIOS),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _runCompatibilityCheck,
                    icon: const Icon(Icons.check_circle),
                    label: const Text('Run Compatibility Check'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickCheckTile(String title, bool value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            value ? Icons.check_circle : Icons.cancel,
            color: value ? Colors.green : Colors.red,
            size: 20,
          ),
          const SizedBox(width: 12),
          Text(title),
        ],
      ),
    );
  }

  Widget _buildPerformanceCategoryCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.speed),
                const SizedBox(width: 8),
                Text(
                  'Performance Category',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (_performanceCategory != null) ...[
              Center(
                child: _buildPerformanceBadge(_performanceCategory!),
              ),
              const SizedBox(height: 16),
              Text(
                _getPerformanceDescription(_performanceCategory!),
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ] else ...[
              const Center(child: CircularProgressIndicator()),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildOptimizationSettingsCard() {
    if (_optimizationSettings == null) {
      return const SizedBox();
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Optimization Settings',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            _buildSettingTile('Max Concurrent Requests', '${_optimizationSettings!.maxConcurrentRequests}'),
            _buildSettingTile('Image Quality', '${(_optimizationSettings!.imageQuality * 100).round()}%'),
            _buildSettingTile('Image Cache Size', '${_optimizationSettings!.imageCacheSize} MB'),
            _buildSettingTile('Animations', _optimizationSettings!.enableAnimations ? 'Enabled' : 'Disabled'),
            _buildSettingTile('Advanced Features', _optimizationSettings!.enableAdvancedFeatures ? 'Enabled' : 'Disabled'),
            _buildSettingTile('List Buffer Size', '${_optimizationSettings!.listBufferSize}'),
            _buildSettingTile('Lazy Loading', _optimizationSettings!.enableLazyLoading ? 'Enabled' : 'Disabled'),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingTile(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompatibilityCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Compatibility Tests',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            _buildCompatibilityTest('Android API 24+', () async {
              return await DeviceUtils.meetsMinimumRequirements(minAndroidSdk: 24);
            }),
            _buildCompatibilityTest('iOS 13.0+', () async {
              return await DeviceUtils.meetsMinimumRequirements(minIOSVersion: '13.0');
            }),
            _buildCompatibilityTest('4GB RAM+', () async {
              return await DeviceUtils.meetsMinimumRequirements(minRamMb: 4000);
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildCompatibilityTest(String title, Future<bool> Function() test) {
    return FutureBuilder<bool>(
      future: test(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                const SizedBox(width: 12),
                Text(title),
              ],
            ),
          );
        }

        final isCompatible = snapshot.data ?? false;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              Icon(
                isCompatible ? Icons.check_circle : Icons.cancel,
                color: isCompatible ? Colors.green : Colors.red,
                size: 20,
              ),
              const SizedBox(width: 12),
              Text(title),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCapabilitiesCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Device Capabilities',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            _buildCapabilityTile('Advanced Animations', _deviceCapabilities!.supportsAdvancedAnimations),
            _buildCapabilityTile('High Quality Images', _deviceCapabilities!.supportsHighQualityImages),
            _buildCapabilityTile('Video Playback', _deviceCapabilities!.supportsVideoPlayback),
            _buildCapabilityTile('Local Storage', _deviceCapabilities!.supportsLocalStorage),
            _buildCapabilityTile('Push Notifications', _deviceCapabilities!.supportsPushNotifications),
            _buildCapabilityTile('Camera', _deviceCapabilities!.supportsCamera),
            _buildCapabilityTile('GPS', _deviceCapabilities!.supportsGPS),
            _buildCapabilityTile('Biometrics', _deviceCapabilities!.supportsBiometrics),
          ],
        ),
      ),
    );
  }

  Widget _buildCapabilityTile(String title, bool supported) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            supported ? Icons.check_circle : Icons.cancel,
            color: supported ? Colors.green : Colors.grey,
            size: 20,
          ),
          const SizedBox(width: 12),
          Text(title),
        ],
      ),
    );
  }

  Widget _buildRecommendationsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recommendations',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            _buildRecommendationTile('Max Concurrent Requests', '${_deviceCapabilities!.maxConcurrentRequests}'),
            _buildRecommendationTile('Image Quality', '${(_deviceCapabilities!.recommendedImageQuality * 100).round()}%'),
            _buildRecommendationTile('Cache Size', '${_deviceCapabilities!.recommendedCacheSize} MB'),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendationTile(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnalyticsDataCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Analytics Data',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceVariant,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _formatJson(_analyticsData!),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontFamily: 'monospace',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnalyticsActionsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Analytics Actions',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => _copyToClipboard(_formatJson(_analyticsData!)),
                    icon: const Icon(Icons.copy),
                    label: const Text('Copy JSON'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _simulateSendAnalytics,
                    icon: const Icon(Icons.send),
                    label: const Text('Send Analytics'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPerformanceBadge(DevicePerformanceCategory category) {
    Color color;
    String text;
    IconData icon;

    switch (category) {
      case DevicePerformanceCategory.high:
        color = Colors.green;
        text = 'High Performance';
        icon = Icons.flash_on;
        break;
      case DevicePerformanceCategory.medium:
        color = Colors.orange;
        text = 'Medium Performance';
        icon = Icons.speed;
        break;
      case DevicePerformanceCategory.low:
        color = Colors.red;
        text = 'Low Performance';
        icon = Icons.slow_motion_video;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 8),
          Text(
            text,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  String _getPerformanceDescription(DevicePerformanceCategory category) {
    switch (category) {
      case DevicePerformanceCategory.high:
        return 'This device has excellent performance capabilities. All features and animations can be enabled.';
      case DevicePerformanceCategory.medium:
        return 'This device has good performance capabilities. Most features can be enabled with some optimizations.';
      case DevicePerformanceCategory.low:
        return 'This device has limited performance capabilities. Features should be optimized for better experience.';
    }
  }

  String _formatJson(Map<String, dynamic> json) {
    // Простое форматирование JSON для отображения
    final buffer = StringBuffer();
    json.forEach((key, value) {
      buffer.writeln('$key: $value');
    });
    return buffer.toString();
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Copied to clipboard')),
    );
  }

  Future<void> _refreshData() async {
    DeviceUtils.clearCache();
    await _loadAdditionalInfo();
  }

  void _runCompatibilityCheck() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Compatibility Check'),
        content: const Text('Running comprehensive compatibility check...'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _simulateSendAnalytics() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Analytics data sent successfully (simulated)'),
        backgroundColor: Colors.green,
      ),
    );
  }
}
