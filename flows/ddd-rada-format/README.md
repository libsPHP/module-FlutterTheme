# RADA Format

> Client-Facing Documentation  
> Last Updated: March 1, 2026  
> Version: 1.0

---

## What This Feature Does

RADA (Resource Archive for Data Application) is a portable file format that packages your entire Magento catalog into a single `.rada` file. Perfect for offline mode, demo data, and fast app initialization.

**Key Benefits**:
- Complete catalog in one file
- Works offline - no internet needed
- Fast app startup with preloaded data
- Easy to share catalogs between devices

---

## How It Works

**In Simple Terms:**

Think of RADA like a ZIP archive for your store:

1. **Export** = Packing products into a box
   - All products and categories
   - All images
   - All translations
   - Sealed with checksum

2. **Import** = Unpacking the box
   - Extract to app storage
   - Validate checksum
   - Ready to use offline

3. **Preload** = Starting with data already loaded
   - App launches with catalog
   - No waiting for API
   - Works immediately

---

## Key Benefits

- **📦 All-in-One**: Categories, products, images in single file
- **🌐 Multi-Language**: Multiple translations in one package
- **✅ Validated**: Checksum ensures data integrity
- **⚡ Fast**: Instant catalog loading
- **📱 Offline**: No internet required after import

---

## Quick Example

### Example: Exporting Catalog

**Goal**: Create .rada file from Magento store

**Steps**:
1. Configure RadaExporter with Magento URL
2. Set output path: `/path/to/catalog.rada`
3. Call `exporter.export()`
4. Wait for completion
5. Share .rada file with users

**Result**: Complete catalog in one file!

---

### Example: Importing Catalog

**Goal**: Load catalog for offline use

**Steps**:
1. Get .rada file (download, email, etc.)
2. Call `importer.import('/path/to/catalog.rada')`
3. App validates checksum
4. Catalog extracts to storage
5. Browse products offline!

**Result**: Full catalog available without internet!

---

## Common Questions

### What is a .rada file?
It's a ZIP archive containing your Magento catalog data (products, categories, images, translations).

### How big are .rada files?
Depends on catalog size. Typical: 10-100 MB for 1000 products with images.

### Can I update a .rada file?
No, .rada files are read-only. Create new version for updates.

### Do I need internet after import?
No! Once imported, catalog works completely offline.

### How do I get .rada files?
Store administrators create them with RadaExporter and share with users.

### Is data secure?
Yes! Checksum validation ensures data hasn't been tampered with.

---

## Use Cases

### 📦 Demo Catalogs
Create demo catalogs for sales teams to show products offline.

### 📱 Offline Stores
Shops in areas with poor connectivity can preload catalogs.

### 🎯 Trade Shows
Load catalog on tablets for trade show demonstrations.

### 📚 Training Data
Training apps with sample product data.

---

## Getting Started

### For Developers:

```dart
// Export
final exporter = RadaExporter(productApi: api, baseUrl: storeUrl);
await exporter.export(outputPath: '/path/to/catalog.rada');

// Import
final importer = RadaImporter();
await importer.import('/path/to/catalog.rada');

// Preload on app start
await FlutterMagento.initialize(
  baseUrl: 'https://store.com',
  enablePreloadData: true,
);
```

---

**Last Updated**: March 1, 2026  
**Version**: 1.0
