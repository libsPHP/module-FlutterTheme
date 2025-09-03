import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../providers/localization_provider.dart';
import '../widgets/language_selector.dart';
import '../utils/localization_manager.dart';

/// Пример использования локализации с поддержкой Харконненов и Атрейдесов
class LocalizationExample extends StatelessWidget {
  const LocalizationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LocalizationProvider(),
      child: const _LocalizationExampleContent(),
    );
  }
}

class _LocalizationExampleContent extends StatelessWidget {
  const _LocalizationExampleContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<LocalizationProvider>(
          builder: (context, provider, child) {
            return Row(
              children: [
                Icon(
                  provider.getCurrentLanguageIcon(),
                  color: provider.getCurrentLanguageThemeColor(),
                ),
                const SizedBox(width: 8),
                Text(provider.getCurrentLanguageName(context)),
              ],
            );
          },
        ),
        actions: [
          Consumer<LocalizationProvider>(
            builder: (context, provider, child) {
              return IconButton(
                onPressed: () => _showLanguageSelector(context, provider),
                icon: Icon(
                  Icons.language,
                  color: provider.getCurrentLanguageThemeColor(),
                ),
                tooltip: 'Изменить язык',
              );
            },
          ),
        ],
      ),
      body: Consumer<LocalizationProvider>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildWelcomeSection(context, provider),
                const SizedBox(height: 24),
                _buildLanguageInfoSection(context, provider),
                const SizedBox(height: 24),
                _buildLocalizedContentSection(context, provider),
                const SizedBox(height: 24),
                _buildLanguageFeaturesSection(context, provider),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildWelcomeSection(BuildContext context, LocalizationProvider provider) {
    return Card(
      color: provider.getCurrentLanguageThemeColor().withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  provider.getCurrentLanguageIcon(),
                  color: provider.getCurrentLanguageThemeColor(),
                  size: 32,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    LocalizationManager.getWelcomeMessage(
                      provider.currentLanguage,
                      AppLocalizations.of(context)!,
                    ),
                    style: LocalizationManager.getLanguageTextStyle(
                      provider.currentLanguage,
                      Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ) ?? const TextStyle(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              provider.getCurrentLanguageDescription(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageInfoSection(BuildContext context, LocalizationProvider provider) {
    final languageInfo = provider.getCurrentLanguageInfo(context);
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Информация о языке',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildInfoRow('Код языка', languageInfo['code']),
            _buildInfoRow('Название', languageInfo['name']),
            _buildInfoRow('Описание', languageInfo['description']),
            _buildInfoRow('Харконнский', languageInfo['isHarkonnen'] ? 'Да' : 'Нет'),
            _buildInfoRow('Атрейдский', languageInfo['isAtreides'] ? 'Да' : 'Нет'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(value.toString()),
        ],
      ),
    );
  }

  Widget _buildLocalizedContentSection(BuildContext context, LocalizationProvider provider) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Локализованный контент',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildLocalizedButton(
              context,
              provider,
              'add',
              Icons.add,
            ),
            const SizedBox(height: 8),
            _buildLocalizedButton(
              context,
              provider,
              'edit',
              Icons.edit,
            ),
            const SizedBox(height: 8),
            _buildLocalizedButton(
              context,
              provider,
              'delete',
              Icons.delete,
            ),
            const SizedBox(height: 8),
            _buildLocalizedButton(
              context,
              provider,
              'save',
              Icons.save,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocalizedButton(
    BuildContext context,
    LocalizationProvider provider,
    String key,
    IconData icon,
  ) {
    final localizations = AppLocalizations.of(context)!;
    String text;
    
    switch (key) {
      case 'add':
        text = localizations.add;
        break;
      case 'edit':
        text = localizations.edit;
        break;
      case 'delete':
        text = localizations.delete;
        break;
      case 'save':
        text = localizations.save;
        break;
      default:
        text = key;
    }

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(icon),
        label: Text(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: provider.getCurrentLanguageThemeColor(),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }

  Widget _buildLanguageFeaturesSection(BuildContext context, LocalizationProvider provider) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Особенности языка',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            if (provider.isHarkonnenLanguage) ...[
              _buildFeatureItem(
                context,
                'Харконнский стиль',
                'Темные цвета, угрожающие тени, властный тон',
                Icons.dark_mode,
                Colors.red[900]!,
              ),
            ],
            if (provider.isAtreidesLanguage) ...[
              _buildFeatureItem(
                context,
                'Атрейдский стиль',
                'Светлые цвета, благородные тени, мудрый тон',
                Icons.light_mode,
                Colors.blue[700]!,
              ),
            ],
            if (!provider.isHarkonnenLanguage && !provider.isAtreidesLanguage) ...[
              _buildFeatureItem(
                context,
                'Стандартный стиль',
                'Обычные цвета и стили',
                Icons.language,
                Colors.grey[700]!,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    Color color,
  ) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                description,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showLanguageSelector(BuildContext context, LocalizationProvider provider) {
    showDialog(
      context: context,
      builder: (context) => LanguageSelectorDialog(
        currentLanguage: provider.currentLanguage,
        onLanguageChanged: (languageCode) {
          provider.changeLanguage(languageCode);
        },
      ),
    );
  }
}
