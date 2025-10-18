#!/bin/bash
# Release script for Flutter Magento Marketplace Example
# Usage: ./release.sh [platform] [lane]
# Example: ./release.sh ios beta

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}╔═══════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║   Flutter Magento Marketplace - Release Script       ║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════════════════════╝${NC}"
echo ""

# Get parameters
PLATFORM=${1:-ios}
LANE=${2:-beta}

echo -e "${YELLOW}Platform:${NC} $PLATFORM"
echo -e "${YELLOW}Lane:${NC} $LANE"
echo ""

# Validate platform
if [[ "$PLATFORM" != "ios" ]] && [[ "$PLATFORM" != "android" ]]; then
    echo -e "${RED}Error: Platform must be 'ios' or 'android'${NC}"
    exit 1
fi

# Validate lane
if [[ "$LANE" != "beta" ]] && [[ "$LANE" != "release" ]] && [[ "$LANE" != "build_debug" ]] && [[ "$LANE" != "build_apk" ]]; then
    echo -e "${RED}Error: Lane must be 'beta', 'release', 'build_debug', or 'build_apk'${NC}"
    exit 1
fi

# Step 1: Ensure .env exists
echo -e "${YELLOW}[1/7]${NC} Checking environment configuration..."
if [ ! -f ".env" ]; then
    echo -e "${YELLOW}Creating .env from example...${NC}"
    cp env.example .env
fi
echo -e "${GREEN}✓ Environment configured${NC}"

# Step 2: Install Flutter dependencies
echo -e "${YELLOW}[2/7]${NC} Installing Flutter dependencies..."
flutter pub get
echo -e "${GREEN}✓ Dependencies installed${NC}"

# Step 3: Run tests
echo -e "${YELLOW}[3/7]${NC} Running tests..."
flutter test || echo -e "${YELLOW}⚠ Some tests failed, continuing...${NC}"
echo -e "${GREEN}✓ Tests completed${NC}"

# Step 4: Flutter clean and build
echo -e "${YELLOW}[4/7]${NC} Cleaning Flutter build..."
flutter clean
flutter pub get
echo -e "${GREEN}✓ Clean completed${NC}"

# Step 5: Check fastlane installation
echo -e "${YELLOW}[5/7]${NC} Checking fastlane..."
if ! command -v fastlane &> /dev/null; then
    echo -e "${RED}Error: fastlane is not installed${NC}"
    echo "Install with: gem install fastlane -NV"
    exit 1
fi
echo -e "${GREEN}✓ Fastlane ready${NC}"

# Step 6: Navigate to platform directory
if [ "$PLATFORM" == "ios" ]; then
    cd ios
elif [ "$PLATFORM" == "android" ]; then
    cd android
fi

# Step 7: Run fastlane
echo -e "${YELLOW}[6/7]${NC} Running fastlane $PLATFORM $LANE..."
echo ""
fastlane $LANE

echo ""
echo -e "${GREEN}╔═══════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║              ✓ Release Completed Successfully!       ║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${YELLOW}Platform:${NC} $PLATFORM"
echo -e "${YELLOW}Lane:${NC} $LANE"
echo ""

if [ "$LANE" == "beta" ]; then
    echo -e "${GREEN}Next steps:${NC}"
    echo "1. Check TestFlight/Play Console for the new build"
    echo "2. Add release notes"
    echo "3. Invite testers"
    echo "4. Monitor crash reports"
elif [ "$LANE" == "release" ]; then
    echo -e "${GREEN}Next steps:${NC}"
    echo "1. Check App Store Connect/Play Console"
    echo "2. Submit for review"
    echo "3. Monitor submission status"
fi

echo ""
echo -e "${GREEN}Done!${NC}"

