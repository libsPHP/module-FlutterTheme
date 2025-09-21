import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// Service for managing image caching and optimization
class ImageCacheService extends ChangeNotifier {
  static final ImageCacheService _instance = ImageCacheService._internal();
  factory ImageCacheService() => _instance;
  ImageCacheService._internal();

  static const int maxCacheSize = 100 * 1024 * 1024; // 100MB
  static const Duration defaultCacheDuration = Duration(days: 7);

  final Map<String, Completer<void>> _preloadingImages = {};
  final Set<String> _preloadedUrls = {};

  /// Initialize the image cache service
  Future<void> initialize() async {
    await _cleanupOldCache();
  }

  /// Get optimized image URL based on device characteristics
  String getOptimizedImageUrl(
    String originalUrl, {
    int? width,
    int? height,
    ImageQuality quality = ImageQuality.medium,
  }) {
    if (originalUrl.isEmpty) return originalUrl;

    // Get device pixel ratio for optimal sizing
    final devicePixelRatio =
        WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;

    // Calculate optimal dimensions
    final optimalWidth =
        width != null ? (width * devicePixelRatio).round() : null;
    final optimalHeight =
        height != null ? (height * devicePixelRatio).round() : null;

    // For Magento, append resize parameters if URL supports it
    if (originalUrl.contains('magento') ||
        originalUrl.contains('media/catalog')) {
      final uri = Uri.parse(originalUrl);
      final queryParams = Map<String, String>.from(uri.queryParameters);

      if (optimalWidth != null) queryParams['width'] = optimalWidth.toString();
      if (optimalHeight != null)
        queryParams['height'] = optimalHeight.toString();
      queryParams['quality'] = quality.value.toString();

      return uri.replace(queryParameters: queryParams).toString();
    }

    return originalUrl;
  }

  /// Preload images for better user experience
  Future<void> preloadImages(
    List<String> imageUrls, {
    int? width,
    int? height,
  }) async {
    final futures =
        imageUrls.map((url) => preloadImage(url, width: width, height: height));
    await Future.wait(futures);
  }

  /// Preload a single image
  Future<void> preloadImage(
    String imageUrl, {
    int? width,
    int? height,
  }) async {
    if (imageUrl.isEmpty || _preloadedUrls.contains(imageUrl)) return;

    // Avoid duplicate preloading
    if (_preloadingImages.containsKey(imageUrl)) {
      return _preloadingImages[imageUrl]!.future;
    }

    final completer = Completer<void>();
    _preloadingImages[imageUrl] = completer;

    try {
      final optimizedUrl =
          getOptimizedImageUrl(imageUrl, width: width, height: height);
      await precacheImage(CachedNetworkImageProvider(optimizedUrl),
          NavigationService.navigatorKey.currentContext!);
      _preloadedUrls.add(imageUrl);
      completer.complete();
    } catch (e) {
      if (kDebugMode) {
        print('Failed to preload image $imageUrl: $e');
      }
      completer.completeError(e);
    } finally {
      _preloadingImages.remove(imageUrl);
    }
  }

  /// Create cached network image widget with optimizations
  Widget buildCachedImage({
    required String imageUrl,
    int? width,
    int? height,
    BoxFit fit = BoxFit.cover,
    Widget Function(BuildContext, String)? placeholder,
    Widget Function(BuildContext, String, dynamic)? errorWidget,
    Duration fadeInDuration = const Duration(milliseconds: 300),
    bool enableLazyLoading = true,
  }) {
    if (imageUrl.isEmpty) {
      return errorWidget?.call(NavigationService.navigatorKey.currentContext!,
              imageUrl, 'Empty URL') ??
          _buildDefaultPlaceholder();
    }

    final optimizedUrl =
        getOptimizedImageUrl(imageUrl, width: width, height: height);

    if (enableLazyLoading) {
      return _LazyLoadingImage(
        imageUrl: optimizedUrl,
        width: width?.toDouble(),
        height: height?.toDouble(),
        fit: fit,
        placeholder: placeholder,
        errorWidget: errorWidget,
        fadeInDuration: fadeInDuration,
      );
    }

    return CachedNetworkImage(
      imageUrl: optimizedUrl,
      width: width?.toDouble(),
      height: height?.toDouble(),
      fit: fit,
      fadeInDuration: fadeInDuration,
      placeholder: placeholder,
      errorWidget:
          errorWidget ?? (context, url, error) => _buildDefaultPlaceholder(),
      cacheManager: DefaultCacheManager(),
      memCacheWidth: width,
      memCacheHeight: height,
    );
  }

  /// Clear image cache
  Future<void> clearCache() async {
    await DefaultCacheManager().emptyCache();
    _preloadedUrls.clear();
    notifyListeners();
  }

  /// Get cache statistics
  Future<Map<String, dynamic>> getCacheStats() async {
    try {
      final cacheDir = await getTemporaryDirectory();
      final libCachedImageDataDir =
          Directory('${cacheDir.path}/libCachedImageData');

      if (!libCachedImageDataDir.existsSync()) {
        return {'size': 0, 'files': 0};
      }

      int totalSize = 0;
      int fileCount = 0;

      await for (final entity in libCachedImageDataDir.list(recursive: true)) {
        if (entity is File) {
          totalSize += await entity.length();
          fileCount++;
        }
      }

      return {
        'size': totalSize,
        'files': fileCount,
        'preloaded': _preloadedUrls.length,
      };
    } catch (e) {
      return {'size': 0, 'files': 0, 'preloaded': _preloadedUrls.length};
    }
  }

  Widget _buildDefaultPlaceholder() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(
        child: Icon(
          Icons.image_outlined,
          size: 32,
          color: Colors.grey,
        ),
      ),
    );
  }

  Future<void> _cleanupOldCache() async {
    try {
      await DefaultCacheManager().emptyCache();
    } catch (e) {
      if (kDebugMode) {
        print('Failed to cleanup old cache: $e');
      }
    }
  }
}

/// Enum for image quality levels
enum ImageQuality {
  low(60),
  medium(80),
  high(95);

  const ImageQuality(this.value);
  final int value;
}

/// Lazy loading image widget with visibility detection
class _LazyLoadingImage extends StatefulWidget {
  const _LazyLoadingImage({
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
    this.fadeInDuration = const Duration(milliseconds: 300),
  });

  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget Function(BuildContext, String)? placeholder;
  final Widget Function(BuildContext, String, dynamic)? errorWidget;
  final Duration fadeInDuration;

  @override
  State<_LazyLoadingImage> createState() => _LazyLoadingImageState();
}

class _LazyLoadingImageState extends State<_LazyLoadingImage> {
  bool _shouldLoad = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.imageUrl),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1 && !_shouldLoad) {
          setState(() {
            _shouldLoad = true;
          });
        }
      },
      child: _shouldLoad
          ? CachedNetworkImage(
              imageUrl: widget.imageUrl,
              width: widget.width,
              height: widget.height,
              fit: widget.fit,
              fadeInDuration: widget.fadeInDuration,
              placeholder: widget.placeholder,
              errorWidget: widget.errorWidget ??
                  (context, url, error) =>
                      ImageCacheService()._buildDefaultPlaceholder(),
              memCacheWidth: widget.width?.toInt(),
              memCacheHeight: widget.height?.toInt(),
            )
          : widget.placeholder?.call(context, widget.imageUrl) ??
              ImageCacheService()._buildDefaultPlaceholder(),
    );
  }
}

/// Navigation service for accessing context globally
class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
