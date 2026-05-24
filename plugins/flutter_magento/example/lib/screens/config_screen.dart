import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';

class ConfigScreen extends StatefulWidget {
  const ConfigScreen({super.key});

  @override
  State<ConfigScreen> createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  final _formKey = GlobalKey<FormState>();
  final _baseUrlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final provider = context.read<AppProvider>();
    if (provider.baseUrl != null && provider.baseUrl!.isNotEmpty) {
      _baseUrlController.text = provider.baseUrl!;
    } else {
      // Предлагаем URL из .env или Luma demo URL по умолчанию
      _baseUrlController.text =
          provider.defaultApiUrl ?? 'https://luma-demo.scandipwa.com/';
    }
  }

  @override
  void dispose() {
    _baseUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Magento Configuration')),
      body: Consumer<AppProvider>(
        builder: (context, provider, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Configuration Form
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Magento API Configuration',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 16),

                          TextFormField(
                            controller: _baseUrlController,
                            decoration: InputDecoration(
                              labelText: 'Base URL',
                              hintText:
                                  provider.defaultApiUrl ??
                                  'https://luma-demo.scandipwa.com/',
                              border: const OutlineInputBorder(),
                              prefixIcon: const Icon(Icons.link),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.paste),
                                tooltip: 'Paste from clipboard',
                                onPressed: _pasteFromClipboard,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a base URL';
                              }
                              if (!(Uri.tryParse(value)?.hasAbsolutePath ??
                                  false)) {
                                return 'Please enter a valid URL';
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 16),

                          // Quick setup button for default demo
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton.icon(
                              onPressed: provider.isLoading
                                  ? null
                                  : () => _setUrl(
                                      provider.defaultApiUrl ??
                                          'https://luma-demo.scandipwa.com/',
                                    ),
                              icon: const Icon(Icons.star),
                              label: Text(
                                'Use ${provider.defaultApiUrl?.contains('luma') == true ? 'Luma Demo' : 'Default Demo'} (Recommended)',
                              ),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.blue,
                                side: const BorderSide(color: Colors.blue),
                              ),
                            ),
                          ),

                          const SizedBox(height: 12),

                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: provider.isLoading
                                  ? null
                                  : _saveConfiguration,
                              child: provider.isLoading
                                  ? const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : const Text('Save & Initialize'),
                            ),
                          ),

                          if (provider.error != null) ...[
                            const SizedBox(height: 16),
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.red.shade50,
                                border: Border.all(color: Colors.red.shade200),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.error, color: Colors.red.shade700),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      provider.error!,
                                      style: TextStyle(
                                        color: Colors.red.shade700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Current Status
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Current Status',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 16),

                          _StatusRow(
                            icon: Icons.link,
                            label: 'Connection',
                            value: provider.isInitialized
                                ? 'Connected'
                                : 'Not Connected',
                            color: provider.isInitialized
                                ? Colors.green
                                : Colors.red,
                          ),

                          const SizedBox(height: 8),

                          _StatusRow(
                            icon: Icons.public,
                            label: 'Base URL',
                            value: provider.baseUrl ?? 'Not configured',
                            color: (provider.baseUrl?.isNotEmpty ?? false)
                                ? Colors.blue
                                : Colors.grey,
                          ),

                          const SizedBox(height: 8),

                          _StatusRow(
                            icon: Icons.person,
                            label: 'Authentication',
                            value: provider.isAuthenticated
                                ? 'Logged In'
                                : 'Not Logged In',
                            color: provider.isAuthenticated
                                ? Colors.green
                                : Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Sample URLs
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sample URLs',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 16),

                          const Text(
                            'You can use these sample URLs for testing:',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 8),

                          // Special highlight for Luma demo
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade50,
                              border: Border.all(color: Colors.blue.shade200),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.blue.shade700,
                                  size: 16,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    '${provider.defaultApiUrl?.contains('luma') == true ? 'Luma Demo (ScandiPWA)' : 'Default Demo'} - Recommended for testing',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.blue.shade700,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),

                          ..._sampleUrls.map(
                            (url) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      url,
                                      style: const TextStyle(
                                        fontFamily: 'monospace',
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.copy, size: 16),
                                    onPressed: () => _copyToClipboard(url),
                                    tooltip: 'Copy to clipboard',
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.edit, size: 16),
                                    onPressed: () => _setUrl(url),
                                    tooltip: 'Use this URL',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _saveConfiguration() async {
    if (_formKey.currentState!.validate()) {
      final provider = context.read<AppProvider>();
      final success = await provider.initializeMagento(
        _baseUrlController.text.trim(),
      );

      if (success) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Configuration saved successfully!'),
              backgroundColor: Colors.green,
            ),
          );
        }
      }
    }
  }

  void _copyToClipboard(String text) {
    // In a real app, you would use Clipboard.setData
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Copied: $text'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void _setUrl(String url) {
    _baseUrlController.text = url;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('URL set: $url'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void _pasteFromClipboard() async {
    try {
      // В реальном приложении используйте Clipboard.getData()
      // final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
      // if (clipboardData?.text != null) {
      //   _baseUrlController.text = clipboardData!.text!;
      // }

      // Для демонстрации показываем сообщение
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Paste functionality would work with Clipboard plugin'),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error pasting: $e'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  List<String> get _sampleUrls {
    final provider = context.read<AppProvider>();
    final urls = <String>[];

    // Добавляем основной URL из .env
    if (provider.defaultApiUrl != null && provider.defaultApiUrl!.isNotEmpty) {
      urls.add(provider.defaultApiUrl!);
    }

    // Добавляем альтернативные URL из .env
    urls.addAll(provider.alternativeUrls);

    // Если .env не загружен, используем статические URL
    if (urls.isEmpty) {
      urls.addAll([
        'https://luma-demo.scandipwa.com/',
        'https://demo.magento.com',
        'https://magento2-demo.nexcess.net',
        'https://demo-m2.bird.eu',
      ]);
    }

    return urls;
  }
}

class _StatusRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _StatusRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        Text(
          value,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
