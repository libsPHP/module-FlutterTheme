#!/bin/bash

# Flutter Magento Package Release Script
# This script publishes the package to pub.dev ignoring errors and warnings

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
print_status "Dart version: $(dart --version | head -n 1)"

# Clean previous builds
print_status "Cleaning previous builds..."
flutter clean || print_warning "Clean failed, continuing..."

# Get dependencies
print_status "Getting dependencies..."
flutter pub get || print_warning "Pub get failed, continuing..."

# Run code generation (ignore errors)
print_status "Running code generation..."
flutter packages pub run build_runner build --delete-conflicting-outputs || print_warning "Code generation failed, continuing..."

# Run tests (ignore failures)
print_status "Running tests..."
flutter test || print_warning "Tests failed, continuing..."

# Check for analysis issues (ignore them)
print_status "Running analysis..."
flutter analyze || print_warning "Analysis found issues, continuing..."

# Format code (ignore errors)
print_status "Formatting code..."
dart format . || print_warning "Code formatting failed, continuing..."

# Dry run first to check for major issues
print_status "Running dry run..."
if flutter pub publish --dry-run; then
    print_success "Dry run successful!"
else
    print_warning "Dry run failed, but continuing with actual publish..."
fi

# Ask for confirmation
echo ""
print_warning "About to publish $PACKAGE_NAME version $VERSION to pub.dev"
print_warning "This will ignore all errors and warnings!"
echo ""
read -p "Do you want to continue? (y/N): " -n 1 -r
echo ""

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    print_status "Release cancelled by user"
    exit 0
fi

# Publish the package (force ignore errors)
print_status "Publishing package to pub.dev..."

# Use timeout to prevent hanging
timeout 300 flutter pub publish --force || {
    print_warning "Publish command timed out or failed, but package might have been published"
    print_status "Check pub.dev to verify if the package was published successfully"
}

# Final status
echo ""
print_success "Release process completed!"
print_status "Check https://pub.dev/packages/$PACKAGE_NAME to verify the publication"
print_status "Version $VERSION should be available shortly"

echo ""
print_warning "Note: This script ignores all errors and warnings as requested."
print_warning "Please verify the package works correctly on pub.dev"
