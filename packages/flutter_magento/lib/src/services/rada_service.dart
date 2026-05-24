import 'dart:convert';
import 'dart:io';
import 'package:archive/archive.dart';
import 'package:crypto/crypto.dart';
import 'package:path/path.dart' as path;
import '../models/rada_models.dart';

/// Service for working with RADA format
class RadaService {
  static const String _manifestFile = 'manifest.json';
  static const String _mainFile = 'data.json';
  static const String _assetsDir = 'assets';
  static const String _l10nDir = 'l10n';
  static const String _categoriesDir = 'categories';
  static const String _productsDir = 'products';

  /// Create RADA archive from package
  Future<File> createArchive(RadaPackage package, String outputPath) async {
    final archive = Archive();

    // Add manifest
    final manifestJson = jsonEncode(package.manifest.toJson());
    archive.addFile(
      _createArchiveFile(_manifestFile, utf8.encode(manifestJson)),
    );

    // Add main data
    final mainJson = jsonEncode(package.data.toJson());
    archive.addFile(_createArchiveFile(_mainFile, utf8.encode(mainJson)));

    // Add localizations
    for (final entry in package.localizations.entries) {
      final locale = entry.key;
      final localization = entry.value;
      final l10nJson = jsonEncode(localization.toJson());
      archive.addFile(
        _createArchiveFile('$_l10nDir/$locale.json', utf8.encode(l10nJson)),
      );
    }

    // Add images
    for (final entry in package.images.entries) {
      final imagePath = entry.key;
      final imageData = entry.value;
      archive.addFile(_createArchiveFile(imagePath, imageData));
    }

    // Encode to ZIP
    final zipData = ZipEncoder().encode(archive);
    if (zipData == null) {
      throw Exception('Failed to create ZIP archive');
    }

    // Write to file
    final file = File(outputPath);
    await file.create(recursive: true);
    await file.writeAsBytes(zipData);

    return file;
  }

  /// Extract RADA archive to package
  Future<RadaPackage> extractArchive(String archivePath) async {
    final file = File(archivePath);
    if (!await file.exists()) {
      throw Exception('Archive file not found: $archivePath');
    }

    final bytes = await file.readAsBytes();
    final archive = ZipDecoder().decodeBytes(bytes);

    // Extract manifest
    final manifestFile = _findFile(archive, _manifestFile);
    if (manifestFile == null) {
      throw Exception('Manifest file not found in archive');
    }
    final manifestJson =
        jsonDecode(utf8.decode(manifestFile.content as List<int>))
            as Map<String, dynamic>;
    final manifest = RadaManifest.fromJson(manifestJson);

    // Validate format version
    if (manifest.version != '1.0') {
      throw Exception('Unsupported RADA format version: ${manifest.version}');
    }

    // Extract main data
    final mainFile = _findFile(archive, _mainFile);
    if (mainFile == null) {
      throw Exception('Main data file not found in archive');
    }
    final mainJson =
        jsonDecode(utf8.decode(mainFile.content as List<int>))
            as Map<String, dynamic>;
    final data = RadaData.fromJson(mainJson);

    // Extract localizations
    final localizations = <String, RadaLocalization>{};
    for (final file in archive.files) {
      if (file.name.startsWith(_l10nDir) && file.name.endsWith('.json')) {
        final locale = path.basenameWithoutExtension(file.name);
        final l10nJson =
            jsonDecode(utf8.decode(file.content as List<int>))
                as Map<String, dynamic>;
        localizations[locale] = RadaLocalization.fromJson(l10nJson);
      }
    }

    // Extract images
    final images = <String, List<int>>{};
    for (final file in archive.files) {
      if (file.name.startsWith(_assetsDir) && !file.isFile) continue;
      if (file.name.startsWith(_assetsDir)) {
        images[file.name] = file.content as List<int>;
      }
    }

    return RadaPackage(
      manifest: manifest,
      data: data,
      localizations: localizations,
      images: images,
    );
  }

  /// Validate RADA archive
  Future<bool> validateArchive(String archivePath) async {
    try {
      final package = await extractArchive(archivePath);

      // Validate manifest
      if (package.manifest.format != 'rada') {
        return false;
      }

      // Validate checksums
      final mainJson = jsonEncode(package.data.toJson());
      final mainChecksum = sha256.convert(utf8.encode(mainJson)).toString();
      if (mainChecksum != package.manifest.checksums.main) {
        return false;
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  /// Get archive info without full extraction
  Future<RadaManifest> getArchiveInfo(String archivePath) async {
    final file = File(archivePath);
    if (!await file.exists()) {
      throw Exception('Archive file not found: $archivePath');
    }

    final bytes = await file.readAsBytes();
    final archive = ZipDecoder().decodeBytes(bytes);

    final manifestFile = _findFile(archive, _manifestFile);
    if (manifestFile == null) {
      throw Exception('Manifest file not found in archive');
    }

    final manifestJson =
        jsonDecode(utf8.decode(manifestFile.content as List<int>))
            as Map<String, dynamic>;
    return RadaManifest.fromJson(manifestJson);
  }

  /// Calculate checksums for package
  RadaChecksums calculateChecksums(RadaPackage package) {
    final mainJson = jsonEncode(package.data.toJson());
    final mainChecksum = sha256.convert(utf8.encode(mainJson)).toString();

    var assetsData = <int>[];
    for (final imageData in package.images.values) {
      assetsData.addAll(imageData);
    }
    final assetsChecksum = sha256.convert(assetsData).toString();

    var l10nData = <int>[];
    for (final localization in package.localizations.values) {
      final l10nJson = jsonEncode(localization.toJson());
      l10nData.addAll(utf8.encode(l10nJson));
    }
    final l10nChecksum = sha256.convert(l10nData).toString();

    return RadaChecksums(
      main: mainChecksum,
      assets: assetsChecksum,
      l10n: l10nChecksum,
    );
  }

  /// Helper to create archive file
  ArchiveFile _createArchiveFile(String name, List<int> data) {
    return ArchiveFile(name, data.length, data);
  }

  /// Helper to find file in archive
  ArchiveFile? _findFile(Archive archive, String name) {
    try {
      return archive.files.firstWhere((file) => file.name == name);
    } catch (e) {
      return null;
    }
  }

  /// Get asset path for category image
  String getCategoryImagePath(int categoryId, String extension) {
    return '$_assetsDir/$_categoriesDir/$categoryId.$extension';
  }

  /// Get asset path for product image
  String getProductImagePath(String sku, String filename) {
    return '$_assetsDir/$_productsDir/$sku/$filename';
  }
}
