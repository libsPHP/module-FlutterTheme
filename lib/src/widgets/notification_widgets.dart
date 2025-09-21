import 'package:flutter/material.dart';

import '../services/notification_service.dart';

/// Widget that displays notifications as snackbars
class MagentoNotificationSnackbar extends StatefulWidget {
  const MagentoNotificationSnackbar({
    super.key,
    required this.child,
    this.notificationService,
    this.showAllTypes = true,
    this.minPriority = MagentoNotificationPriority.normal,
    this.duration = const Duration(seconds: 4),
  });

  final Widget child;
  final MagentoNotificationService? notificationService;
  final bool showAllTypes;
  final MagentoNotificationPriority minPriority;
  final Duration duration;

  @override
  State<MagentoNotificationSnackbar> createState() =>
      _MagentoNotificationSnackbarState();
}

class _MagentoNotificationSnackbarState
    extends State<MagentoNotificationSnackbar> {
  MagentoNotificationSubscription? _subscription;

  @override
  void initState() {
    super.initState();
    _setupNotificationListener();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  void _setupNotificationListener() {
    final service = widget.notificationService ?? MagentoNotificationService();

    _subscription = service.subscribeToAll(
      callback: _showNotification,
      minPriority: widget.minPriority,
      filter: widget.showAllTypes
          ? null
          : (notification) {
              // Filter out certain types if needed
              return notification.type != MagentoNotificationType.info;
            },
    );
  }

  void _showNotification(MagentoNotification notification) {
    if (!mounted) return;

    final messenger = ScaffoldMessenger.of(context);

    // Clear any existing snackbar
    messenger.clearSnackBars();

    final snackBar = SnackBar(
      content: _buildNotificationContent(notification),
      backgroundColor: _getNotificationColor(notification),
      duration: _getNotificationDuration(notification),
      behavior: SnackBarBehavior.floating,
      action: notification.priority == MagentoNotificationPriority.critical
          ? SnackBarAction(
              label: 'DETAILS',
              textColor: Colors.white,
              onPressed: () => _showNotificationDetails(notification),
            )
          : null,
    );

    messenger.showSnackBar(snackBar);
  }

  Widget _buildNotificationContent(MagentoNotification notification) {
    return Row(
      children: [
        Icon(_getNotificationIcon(notification), color: Colors.white, size: 20),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (notification.title != null)
                Text(
                  notification.title!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              Text(
                notification.message,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Color _getNotificationColor(MagentoNotification notification) {
    switch (notification.type) {
      case MagentoNotificationType.error:
        return Colors.red;
      case MagentoNotificationType.warning:
        return Colors.orange;
      case MagentoNotificationType.success:
        return Colors.green;
      case MagentoNotificationType.info:
        return Colors.blue;
      case MagentoNotificationType.sync:
        return Colors.purple;
      case MagentoNotificationType.cloudFeature:
        return Colors.indigo;
      case MagentoNotificationType.network:
        return Colors.teal;
      case MagentoNotificationType.auth:
        return Colors.amber;
      case MagentoNotificationType.cache:
        return Colors.grey;
    }
  }

  IconData _getNotificationIcon(MagentoNotification notification) {
    switch (notification.type) {
      case MagentoNotificationType.error:
        return Icons.error;
      case MagentoNotificationType.warning:
        return Icons.warning;
      case MagentoNotificationType.success:
        return Icons.check_circle;
      case MagentoNotificationType.info:
        return Icons.info;
      case MagentoNotificationType.sync:
        return Icons.sync;
      case MagentoNotificationType.cloudFeature:
        return Icons.cloud;
      case MagentoNotificationType.network:
        return Icons.wifi;
      case MagentoNotificationType.auth:
        return Icons.person;
      case MagentoNotificationType.cache:
        return Icons.storage;
    }
  }

  Duration _getNotificationDuration(MagentoNotification notification) {
    switch (notification.priority) {
      case MagentoNotificationPriority.low:
        return const Duration(seconds: 2);
      case MagentoNotificationPriority.normal:
        return widget.duration;
      case MagentoNotificationPriority.high:
        return const Duration(seconds: 6);
      case MagentoNotificationPriority.critical:
        return const Duration(seconds: 10);
    }
  }

  void _showNotificationDetails(MagentoNotification notification) {
    showDialog(
      context: context,
      builder: (context) =>
          MagentoNotificationDialog(notification: notification),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

/// Dialog that shows detailed notification information
class MagentoNotificationDialog extends StatelessWidget {
  const MagentoNotificationDialog({super.key, required this.notification});

  final MagentoNotification notification;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Icon(
            _getNotificationIcon(notification.type),
            color: _getNotificationColor(notification.type),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              notification.title ?? _getDefaultTitle(notification.type),
            ),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(notification.message),
            const SizedBox(height: 16),
            _buildMetadata(),
            if (notification.data != null) ...[
              const SizedBox(height: 16),
              _buildDataSection(),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
      ],
    );
  }

  Widget _buildMetadata() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Details', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        _buildMetadataRow('Type', notification.type.name),
        _buildMetadataRow('Priority', notification.priority.name),
        _buildMetadataRow('Time', _formatTimestamp(notification.timestamp)),
        _buildMetadataRow('Age', _formatDuration(notification.age)),
        if (notification.expiresAt != null)
          _buildMetadataRow(
            'Expires',
            _formatTimestamp(notification.expiresAt!),
          ),
      ],
    );
  }

  Widget _buildDataSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Additional Data',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            _formatData(notification.data!),
            style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildMetadataRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  IconData _getNotificationIcon(MagentoNotificationType type) {
    switch (type) {
      case MagentoNotificationType.error:
        return Icons.error;
      case MagentoNotificationType.warning:
        return Icons.warning;
      case MagentoNotificationType.success:
        return Icons.check_circle;
      case MagentoNotificationType.info:
        return Icons.info;
      case MagentoNotificationType.sync:
        return Icons.sync;
      case MagentoNotificationType.cloudFeature:
        return Icons.cloud;
      case MagentoNotificationType.network:
        return Icons.wifi;
      case MagentoNotificationType.auth:
        return Icons.person;
      case MagentoNotificationType.cache:
        return Icons.storage;
    }
  }

  Color _getNotificationColor(MagentoNotificationType type) {
    switch (type) {
      case MagentoNotificationType.error:
        return Colors.red;
      case MagentoNotificationType.warning:
        return Colors.orange;
      case MagentoNotificationType.success:
        return Colors.green;
      case MagentoNotificationType.info:
        return Colors.blue;
      case MagentoNotificationType.sync:
        return Colors.purple;
      case MagentoNotificationType.cloudFeature:
        return Colors.indigo;
      case MagentoNotificationType.network:
        return Colors.teal;
      case MagentoNotificationType.auth:
        return Colors.amber;
      case MagentoNotificationType.cache:
        return Colors.grey;
    }
  }

  String _getDefaultTitle(MagentoNotificationType type) {
    switch (type) {
      case MagentoNotificationType.error:
        return 'Error';
      case MagentoNotificationType.warning:
        return 'Warning';
      case MagentoNotificationType.success:
        return 'Success';
      case MagentoNotificationType.info:
        return 'Information';
      case MagentoNotificationType.sync:
        return 'Sync';
      case MagentoNotificationType.cloudFeature:
        return 'Cloud Feature';
      case MagentoNotificationType.network:
        return 'Network';
      case MagentoNotificationType.auth:
        return 'Authentication';
      case MagentoNotificationType.cache:
        return 'Cache';
    }
  }

  String _formatTimestamp(DateTime timestamp) {
    return '${timestamp.day}/${timestamp.month}/${timestamp.year} '
        '${timestamp.hour.toString().padLeft(2, '0')}:'
        '${timestamp.minute.toString().padLeft(2, '0')}';
  }

  String _formatDuration(Duration duration) {
    if (duration.inDays > 0) {
      return '${duration.inDays}d ${duration.inHours % 24}h';
    } else if (duration.inHours > 0) {
      return '${duration.inHours}h ${duration.inMinutes % 60}m';
    } else if (duration.inMinutes > 0) {
      return '${duration.inMinutes}m ${duration.inSeconds % 60}s';
    } else {
      return '${duration.inSeconds}s';
    }
  }

  String _formatData(Map<String, dynamic> data) {
    final buffer = StringBuffer();
    for (final entry in data.entries) {
      buffer.writeln('${entry.key}: ${entry.value}');
    }
    return buffer.toString().trim();
  }
}

/// Widget that displays a list of recent notifications
class MagentoNotificationList extends StatefulWidget {
  const MagentoNotificationList({
    super.key,
    this.notificationService,
    this.limit = 50,
    this.showFilters = true,
  });

  final MagentoNotificationService? notificationService;
  final int limit;
  final bool showFilters;

  @override
  State<MagentoNotificationList> createState() =>
      _MagentoNotificationListState();
}

class _MagentoNotificationListState extends State<MagentoNotificationList> {
  late MagentoNotificationService _service;
  MagentoNotificationType? _filterType;
  MagentoNotificationPriority? _filterPriority;

  @override
  void initState() {
    super.initState();
    _service = widget.notificationService ?? MagentoNotificationService();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.showFilters) _buildFilters(),
        Expanded(child: _buildNotificationList()),
      ],
    );
  }

  Widget _buildFilters() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: DropdownButton<MagentoNotificationType?>(
                value: _filterType,
                hint: const Text('All Types'),
                isExpanded: true,
                onChanged: (value) {
                  setState(() {
                    _filterType = value;
                  });
                },
                items: [
                  const DropdownMenuItem<MagentoNotificationType?>(
                    value: null,
                    child: Text('All Types'),
                  ),
                  ...MagentoNotificationType.values.map((type) {
                    return DropdownMenuItem<MagentoNotificationType?>(
                      value: type,
                      child: Text(type.name.toUpperCase()),
                    );
                  }),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: DropdownButton<MagentoNotificationPriority?>(
                value: _filterPriority,
                hint: const Text('All Priorities'),
                isExpanded: true,
                onChanged: (value) {
                  setState(() {
                    _filterPriority = value;
                  });
                },
                items: [
                  const DropdownMenuItem<MagentoNotificationPriority?>(
                    value: null,
                    child: Text('All Priorities'),
                  ),
                  ...MagentoNotificationPriority.values.map((priority) {
                    return DropdownMenuItem<MagentoNotificationPriority?>(
                      value: priority,
                      child: Text(priority.name.toUpperCase()),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationList() {
    final notifications = _service.getHistory(
      type: _filterType,
      minPriority: _filterPriority,
      limit: widget.limit,
    );

    if (notifications.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.notifications_none, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No notifications',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return _buildNotificationTile(notification);
      },
    );
  }

  Widget _buildNotificationTile(MagentoNotification notification) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _getNotificationColor(
            notification.type,
          ).withValues(alpha: 0.2),
          child: Icon(
            _getNotificationIcon(notification.type),
            color: _getNotificationColor(notification.type),
          ),
        ),
        title: Text(
          notification.title ?? _getDefaultTitle(notification.type),
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(notification.message),
            const SizedBox(height: 4),
            Row(
              children: [
                Chip(
                  label: Text(
                    notification.priority.name.toUpperCase(),
                    style: const TextStyle(fontSize: 10),
                  ),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity.compact,
                ),
                const SizedBox(width: 8),
                Text(
                  _formatTimestamp(notification.timestamp),
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        trailing: notification.data != null
            ? const Icon(Icons.info_outline)
            : null,
        onTap: () {
          showDialog(
            context: context,
            builder: (context) =>
                MagentoNotificationDialog(notification: notification),
          );
        },
      ),
    );
  }

  IconData _getNotificationIcon(MagentoNotificationType type) {
    switch (type) {
      case MagentoNotificationType.error:
        return Icons.error;
      case MagentoNotificationType.warning:
        return Icons.warning;
      case MagentoNotificationType.success:
        return Icons.check_circle;
      case MagentoNotificationType.info:
        return Icons.info;
      case MagentoNotificationType.sync:
        return Icons.sync;
      case MagentoNotificationType.cloudFeature:
        return Icons.cloud;
      case MagentoNotificationType.network:
        return Icons.wifi;
      case MagentoNotificationType.auth:
        return Icons.person;
      case MagentoNotificationType.cache:
        return Icons.storage;
    }
  }

  Color _getNotificationColor(MagentoNotificationType type) {
    switch (type) {
      case MagentoNotificationType.error:
        return Colors.red;
      case MagentoNotificationType.warning:
        return Colors.orange;
      case MagentoNotificationType.success:
        return Colors.green;
      case MagentoNotificationType.info:
        return Colors.blue;
      case MagentoNotificationType.sync:
        return Colors.purple;
      case MagentoNotificationType.cloudFeature:
        return Colors.indigo;
      case MagentoNotificationType.network:
        return Colors.teal;
      case MagentoNotificationType.auth:
        return Colors.amber;
      case MagentoNotificationType.cache:
        return Colors.grey;
    }
  }

  String _getDefaultTitle(MagentoNotificationType type) {
    switch (type) {
      case MagentoNotificationType.error:
        return 'Error';
      case MagentoNotificationType.warning:
        return 'Warning';
      case MagentoNotificationType.success:
        return 'Success';
      case MagentoNotificationType.info:
        return 'Information';
      case MagentoNotificationType.sync:
        return 'Sync';
      case MagentoNotificationType.cloudFeature:
        return 'Cloud Feature';
      case MagentoNotificationType.network:
        return 'Network';
      case MagentoNotificationType.auth:
        return 'Authentication';
      case MagentoNotificationType.cache:
        return 'Cache';
    }
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}
