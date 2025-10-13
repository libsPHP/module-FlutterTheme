#!/bin/bash

# Flutter Magento Package Release Script
# This script prepares and publishes the package to pub.dev
# Ensures all generated files are properly committed

set -e  # Exit on any error

echo "🚀 Starting Flutter Magento package release..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if we're in the right directory
if [ ! -f "pubspec.yaml" ]; then
    print_error "pubspec.yaml not found. Please run this script from the Flutter package root directory."
    exit 1
fi

# Get package name and version
PACKAGE_NAME=$(grep '^name:' pubspec.yaml | sed 's/name: //')
VERSION=$(grep '^version:' pubspec.yaml | sed 's/version: //')

print_status "Package: $PACKAGE_NAME"
print_status "Version: $VERSION"

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    print_error "Flutter is not installed or not in PATH"
    exit 1
fi

# Check if dart is installed
if ! command -v dart &> /dev/null; then
    print_error "Dart is not installed or not in PATH"
    exit 1
fi

print_status "Flutter version: $(flutter --version | head -n 1)"
print_status "Dart version: $(dart --version 2>&1 | head -n 1)"

# Clean previous builds
print_status "Cleaning previous builds..."
flutter clean

# Get dependencies
print_status "Getting dependencies..."
flutter pub get

# Run code generation
print_status "Running code generation..."
dart run build_runner build --delete-conflicting-outputs

# Verify generated files exist
print_status "Verifying generated files..."
MISSING_FILES=0
for model_file in lib/src/models/*_models.dart; do
    if [ -f "$model_file" ]; then
        base_name="${model_file%.dart}"
        freezed_file="${base_name}.freezed.dart"
        g_file="${base_name}.g.dart"
        
        if [ ! -f "$freezed_file" ]; then
            print_error "Missing: $freezed_file"
            MISSING_FILES=$((MISSING_FILES+1))
        fi
        
        if [ ! -f "$g_file" ]; then
            print_error "Missing: $g_file"
            MISSING_FILES=$((MISSING_FILES+1))
        fi
    fi
done

if [ $MISSING_FILES -gt 0 ]; then
    print_error "Found $MISSING_FILES missing generated files!"
    print_error "Code generation may have failed."
    exit 1
fi

# Check if generated files are committed
print_status "Checking git status for generated files..."
UNCOMMITTED_GENERATED=0

if git status --short | grep -E '\.(freezed|g)\.dart$' > /dev/null 2>&1; then
    print_warning "Found uncommitted generated files:"
    git status --short | grep -E '\.(freezed|g)\.dart$'
    UNCOMMITTED_GENERATED=1
    echo ""
    print_warning "Generated files MUST be committed for pub.dev packages!"
    echo ""
    read -p "Do you want to commit them now? (y/N): " -n 1 -r
    echo ""
    
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        print_status "Adding generated files to git..."
        git add lib/src/models/*.freezed.dart lib/src/models/*.g.dart 2>/dev/null || true
        git commit -m "chore: update generated files for v${VERSION}"
        print_success "Generated files committed!"
    else
        print_error "Cannot publish without committing generated files!"
        exit 1
    fi
fi

# Run tests
print_status "Running tests..."
if flutter test; then
    print_success "All tests passed!"
else
    print_warning "Tests failed!"
    read -p "Continue anyway? (y/N): " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# Check for analysis issues
print_status "Running analysis..."
if flutter analyze; then
    print_success "Analysis passed!"
else
    print_warning "Analysis found issues!"
    read -p "Continue anyway? (y/N): " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# Format code
print_status "Formatting code..."
dart format .

# Dry run first to check for major issues
print_status "Running dry run..."
if flutter pub publish --dry-run; then
    print_success "Dry run successful!"
else
    print_error "Dry run failed!"
    print_error "Please fix the issues before publishing."
    exit 1
fi

# Ask for confirmation
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
print_warning "About to publish $PACKAGE_NAME version $VERSION to pub.dev"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
read -p "Do you want to continue? (y/N): " -n 1 -r
echo ""

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    print_status "Release cancelled by user"
    exit 0
fi

# Publish the package
print_status "Publishing package to pub.dev..."
flutter pub publish --force

# Create git tag if not exists
TAG_NAME="v${VERSION}"
if ! git rev-parse "$TAG_NAME" >/dev/null 2>&1; then
    print_status "Creating git tag: $TAG_NAME"
    git tag -a "$TAG_NAME" -m "Release version ${VERSION}"
    print_status "Pushing tag to remote..."
    git push origin "$TAG_NAME"
    print_success "Tag $TAG_NAME created and pushed!"
else
    print_warning "Tag $TAG_NAME already exists"
fi

# Final status
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
print_success "Release process completed!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
print_status "Package: https://pub.dev/packages/$PACKAGE_NAME"
print_status "Version: $VERSION"
print_status "Tag: $TAG_NAME"
echo ""
print_status "Version $VERSION should be available on pub.dev shortly"
echo ""
