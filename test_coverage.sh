#!/bin/bash

# Flutter Magento Test Coverage Script
# This script runs tests with coverage and generates reports

set -e

echo "🧪 Flutter Magento Test Coverage Runner"
echo "======================================="

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
    print_error "pubspec.yaml not found. Please run this script from the project root."
    exit 1
fi

# Check if flutter is installed
if ! command -v flutter &> /dev/null; then
    print_error "Flutter is not installed or not in PATH"
    exit 1
fi

print_status "Starting test coverage analysis..."

# Clean previous builds
print_status "Cleaning previous builds..."
flutter clean
flutter pub get

# Run linting first
print_status "Running linting analysis..."
if flutter analyze; then
    print_success "Linting passed ✅"
else
    print_warning "Linting found issues ⚠️"
fi

# Create coverage directory
mkdir -p coverage

# Run tests with coverage
print_status "Running tests with coverage..."
if flutter test --coverage --coverage-path=coverage/lcov.info; then
    print_success "Tests completed ✅"
else
    print_error "Some tests failed ❌"
    exit 1
fi

# Check if lcov is installed for HTML report generation
if command -v lcov &> /dev/null && command -v genhtml &> /dev/null; then
    print_status "Generating HTML coverage report..."
    
    # Remove unwanted files from coverage
    lcov --remove coverage/lcov.info \
        '*/flutter/*' \
        '*/packages/*' \
        '*/test/*' \
        '*/generated_plugin_registrant.dart' \
        '*/l10n/*' \
        '*/*.g.dart' \
        '*/*.freezed.dart' \
        -o coverage/lcov_cleaned.info
    
    # Generate HTML report
    genhtml coverage/lcov_cleaned.info -o coverage/html
    
    print_success "HTML coverage report generated in coverage/html/"
    
    # Calculate coverage percentage
    COVERAGE=$(lcov --summary coverage/lcov_cleaned.info 2>&1 | grep "lines" | grep -o '[0-9.]*%' | head -1)
    print_success "Overall coverage: $COVERAGE"
    
else
    print_warning "lcov/genhtml not installed. Install with: sudo apt-get install lcov (Linux) or brew install lcov (macOS)"
    print_warning "Raw coverage data available in: coverage/lcov.info"
fi

# Check coverage threshold
if command -v lcov &> /dev/null; then
    COVERAGE_NUM=$(lcov --summary coverage/lcov_cleaned.info 2>&1 | grep "lines" | grep -o '[0-9.]*' | head -1 | cut -d'.' -f1)
    THRESHOLD=80
    
    if [ "$COVERAGE_NUM" -ge "$THRESHOLD" ]; then
        print_success "Coverage threshold met: ${COVERAGE_NUM}% >= ${THRESHOLD}% 🎉"
    else
        print_warning "Coverage below threshold: ${COVERAGE_NUM}% < ${THRESHOLD}% ⚠️"
    fi
fi

# Test summary
print_status "Test Summary:"
echo "============="
flutter test --reporter=json > test_results.json 2>/dev/null || true

if [ -f "test_results.json" ]; then
    TOTAL_TESTS=$(grep -c '"type":"testDone"' test_results.json || echo "0")
    PASSED_TESTS=$(grep '"result":"success"' test_results.json | wc -l || echo "0")
    FAILED_TESTS=$(grep '"result":"failure"' test_results.json | wc -l || echo "0")
    
    echo "Total tests: $TOTAL_TESTS"
    echo "Passed: $PASSED_TESTS"
    echo "Failed: $FAILED_TESTS"
    
    rm test_results.json
fi

# Open HTML report if available
if [ -f "coverage/html/index.html" ]; then
    print_status "To view the HTML coverage report, open: coverage/html/index.html"
    
    # Auto-open on macOS
    if [[ "$OSTYPE" == "darwin"* ]]; then
        print_status "Opening coverage report in browser..."
        open coverage/html/index.html
    fi
fi

print_success "Test coverage analysis complete! 🎉"

# Additional test commands for specific areas
echo ""
echo "Additional test commands:"
echo "========================"
echo "Run specific test file: flutter test test/flutter_magento_core_test.dart"
echo "Run tests with verbose output: flutter test --verbose"
echo "Run integration tests: flutter test test/integration/"
echo "Run unit tests only: flutter test test/ --exclude-tags=integration"
echo "Run tests for specific service: flutter test test/services/auth_service_test.dart"

echo ""
print_success "All done! Happy testing! 🚀"
