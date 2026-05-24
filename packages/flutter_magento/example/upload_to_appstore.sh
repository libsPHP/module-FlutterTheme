#!/bin/bash

# Script to upload IPA to App Store Connect
# Usage: ./upload_to_appstore.sh [apple-id] [app-specific-password]

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo "${BLUE}📤 Flutter Magento Example - App Store Uploader${NC}"
echo "================================================"
echo ""

# Configuration
IPA_PATH="build/ios/ipa/Runner.ipa"
APPLE_ID=${1:-""}
APP_PASSWORD=${2:-""}

# Check if IPA exists
if [ ! -f "$IPA_PATH" ]; then
    echo "${RED}❌ Error: IPA not found at: $IPA_PATH${NC}"
    echo ""
    echo "Please create the IPA first:"
    echo "  ${GREEN}./create_archive.sh${NC}"
    exit 1
fi

# Validate IPA first
echo "${YELLOW}🔍 Validating IPA...${NC}"
./validate_build.sh "$IPA_PATH"
echo ""

# Get credentials if not provided
if [ -z "$APPLE_ID" ]; then
    echo "${BLUE}Please enter your Apple ID:${NC}"
    read -r APPLE_ID
fi

if [ -z "$APP_PASSWORD" ]; then
    echo "${BLUE}Please enter your App-Specific Password:${NC}"
    echo "${YELLOW}(Create at: https://appleid.apple.com/account/manage)${NC}"
    read -rs APP_PASSWORD
    echo ""
fi

# Upload method selection
echo ""
echo "${BLUE}Select upload method:${NC}"
echo "  1) Transporter (Recommended - GUI)"
echo "  2) altool (Command line - deprecated but works)"
echo "  3) Xcode Organizer (Manual)"
echo ""
read -p "Enter choice [1-3]: " -n 1 -r METHOD
echo ""
echo ""

case $METHOD in
    1)
        echo "${YELLOW}📱 Opening Transporter...${NC}"
        if command -v open &> /dev/null; then
            open -a Transporter "$IPA_PATH" 2>/dev/null || {
                echo "${YELLOW}⚠️  Transporter not found. Install from Mac App Store.${NC}"
                echo "Opening IPA location instead..."
                open "$(dirname "$IPA_PATH")"
            }
        else
            echo "${RED}❌ 'open' command not found${NC}"
        fi
        echo "${GREEN}✅ Opened in Transporter${NC}"
        echo ""
        echo "${BLUE}Follow these steps:${NC}"
        echo "  1. Sign in with Apple ID: $APPLE_ID"
        echo "  2. Drag and drop IPA or click '+' to add"
        echo "  3. Click 'Deliver'"
        ;;
        
    2)
        echo "${YELLOW}📤 Uploading via altool...${NC}"
        echo ""
        
        # First validate
        echo "${BLUE}Validating...${NC}"
        xcrun altool --validate-app \
            --type ios \
            --file "$IPA_PATH" \
            --username "$APPLE_ID" \
            --password "$APP_PASSWORD" \
            2>&1 | tee /tmp/altool_validate.log
        
        if grep -q "No errors validating" /tmp/altool_validate.log; then
            echo "${GREEN}✅ Validation passed${NC}"
            echo ""
            
            # Then upload
            echo "${BLUE}Uploading...${NC}"
            xcrun altool --upload-app \
                --type ios \
                --file "$IPA_PATH" \
                --username "$APPLE_ID" \
                --password "$APP_PASSWORD" \
                2>&1 | tee /tmp/altool_upload.log
            
            if grep -q "No errors uploading" /tmp/altool_upload.log; then
                echo ""
                echo "${GREEN}🎉 Upload successful!${NC}"
            else
                echo ""
                echo "${RED}❌ Upload failed. Check logs above.${NC}"
                exit 1
            fi
        else
            echo ""
            echo "${RED}❌ Validation failed. Fix errors and try again.${NC}"
            exit 1
        fi
        ;;
        
    3)
        echo "${YELLOW}📱 Opening Xcode Organizer...${NC}"
        if [ -f "ios/Runner.xcworkspace" ]; then
            open ios/Runner.xcworkspace
            echo "${GREEN}✅ Xcode opened${NC}"
            echo ""
            echo "${BLUE}Follow these steps:${NC}"
            echo "  1. Window > Organizer (⌘⌥⇧O)"
            echo "  2. Select your archive"
            echo "  3. Click 'Distribute App'"
            echo "  4. Choose 'App Store Connect'"
            echo "  5. Click 'Upload'"
        else
            echo "${RED}❌ Xcode workspace not found${NC}"
        fi
        ;;
        
    *)
        echo "${RED}❌ Invalid choice${NC}"
        exit 1
        ;;
esac

echo ""
echo "${BLUE}📊 Post-upload steps:${NC}"
echo "  1. Go to App Store Connect: https://appstoreconnect.apple.com"
echo "  2. Select your app"
echo "  3. Wait for build processing (10-60 minutes)"
echo "  4. Add build to version"
echo "  5. Fill in metadata if not done"
echo "  6. Submit for review"
echo ""
echo "${GREEN}✨ Done!${NC}"


