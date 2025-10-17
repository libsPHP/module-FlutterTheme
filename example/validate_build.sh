#!/bin/bash

# Script to validate iOS build before App Store submission
# Usage: ./validate_build.sh [path-to-ipa]

set -e

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo "${BLUE}📱 Flutter Magento Example - Build Validator${NC}"
echo "=============================================="
echo ""

# Default IPA path
IPA_PATH=${1:-"build/ios/ipa/Runner.ipa"}

if [ ! -f "$IPA_PATH" ]; then
    echo "${RED}❌ Error: IPA file not found at: $IPA_PATH${NC}"
    echo ""
    echo "Please run one of the following first:"
    echo "  flutter build ipa --release"
    echo "  ./create_archive.sh"
    exit 1
fi

echo "${YELLOW}🔍 Validating IPA: $IPA_PATH${NC}"
echo ""

# 1. Check IPA file size
echo "${BLUE}1️⃣  File Size:${NC}"
SIZE=$(ls -lh "$IPA_PATH" | awk '{print $5}')
echo "   Size: ${GREEN}$SIZE${NC}"

SIZE_BYTES=$(stat -f%z "$IPA_PATH")
if [ $SIZE_BYTES -gt 524288000 ]; then  # 500MB
    echo "${RED}   ⚠️  WARNING: File size > 500MB (App Store limit for cellular downloads)${NC}"
else
    echo "${GREEN}   ✅ Size OK${NC}"
fi
echo ""

# 2. Check IPA contents
echo "${BLUE}2️⃣  IPA Contents:${NC}"
unzip -l "$IPA_PATH" | head -20
echo "   ..."
echo "${GREEN}   ✅ Contents listed${NC}"
echo ""

# 3. Extract and check app bundle
echo "${BLUE}3️⃣  Extracting app bundle...${NC}"
TEMP_DIR=$(mktemp -d)
unzip -q "$IPA_PATH" -d "$TEMP_DIR"
APP_PATH=$(find "$TEMP_DIR" -name "*.app" | head -1)

if [ -z "$APP_PATH" ]; then
    echo "${RED}❌ Error: No .app bundle found in IPA${NC}"
    rm -rf "$TEMP_DIR"
    exit 1
fi

echo "${GREEN}   ✅ App bundle found: $(basename "$APP_PATH")${NC}"
echo ""

# 4. Check code signature
echo "${BLUE}4️⃣  Code Signature:${NC}"
codesign -dvv "$APP_PATH" 2>&1 | grep -E "Authority|Identifier|TeamIdentifier|Sealed Resources" | head -10
echo "${GREEN}   ✅ Signature verified${NC}"
echo ""

# 5. Check Info.plist
echo "${BLUE}5️⃣  Info.plist:${NC}"
INFO_PLIST="$APP_PATH/Info.plist"
if [ -f "$INFO_PLIST" ]; then
    BUNDLE_ID=$(/usr/libexec/PlistBuddy -c "Print :CFBundleIdentifier" "$INFO_PLIST" 2>/dev/null || echo "N/A")
    VERSION=$(/usr/libexec/PlistBuddy -c "Print :CFBundleShortVersionString" "$INFO_PLIST" 2>/dev/null || echo "N/A")
    BUILD=$(/usr/libexec/PlistBuddy -c "Print :CFBundleVersion" "$INFO_PLIST" 2>/dev/null || echo "N/A")
    DISPLAY_NAME=$(/usr/libexec/PlistBuddy -c "Print :CFBundleDisplayName" "$INFO_PLIST" 2>/dev/null || echo "N/A")
    
    echo "   Bundle ID: ${GREEN}$BUNDLE_ID${NC}"
    echo "   Version: ${GREEN}$VERSION${NC}"
    echo "   Build: ${GREEN}$BUILD${NC}"
    echo "   Display Name: ${GREEN}$DISPLAY_NAME${NC}"
    echo "${GREEN}   ✅ Info.plist OK${NC}"
else
    echo "${RED}   ❌ Info.plist not found${NC}"
fi
echo ""

# 6. Check required frameworks
echo "${BLUE}6️⃣  Embedded Frameworks:${NC}"
FRAMEWORKS_DIR="$APP_PATH/Frameworks"
if [ -d "$FRAMEWORKS_DIR" ]; then
    FRAMEWORK_COUNT=$(ls -1 "$FRAMEWORKS_DIR" | wc -l)
    echo "   Found ${GREEN}$FRAMEWORK_COUNT${NC} frameworks"
    ls -1 "$FRAMEWORKS_DIR" | head -10
    echo "${GREEN}   ✅ Frameworks embedded${NC}"
else
    echo "${YELLOW}   ⚠️  No Frameworks directory${NC}"
fi
echo ""

# 7. Check for required permissions
echo "${BLUE}7️⃣  Privacy Permissions:${NC}"
PERMISSIONS=$(grep -o "NS[A-Za-z]*UsageDescription" "$INFO_PLIST" 2>/dev/null || echo "")
if [ -n "$PERMISSIONS" ]; then
    echo "$PERMISSIONS" | sed 's/^/   - /'
    echo "${GREEN}   ✅ Permissions declared${NC}"
else
    echo "${YELLOW}   ⚠️  No privacy permissions found${NC}"
fi
echo ""

# 8. Check minimum iOS version
echo "${BLUE}8️⃣  Deployment Target:${NC}"
MIN_IOS=$(/usr/libexec/PlistBuddy -c "Print :MinimumOSVersion" "$INFO_PLIST" 2>/dev/null || echo "N/A")
echo "   Minimum iOS: ${GREEN}$MIN_IOS${NC}"
if [ "$MIN_IOS" != "N/A" ]; then
    echo "${GREEN}   ✅ Deployment target set${NC}"
fi
echo ""

# Cleanup
rm -rf "$TEMP_DIR"

# Summary
echo "=============================================="
echo "${GREEN}✅ Validation Complete!${NC}"
echo ""
echo "${BLUE}Summary:${NC}"
echo "  IPA: $IPA_PATH"
echo "  Size: $SIZE"
echo "  Bundle ID: $BUNDLE_ID"
echo "  Version: $VERSION ($BUILD)"
echo ""
echo "${YELLOW}Next steps:${NC}"
echo "  1. Upload to App Store Connect:"
echo "     ${GREEN}xcrun altool --upload-app --type ios --file $IPA_PATH \\${NC}"
echo "       ${GREEN}--username YOUR_APPLE_ID --password YOUR_APP_SPECIFIC_PASSWORD${NC}"
echo ""
echo "  2. Or use Transporter app:"
echo "     ${GREEN}open -a Transporter $IPA_PATH${NC}"
echo ""
echo "  3. Or upload via Xcode Organizer:"
echo "     ${GREEN}open ios/Runner.xcworkspace${NC}"
echo "     Window > Organizer"
echo ""


