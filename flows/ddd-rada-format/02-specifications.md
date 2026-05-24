# Specifications: RADA Format

> Version: 1.0 (Retrospective)  
> Status: APPROVED  
> Last Updated: March 1, 2026

---

## Overview

RADA (Resource Archive for Data Application) - portable archive format для Magento каталогов.

---

## Architecture

### RADA File Structure

```
catalog.rada/
├── manifest.json          # Metadata, version, checksums
├── data.json              # Categories, products structure
├── l10n/
│   ├── en.json           # English translations
│   ├── ru.json           # Russian translations
│   └── de.json           # German translations
├── assets/
│   ├── products/
│   │   ├── image1.jpg
│   │   └── image2.jpg
│   └── categories/
│       └── cat_image.png
└── checksums.sha256       # File integrity
```

---

## Components

### RadaService

```dart
class RadaService {
  Future<File> createArchive(RadaPackage package, String outputPath);
  Future<RadaPackage> extractArchive(String archivePath);
  Future<bool> validateArchive(String archivePath);
}
```

### RadaExporter

```dart
class RadaExporter {
  Future<void> export({String outputPath});
  Future<void> addProduct(Product product);
  Future<void> addCategory(Category category);
}
```

### RadaImporter

```dart
class RadaImporter {
  Future<RadaPackage> import(String archivePath);
  Future<bool> validate(String archivePath);
}
```

---

## Data Models

### RadaPackage

```dart
@freezed
class RadaPackage with _$RadaPackage {
  const factory RadaPackage({
    required RadaManifest manifest,
    required RadaData data,
    required Map<String, RadaLocalization> localizations,
    required Map<String, List<int>> images,
  }) = _RadaPackage;
}
```

### RadaManifest

```dart
@freezed
class RadaManifest with _$RadaManifest {
  const factory RadaManifest({
    required String version,
    required String createdAt,
    required String magentoVersion,
    required int productCount,
    required int categoryCount,
    required Map<String, String> checksums,
  }) = _RadaManifest;
}
```

---

## Approval

- [x] Approved on: March 1, 2026
