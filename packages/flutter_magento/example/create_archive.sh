#!/bin/bash

# Script to create iOS Archive for App Store submission
# Usage: ./create_archive.sh

set -e

echo "🚀 Flutter Magento Example - App Store Archive Creator"
echo "========================================================"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Configuration
APP_NAME="Flutter Magento Example"
SCHEME="Runner"
CONFIGURATION="Release"
WORKSPACE="ios/Runner.xcworkspace"
ARCHIVE_PATH="build/ios/archive/Runner.xcarchive"
EXPORT_PATH="build/ios/ipa"

echo ""
echo "${BLUE}📋 Configuration:${NC}"
echo "  App Name: $APP_NAME"
echo "  Scheme: $SCHEME"
echo "  Configuration: $CONFIGURATION"
echo ""

# Step 1: Clean previous builds
echo "${YELLOW}1️⃣  Cleaning previous builds...${NC}"
flutter clean
rm -rf build/
echo "${GREEN}✅ Clean completed${NC}"
echo ""

# Step 2: Get dependencies
echo "${YELLOW}2️⃣  Installing dependencies...${NC}"
flutter pub get
cd ios && pod install && cd ..
echo "${GREEN}✅ Dependencies installed${NC}"
echo ""

# Step 3: Build Flutter assets
echo "${YELLOW}3️⃣  Building Flutter assets...${NC}"
flutter build ios --release --no-codesign
echo "${GREEN}✅ Flutter build completed${NC}"
echo ""

# Step 4: Create archive using xcodebuild
echo "${YELLOW}4️⃣  Creating Xcode archive...${NC}"
xcodebuild archive \
  -workspace "$WORKSPACE" \
  -scheme "$SCHEME" \
  -configuration "$CONFIGURATION" \
  -archivePath "$ARCHIVE_PATH" \
  -allowProvisioningUpdates \
  CODE_SIGN_STYLE=Automatic

echo "${GREEN}✅ Archive created at: $ARCHIVE_PATH${NC}"
echo ""

# Step 5: Export IPA
echo "${YELLOW}5️⃣  Exporting IPA for App Store...${NC}"

# Check if ExportOptions.plist exists and has valid team ID
if grep -q "YOUR_TEAM_ID" ios/ExportOptions.plist 2>/dev/null; then
    echo "${RED}⚠️  WARNING: ExportOptions.plist contains placeholder values${NC}"
    echo "${YELLOW}Please update ios/ExportOptions.plist with your:${NC}"
    echo "  - Team ID"
    echo "  - Provisioning Profile"
    echo ""
    echo "${YELLOW}You can find your Team ID in:${NC}"
    echo "  1. Apple Developer Account > Membership"
    echo "  2. Xcode > Preferences > Accounts > Your Team"
    echo ""
    
    read -p "Do you want to continue anyway? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "${RED}❌ Cancelled by user${NC}"
        exit 1
    fi
fi

xcodebuild -exportArchive \
  -archivePath "$ARCHIVE_PATH" \
  -exportPath "$EXPORT_PATH" \
  -exportOptionsPlist ios/ExportOptions.plist \
  -allowProvisioningUpdates

echo "${GREEN}✅ IPA exported to: $EXPORT_PATH${NC}"
echo ""

# Step 6: Show results
echo "${GREEN}🎉 Archive creation completed!${NC}"
echo ""
echo "${BLUE}📦 Output files:${NC}"
echo "  Archive: $ARCHIVE_PATH"
echo "  IPA: $EXPORT_PATH/Runner.ipa"
echo ""
echo "${BLUE}📤 Next steps:${NC}"
echo "  1. Open Xcode Organizer:"
echo "     ${YELLOW}xed ios/Runner.xcworkspace${NC}"
echo "     Window > Organizer"
echo ""
echo "  2. Or upload IPA using Transporter:"
echo "     ${YELLOW}open $EXPORT_PATH${NC}"
echo ""
echo "  3. Or use altool (deprecated but still works):"
echo "     ${YELLOW}xcrun altool --upload-app --type ios --file $EXPORT_PATH/Runner.ipa \\${NC}"
echo "       ${YELLOW}--username YOUR_APPLE_ID --password YOUR_APP_SPECIFIC_PASSWORD${NC}"
echo ""
echo "${GREEN}✨ Done!${NC}"

