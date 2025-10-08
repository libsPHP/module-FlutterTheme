import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import '../models/rada_models.dart';
import 'rada_importer.dart';

/// Service for handling RADA preload data
class RadaPreloadService {
  final RadaImporter _importer;
  RadaPackage? _preloadedPackage;

  RadaPreloadService({RadaImporter? importer})
    : _importer = importer ?? RadaImporter();

  /// Load preload data from assets
  Future<RadaPackage?> loadFromAssets(String assetPath) async {
    try {
      // Load asset data
      final byteData = await rootBundle.load(assetPath);
      final bytes = byteData.buffer.asUint8List();

      // Save to temporary file
      final tempDir = await getTemporaryDirectory();
      final tempFile = File('${tempDir.path}/preload_temp.rada');
      await tempFile.writeAsBytes(bytes);

      // Import from file
      final result = await _importer.importFromFile(tempFile.path);

      // Clean up temp file
      await tempFile.delete();

      if (result.success && result.package != null) {
        _preloadedPackage = result.package;
        return result.package;
      }

      return null;
    } catch (e) {
      print('Failed to load preload data from assets: $e');
      return null;
    }
  }

  /// Load preload data from file path
  Future<RadaPackage?> loadFromFile(String filePath) async {
    try {
      final result = await _importer.importFromFile(filePath);

      if (result.success && result.package != null) {
        _preloadedPackage = result.package;
        return result.package;
      }

      return null;
    } catch (e) {
      print('Failed to load preload data from file: $e');
      return null;
    }
  }

  /// Get cached preloaded package
  RadaPackage? get preloadedPackage => _preloadedPackage;

  /// Check if preload data is available
  bool get hasPreloadData => _preloadedPackage != null;

  /// Clear preloaded data
  void clearPreload() {
    _preloadedPackage = null;
  }

  /// Get preload info without loading full package
  Future<RadaManifest?> getPreloadInfo(String assetPath) async {
    try {
      // Load asset data
      final byteData = await rootBundle.load(assetPath);
      final bytes = byteData.buffer.asUint8List();

      // Save to temporary file
      final tempDir = await getTemporaryDirectory();
      final tempFile = File('${tempDir.path}/preload_info_temp.rada');
      await tempFile.writeAsBytes(bytes);

      // Get info
      final info = await _importer.getArchiveInfo(tempFile.path);

      // Clean up temp file
      await tempFile.delete();

      return info;
    } catch (e) {
      print('Failed to get preload info: $e');
      return null;
    }
  }
}
