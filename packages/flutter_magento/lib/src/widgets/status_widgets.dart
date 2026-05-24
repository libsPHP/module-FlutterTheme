import 'package:flutter/material.dart';

import '../services/service_manager.dart';
import '../services/sync_service.dart';
import '../services/cache_service.dart';
import '../services/cloud_feature_service.dart';
import '../models/result_models.dart' as models;

/// Widget that displays the current cloud connection status
class MagentoCloudStatusWidget extends StatelessWidget {
  const MagentoCloudStatusWidget({
    super.key,
    this.isCompact = false,
    this.showText = true,
    this.onTap,
  });

  final bool isCompact;
  final bool showText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MagentoServiceModeChange>(
      stream: MagentoServiceManager.instance.modeChangeStream,
      builder: (context, snapshot) {
        final status = MagentoServiceManager.instance.getDetailedStatus();

        return GestureDetector(
          onTap: onTap,
          child: isCompact
              ? _buildCompactStatus(context, status)
              : _buildFullStatus(context, status),
        );
      },
    );
  }

  Widget _buildCompactStatus(
    BuildContext context,
    MagentoServiceStatus status,
  ) {
    final (icon, color) = _getStatusIconAndColor(status);

    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 16),
          if (showText) ...[
            const SizedBox(width: 4),
            Text(
              _getStatusText(status),
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildFullStatus(BuildContext context, MagentoServiceStatus status) {
    final (icon, color) = _getStatusIconAndColor(status);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color),
                const SizedBox(width: 8),
                Text(
                  _getStatusText(status),
                  style: TextStyle(
                    color: color,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                if (status.networkOnline)
                  const Icon(Icons.cloud, color: Colors.green, size: 16)
                else
                  const Icon(Icons.cloud_off, color: Colors.grey, size: 16),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              _getStatusDescription(status),
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            if (status.cacheStats != null) ...[
              const SizedBox(height: 8),
              _buildCacheInfo(status.cacheStats!),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildCacheInfo(MagentoCacheStats cacheStats) {
    return Row(
      children: [
        const Icon(Icons.storage, size: 16, color: Colors.grey),
        const SizedBox(width: 4),
        Text(
          'Cache: ${cacheStats.itemCount} items, ${(cacheStats.hitRate * 100).toStringAsFixed(1)}% hit rate',
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }

  (IconData, Color) _getStatusIconAndColor(MagentoServiceStatus status) {
    switch (status.mode) {
      case MagentoServiceMode.hybrid:
        return (Icons.cloud_done, Colors.green);
      case MagentoServiceMode.offline:
        return (Icons.cloud_off, Colors.orange);
      case MagentoServiceMode.cloudOnly:
        return (Icons.cloud, Colors.blue);
      case MagentoServiceMode.initializing:
      case MagentoServiceMode.switching:
        return (Icons.sync, Colors.grey);
      case MagentoServiceMode.error:
        return (Icons.error, Colors.red);
    }
  }

  String _getStatusText(MagentoServiceStatus status) {
    switch (status.mode) {
      case MagentoServiceMode.hybrid:
        return 'Cloud';
      case MagentoServiceMode.offline:
        return 'Offline';
      case MagentoServiceMode.cloudOnly:
        return 'Cloud Only';
      case MagentoServiceMode.initializing:
        return 'Initializing';
      case MagentoServiceMode.switching:
        return 'Switching';
      case MagentoServiceMode.error:
        return 'Error';
    }
  }

  String _getStatusDescription(MagentoServiceStatus status) {
    switch (status.mode) {
      case MagentoServiceMode.hybrid:
        return 'Connected to cloud with offline fallback';
      case MagentoServiceMode.offline:
        return 'Working offline with local features';
      case MagentoServiceMode.cloudOnly:
        return 'Using cloud features only';
      case MagentoServiceMode.initializing:
        return 'Setting up services...';
      case MagentoServiceMode.switching:
        return 'Switching modes...';
      case MagentoServiceMode.error:
        return 'Service error occurred';
    }
  }
}

/// Widget that displays sync status and progress
class MagentoSyncIndicator extends StatelessWidget {
  const MagentoSyncIndicator({
    super.key,
    this.dataType,
    this.showProgress = true,
    this.onTap,
  });

  final String? dataType;
  final bool showProgress;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final syncService = MagentoServiceManager.instance.syncService;

    return StreamBuilder<MagentoSyncStatus>(
      stream: syncService.statusStream,
      builder: (context, snapshot) {
        final status = snapshot.data ?? MagentoSyncStatus.idle;

        return GestureDetector(
          onTap: onTap,
          child: _buildSyncIndicator(context, status),
        );
      },
    );
  }

  Widget _buildSyncIndicator(BuildContext context, MagentoSyncStatus status) {
    final (icon, color, text) = _getSyncStatusInfo(status);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (status == MagentoSyncStatus.syncing && showProgress)
            SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
            )
          else
            Icon(icon, color: color, size: 16),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  (IconData, Color, String) _getSyncStatusInfo(MagentoSyncStatus status) {
    switch (status) {
      case MagentoSyncStatus.idle:
        return (Icons.sync, Colors.grey, 'Ready');
      case MagentoSyncStatus.syncing:
        return (Icons.sync, Colors.blue, 'Syncing...');
      case MagentoSyncStatus.success:
        return (Icons.check_circle, Colors.green, 'Synced');
      case MagentoSyncStatus.error:
        return (Icons.error, Colors.red, 'Sync Error');
      case MagentoSyncStatus.paused:
        return (Icons.pause_circle, Colors.orange, 'Paused');
      case MagentoSyncStatus.conflictResolution:
        return (Icons.warning, Colors.amber, 'Conflicts');
    }
  }
}

/// Widget that displays network connection status
class MagentoConnectionIndicator extends StatelessWidget {
  const MagentoConnectionIndicator({super.key, this.showText = false});

  final bool showText;

  @override
  Widget build(BuildContext context) {
    final networkService = MagentoServiceManager.instance.networkService;

    return StreamBuilder<bool>(
      stream: networkService.isOnline
          ? Stream.value(true)
          : Stream.value(false),
      builder: (context, snapshot) {
        final isOnline = snapshot.data ?? false;

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isOnline ? Icons.wifi : Icons.wifi_off,
              color: isOnline ? Colors.green : Colors.red,
              size: 16,
            ),
            if (showText) ...[
              const SizedBox(width: 4),
              Text(
                isOnline ? 'Online' : 'Offline',
                style: TextStyle(
                  color: isOnline ? Colors.green : Colors.red,
                  fontSize: 12,
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}

/// Floating action button for manual sync
class MagentoSyncFAB extends StatefulWidget {
  const MagentoSyncFAB({super.key, this.onPressed, this.backgroundColor});

  final VoidCallback? onPressed;
  final Color? backgroundColor;

  @override
  State<MagentoSyncFAB> createState() => _MagentoSyncFABState();
}

class _MagentoSyncFABState extends State<MagentoSyncFAB>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final syncService = MagentoServiceManager.instance.syncService;

    return StreamBuilder<MagentoSyncStatus>(
      stream: syncService.statusStream,
      builder: (context, snapshot) {
        final status = snapshot.data ?? MagentoSyncStatus.idle;

        if (status == MagentoSyncStatus.syncing) {
          _animationController.repeat();
        } else {
          _animationController.stop();
        }

        return AnimatedBuilder(
          animation: _rotationAnimation,
          builder: (context, child) {
            return Transform.rotate(
              angle: _rotationAnimation.value * 2 * 3.14159,
              child: FloatingActionButton(
                onPressed: status == MagentoSyncStatus.syncing
                    ? null
                    : (widget.onPressed ?? _defaultSyncAction),
                backgroundColor:
                    widget.backgroundColor ?? _getSyncColor(status),
                child: Icon(_getSyncIcon(status)),
              ),
            );
          },
        );
      },
    );
  }

  IconData _getSyncIcon(MagentoSyncStatus status) {
    switch (status) {
      case MagentoSyncStatus.idle:
      case MagentoSyncStatus.paused:
        return Icons.sync;
      case MagentoSyncStatus.syncing:
        return Icons.sync;
      case MagentoSyncStatus.success:
        return Icons.check;
      case MagentoSyncStatus.error:
      case MagentoSyncStatus.conflictResolution:
        return Icons.sync_problem;
    }
  }

  Color _getSyncColor(MagentoSyncStatus status) {
    switch (status) {
      case MagentoSyncStatus.idle:
      case MagentoSyncStatus.paused:
        return Colors.blue;
      case MagentoSyncStatus.syncing:
        return Colors.orange;
      case MagentoSyncStatus.success:
        return Colors.green;
      case MagentoSyncStatus.error:
      case MagentoSyncStatus.conflictResolution:
        return Colors.red;
    }
  }

  void _defaultSyncAction() {
    // Trigger a manual sync
    // This would need to be implemented based on specific data types
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Manual sync triggered'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}

/// Widget that shows detailed service status
class MagentoDetailedStatusWidget extends StatelessWidget {
  const MagentoDetailedStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MagentoServiceModeChange>(
      stream: MagentoServiceManager.instance.modeChangeStream,
      builder: (context, snapshot) {
        final status = MagentoServiceManager.instance.getDetailedStatus();

        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(status),
                const SizedBox(height: 16),
                _buildServiceStates(status),
                if (status.cacheStats != null) ...[
                  const SizedBox(height: 16),
                  _buildCacheStats(status.cacheStats!),
                ],
                if (status.cloudFeatureStats != null) ...[
                  const SizedBox(height: 16),
                  _buildCloudFeatureStats(status.cloudFeatureStats!),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(MagentoServiceStatus status) {
    return Row(
      children: [
        Icon(
          status.isHealthy ? Icons.check_circle : Icons.warning,
          color: status.isHealthy ? Colors.green : Colors.orange,
        ),
        const SizedBox(width: 8),
        const Text(
          'Service Status',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Chip(
          label: Text(status.mode.name.toUpperCase()),
          backgroundColor: _getModeColor(status.mode).withValues(alpha: 0.2),
          labelStyle: TextStyle(color: _getModeColor(status.mode)),
        ),
      ],
    );
  }

  Widget _buildServiceStates(MagentoServiceStatus status) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Services', style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        ...status.serviceStates.entries.map((entry) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              children: [
                Icon(
                  entry.value ? Icons.check_circle : Icons.error,
                  color: entry.value ? Colors.green : Colors.red,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Text(entry.key.toString().split('.').last),
                const Spacer(),
                Text(
                  entry.value ? 'Healthy' : 'Error',
                  style: TextStyle(
                    color: entry.value ? Colors.green : Colors.red,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildCacheStats(MagentoCacheStats cacheStats) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Cache', style: TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _buildStatItem(
                'Items',
                cacheStats.itemCount.toString(),
                Icons.storage,
              ),
            ),
            Expanded(
              child: _buildStatItem(
                'Hit Rate',
                '${(cacheStats.hitRate * 100).toStringAsFixed(1)}%',
                Icons.speed,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: cacheStats.utilizationRate,
          backgroundColor: Colors.grey[300],
          valueColor: AlwaysStoppedAnimation<Color>(
            cacheStats.utilizationRate > 0.8 ? Colors.red : Colors.blue,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Storage: ${(cacheStats.currentSize / 1024).toStringAsFixed(1)}KB / ${(cacheStats.maxSize / 1024).toStringAsFixed(1)}KB',
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildCloudFeatureStats(
    Map<models.MagentoCloudFeatureType, MagentoCloudFeatureStats> stats,
  ) {
    final availableFeatures = stats.values.where((s) => s.isAvailable).length;
    final totalFeatures = stats.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Cloud Features',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _buildStatItem(
                'Available',
                '$availableFeatures/$totalFeatures',
                Icons.cloud,
              ),
            ),
            Expanded(
              child: _buildStatItem(
                'Premium',
                stats.values.where((s) => s.isPremium).length.toString(),
                Icons.star,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 4),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(
              label,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }

  Color _getModeColor(MagentoServiceMode mode) {
    switch (mode) {
      case MagentoServiceMode.hybrid:
        return Colors.green;
      case MagentoServiceMode.offline:
        return Colors.orange;
      case MagentoServiceMode.cloudOnly:
        return Colors.blue;
      case MagentoServiceMode.initializing:
      case MagentoServiceMode.switching:
        return Colors.grey;
      case MagentoServiceMode.error:
        return Colors.red;
    }
  }
}
