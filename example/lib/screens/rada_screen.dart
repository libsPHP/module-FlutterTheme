import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_magento/flutter_magento.dart';
import '../providers/app_provider.dart';
import 'dart:io';

class RadaScreen extends StatefulWidget {
  const RadaScreen({super.key});

  @override
  State<RadaScreen> createState() => _RadaScreenState();
}

class _RadaScreenState extends State<RadaScreen> {
  bool _isExporting = false;
  bool _isImporting = false;
  String? _lastExportPath;
  RadaImportResult? _lastImportResult;
  RadaManifest? _selectedFileInfo;

  final _radaService = RadaService();
  final _radaImporter = RadaImporter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RADA Format'),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: _showFormatInfo,
          ),
        ],
      ),
      body: Consumer<AppProvider>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildInfoCard(),
                const SizedBox(height: 16),
                _buildExportSection(provider),
                const SizedBox(height: 16),
                _buildImportSection(provider),
                const SizedBox(height: 16),
                _buildPreloadSection(provider),
                if (_lastImportResult != null) ...[
                  const SizedBox(height: 16),
                  _buildImportResultCard(),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.archive, color: Theme.of(context).primaryColor),
                const SizedBox(width: 8),
                const Text(
                  'RADA Format',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'RADA - формат для хранения данных Magento категорий с продуктами, изображениями, отзывами и переводами в одном ZIP архиве.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            const Text(
              '• Экспорт категорий с продуктами\n'
              '• Импорт данных для офлайн-работы\n'
              '• Preload для быстрого старта',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExportSection(AppProvider provider) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Экспорт данных',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'Выгрузить категорию с продуктами в .rada файл',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            if (!provider.isInitialized)
              const Text(
                'Настройте Magento API в разделе Config',
                style: TextStyle(color: Colors.orange),
              )
            else if (provider.categories.isEmpty)
              const Text(
                'Загрузите категории в разделе Categories',
                style: TextStyle(color: Colors.orange),
              )
            else ...[
              DropdownButtonFormField<int>(
                decoration: const InputDecoration(
                  labelText: 'Выберите категорию',
                  border: OutlineInputBorder(),
                ),
                items: provider.categories.map((category) {
                  return DropdownMenuItem<int>(
                    value: category.id,
                    child: Text(category.name),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategoryId = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: _isExporting || _selectedCategoryId == null
                    ? null
                    : () => _exportCategory(provider),
                icon: _isExporting
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.download),
                label: Text(_isExporting ? 'Экспорт...' : 'Экспортировать'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                ),
              ),
            ],
            if (_lastExportPath != null) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle, color: Colors.green),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Экспортировано: $_lastExportPath',
                        style: const TextStyle(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  int? _selectedCategoryId;

  Widget _buildImportSection(AppProvider provider) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Импорт данных',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'Загрузить данные из .rada файла',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _isImporting
                  ? null
                  : () => _selectAndImportFile(provider),
              icon: _isImporting
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.upload_file),
              label: Text(_isImporting ? 'Импорт...' : 'Выбрать файл'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
              ),
            ),
            if (_selectedFileInfo != null) ...[
              const SizedBox(height: 12),
              _buildFileInfoCard(_selectedFileInfo!),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildFileInfoCard(RadaManifest manifest) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            manifest.source.categoryName,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          _buildInfoRow('Категорий', manifest.stats.categoriesCount.toString()),
          _buildInfoRow('Продуктов', manifest.stats.productsCount.toString()),
          _buildInfoRow('Изображений', manifest.stats.imagesCount.toString()),
          _buildInfoRow('Отзывов', manifest.stats.reviewsCount.toString()),
          _buildInfoRow('Языков', manifest.stats.localesCount.toString()),
          const SizedBox(height: 8),
          Text(
            'Создано: ${_formatDate(manifest.createdAt)}',
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 14)),
          Text(
            value,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildPreloadSection(AppProvider provider) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.flash_on, color: Theme.of(context).primaryColor),
                const SizedBox(width: 8),
                const Text(
                  'Preload данные',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'Загрузить предустановленные данные для быстрого старта',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => _loadPreloadData(provider),
              icon: const Icon(Icons.rocket_launch),
              label: const Text('Загрузить Preload'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                backgroundColor: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImportResultCard() {
    final result = _lastImportResult!;
    final isSuccess = result.success;

    return Card(
      color: isSuccess
          ? Colors.green.withValues(alpha: 0.1)
          : Colors.red.withValues(alpha: 0.1),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  isSuccess ? Icons.check_circle : Icons.error,
                  color: isSuccess ? Colors.green : Colors.red,
                ),
                const SizedBox(width: 8),
                Text(
                  isSuccess ? 'Импорт успешен' : 'Ошибка импорта',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isSuccess ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
            if (isSuccess) ...[
              const SizedBox(height: 12),
              _buildInfoRow('Категорий', result.categoriesImported.toString()),
              _buildInfoRow('Продуктов', result.productsImported.toString()),
              _buildInfoRow('Изображений', result.imagesImported.toString()),
              _buildInfoRow('Отзывов', result.reviewsImported.toString()),
            ] else if (result.error != null) ...[
              const SizedBox(height: 12),
              Text(result.error!, style: const TextStyle(color: Colors.red)),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _exportCategory(AppProvider provider) async {
    if (_selectedCategoryId == null) return;

    setState(() {
      _isExporting = true;
      _lastExportPath = null;
    });

    try {
      final category = provider.categories.firstWhere(
        (c) => c.id == _selectedCategoryId,
      );

      // Get output directory
      final directory = await getApplicationDocumentsDirectory();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final outputPath =
          '${directory.path}/rada_export_${category.id}_$timestamp.rada';

      // Create exporter (simplified - you may need to adjust based on your API)
      final exporter = RadaExporter(
        productApi: provider.productApi!,
        baseUrl: provider.baseUrl!,
      );

      // Export options
      final options = RadaExportOptions(
        categoryId: _selectedCategoryId!,
        includeSubcategories: true,
        includeProducts: true,
        includeReviews: true,
        includeImages: true,
        locales: ['en', 'ru'],
      );

      // Export
      final file = await exporter.exportCategory(options, outputPath);

      setState(() {
        _lastExportPath = file.path;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Экспортировано: ${file.path}'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Ошибка экспорта: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      setState(() {
        _isExporting = false;
      });
    }
  }

  Future<void> _selectAndImportFile(AppProvider provider) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['rada', 'zip'],
      );

      if (result != null && result.files.single.path != null) {
        final filePath = result.files.single.path!;

        // Get file info
        final info = await _radaService.getArchiveInfo(filePath);
        setState(() {
          _selectedFileInfo = info;
        });

        // Show confirmation dialog
        if (mounted) {
          final confirmed = await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Подтвердите импорт'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Категория: ${info.source.categoryName}'),
                  Text('Продуктов: ${info.stats.productsCount}'),
                  Text('Изображений: ${info.stats.imagesCount}'),
                  const SizedBox(height: 8),
                  const Text(
                    'Импортировать эти данные?',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('Отмена'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text('Импортировать'),
                ),
              ],
            ),
          );

          if (confirmed == true) {
            await _importFile(filePath, provider);
          }
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Ошибка выбора файла: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _importFile(String filePath, AppProvider provider) async {
    setState(() {
      _isImporting = true;
      _lastImportResult = null;
    });

    try {
      final result = await _radaImporter.importFromFile(filePath);

      setState(() {
        _lastImportResult = result;
      });

      if (result.success && result.package != null) {
        // Load data into provider
        await provider.loadFromRadaPackage(result.package!);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Данные успешно импортированы'),
              backgroundColor: Colors.green,
            ),
          );
        }
      }
    } catch (e) {
      setState(() {
        _lastImportResult = RadaImportResult(
          success: false,
          package: null,
          error: e.toString(),
          categoriesImported: 0,
          productsImported: 0,
          imagesImported: 0,
          reviewsImported: 0,
          importedAt: DateTime.now(),
        );
      });
    } finally {
      setState(() {
        _isImporting = false;
      });
    }
  }

  Future<void> _loadPreloadData(AppProvider provider) async {
    // This would load a prebuilt .rada file from assets
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Preload функция будет доступна после добавления .rada файла в assets',
        ),
        duration: Duration(seconds: 3),
      ),
    );
  }

  void _showFormatInfo() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('О формате RADA'),
        content: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'RADA - формат для хранения данных Magento',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text('Структура архива:'),
              SizedBox(height: 8),
              Text('• manifest.json - метаданные'),
              Text('• data.json - данные категорий и продуктов'),
              Text('• assets/ - изображения'),
              Text('• l10n/ - переводы'),
              SizedBox(height: 12),
              Text(
                'Преимущества:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('• Портативность данных'),
              Text('• Офлайн-поддержка'),
              Text('• Быстрый старт приложения'),
              Text('• Поддержка переводов'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Закрыть'),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}.${date.month}.${date.year} ${date.hour}:${date.minute}';
  }
}
