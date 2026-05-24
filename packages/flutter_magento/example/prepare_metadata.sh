#!/bin/bash

# Script to prepare App Store metadata
# Usage: ./prepare_metadata.sh

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo "${BLUE}📝 App Store Metadata Preparation${NC}"
echo "===================================="
echo ""

# Create metadata directory
METADATA_DIR="metadata/app_store"
mkdir -p "$METADATA_DIR"/{en-US,ru-RU}/{screenshots,description}

echo "${YELLOW}Creating metadata structure...${NC}"

# English metadata
cat > "$METADATA_DIR/en-US/description/title.txt" << 'EOF'
Flutter Magento Example
EOF

cat > "$METADATA_DIR/en-US/description/subtitle.txt" << 'EOF'
Magento E-commerce Demo
EOF

cat > "$METADATA_DIR/en-US/description/description.txt" << 'EOF'
A comprehensive Flutter application demonstrating Magento e-commerce platform integration.

FEATURES:
• Complete Magento REST API integration
• Secure customer authentication with JWT tokens
• Product catalog browsing and search
• Shopping cart management
• Category navigation
• Real-time data from Luma demo store
• Modern Material Design UI
• Offline mode support

PERFECT FOR:
- Developers learning Magento mobile integration
- Businesses planning e-commerce mobile apps
- Flutter developers exploring e-commerce patterns
- Magento store owners evaluating mobile solutions

TEST INCLUDED:
Connect to Luma demo store and test all features:
• Browse real products
• Add items to cart
• User authentication
• Category navigation

Built with Flutter and the flutter_magento plugin.
EOF

cat > "$METADATA_DIR/en-US/description/keywords.txt" << 'EOF'
magento,ecommerce,shopping,flutter,demo,catalog,cart,store,mobile,commerce
EOF

cat > "$METADATA_DIR/en-US/description/promotional_text.txt" << 'EOF'
Try the complete Magento mobile experience! Test with real demo data from Luma store.
EOF

cat > "$METADATA_DIR/en-US/description/release_notes.txt" << 'EOF'
Version 1.0.0

Initial Release:
• Complete Magento API integration
• Authentication and user management
• Product catalog with search
• Shopping cart functionality
• Modern UI with Material Design
• Luma demo store integration
• Offline mode support

Test credentials included in app!
EOF

# Russian metadata
cat > "$METADATA_DIR/ru-RU/description/title.txt" << 'EOF'
Flutter Magento Example
EOF

cat > "$METADATA_DIR/ru-RU/description/subtitle.txt" << 'EOF'
Демо Magento E-commerce
EOF

cat > "$METADATA_DIR/ru-RU/description/description.txt" << 'EOF'
Комплексное Flutter приложение, демонстрирующее интеграцию с платформой электронной коммерции Magento.

ВОЗМОЖНОСТИ:
• Полная интеграция с Magento REST API
• Безопасная аутентификация с JWT токенами
• Просмотр и поиск товаров
• Управление корзиной покупок
• Навигация по категориям
• Реальные данные из демо-магазина Luma
• Современный Material Design интерфейс
• Поддержка офлайн режима

ИДЕАЛЬНО ДЛЯ:
- Разработчиков изучающих мобильную интеграцию Magento
- Бизнесов планирующих мобильные приложения
- Flutter разработчиков изучающих e-commerce
- Владельцев Magento магазинов

ТЕСТИРОВАНИЕ:
Подключитесь к демо-магазину Luma и протестируйте все функции:
• Просмотр реальных товаров
• Добавление в корзину
• Авторизация пользователей
• Навигация по категориям

Создано с Flutter и плагином flutter_magento.
EOF

cat > "$METADATA_DIR/ru-RU/description/keywords.txt" << 'EOF'
magento,ecommerce,покупки,flutter,демо,каталог,корзина,магазин,мобильный,торговля
EOF

# Create README for metadata
cat > "$METADATA_DIR/README.md" << 'EOF'
# App Store Metadata

This directory contains metadata for App Store submission.

## Structure

```
metadata/app_store/
├── en-US/
│   ├── description/
│   │   ├── title.txt              # App name (30 chars max)
│   │   ├── subtitle.txt           # Subtitle (30 chars max)
│   │   ├── description.txt        # Full description (4000 chars max)
│   │   ├── keywords.txt           # Comma-separated (100 chars max)
│   │   ├── promotional_text.txt   # Promotional (170 chars max)
│   │   └── release_notes.txt      # What's new (4000 chars max)
│   └── screenshots/               # Place screenshots here
│       ├── iphone_6_5/           # 6.5" iPhone (1284x2778)
│       ├── iphone_5_5/           # 5.5" iPhone (1242x2208)
│       └── ipad_12_9/            # iPad Pro 12.9" (2048x2732)
└── ru-RU/                        # Russian localization
    └── (same structure)
```

## Screenshot Requirements

### iPhone 6.5" (Mandatory)
- Size: 1284x2778 or 2778x1284 pixels
- Format: PNG or JPEG
- Devices: iPhone 14 Pro Max, 13 Pro Max, 12 Pro Max

### iPhone 5.5" (Optional)
- Size: 1242x2208 or 2208x1242 pixels
- Format: PNG or JPEG
- Devices: iPhone 8 Plus, 7 Plus, 6s Plus

### iPad Pro 12.9" (Optional)
- Size: 2048x2732 or 2732x2048 pixels
- Format: PNG or JPEG

## How to Use

1. Edit text files with your content
2. Add screenshots to respective directories
3. Use fastlane or App Store Connect to upload

### Upload with fastlane:
```bash
cd fastlane
fastlane deliver
```

### Manual upload:
Upload via App Store Connect web interface.
EOF

echo "${GREEN}✅ Metadata structure created in: $METADATA_DIR${NC}"
echo ""

# Copy existing screenshots if available
if [ -d "../screenshots" ]; then
    echo "${YELLOW}Copying existing screenshots...${NC}"
    for img in ../screenshots/*.jpg ../screenshots/*.png; do
        if [ -f "$img" ]; then
            cp "$img" "$METADATA_DIR/en-US/screenshots/" 2>/dev/null || true
        fi
    done
    echo "${GREEN}✅ Screenshots copied${NC}"
fi

echo ""
echo "${BLUE}📋 Next steps:${NC}"
echo "  1. Review and edit metadata files in: $METADATA_DIR"
echo "  2. Add screenshots for all required sizes"
echo "  3. Update ExportOptions.plist with your Team ID"
echo "  4. Run: ${GREEN}./create_archive.sh${NC}"
echo ""
echo "${GREEN}✨ Done!${NC}"


