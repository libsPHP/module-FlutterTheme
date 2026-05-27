#!/bin/bash
# Publish all flutter_magento packages to pub.dev
# Run: ./publish_all.sh

set -e

PACKAGES_DIR="/Users/anton/proj/flutter.nativemind.net/flutter_magento/packages"

echo "=== Publishing Flutter Magento SDK ==="
echo ""

# Function to publish a package
publish_package() {
    local pkg=$1
    echo ">>> Publishing $pkg..."
    cd "$PACKAGES_DIR/$pkg"
    dart pub publish --force
    echo ">>> $pkg published successfully!"
    echo ""
    # Wait for pub.dev to index the package
    sleep 30
}

# Order matters! Dependencies must be published first.

# 1. Core (no dependencies)
publish_package "flutter_magento_core"

# 2. Packages depending only on core
publish_package "flutter_magento_catalog"
publish_package "flutter_magento_auth"
publish_package "flutter_magento_cart"
publish_package "flutter_magento_profile"

# 3. Localizations (depends on core)
publish_package "flutter_magento_localizations"

# 4. UI (depends on core, localizations)
publish_package "flutter_magento_ui"

# 5. Offline (depends on core)
publish_package "flutter_magento_offline"

# 6. Marketplace (depends on core, catalog, cart)
publish_package "flutter_magento_marketplace"

# 7. Blockchain (depends on core)
publish_package "flutter_magento_blockchain"

# 8. Riverpod (depends on core, auth, catalog, cart, profile)
publish_package "flutter_magento_riverpod"

# 9. Umbrella package (depends on all)
publish_package "flutter_magento"

echo "=== All packages published successfully! ==="
