#!/bin/bash
# Publish Magento modules to Packagist
# Usage: ./scripts/publish-magento-modules.sh [module|all] [--dry-run] [--force]

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
MAGENTO_DIR="$PROJECT_ROOT/magento"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Module definitions with dependency order
# Format: "directory:package-name:dependencies"
declare -a MODULES=(
    "module-bridge-core:nativemind/module-bridge-core:"
    "module-bridge-routes:nativemind/module-bridge-routes:module-bridge-core"
    "module-bridge-seo:nativemind/module-bridge-seo:module-bridge-core"
    "module-bridge-app-links:nativemind/module-bridge-applinks:module-bridge-core"
    "module-bridge-app-banner:nativemind/module-bridge-appbanner:module-bridge-core"
    "module-bridge-debug:nativemind/module-bridge-debug:module-bridge-core"
    "module-bridge-flutter-web:nativemind/module-bridge-flutterweb:module-bridge-core,module-bridge-routes"
    "module-bridge:nativemind/module-bridge:module-bridge-core,module-bridge-routes,module-bridge-seo,module-bridge-app-links,module-bridge-app-banner"
    "module-marketplace:nativemind/module-marketplace:"
)

# Default values
DRY_RUN=false
FORCE=false
TARGET_MODULE="all"
PACKAGIST_USERNAME="${PACKAGIST_USERNAME:-}"
PACKAGIST_TOKEN="${PACKAGIST_TOKEN:-}"

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --dry-run)
            DRY_RUN=true
            shift
            ;;
        --force)
            FORCE=true
            shift
            ;;
        --help|-h)
            echo "Usage: $0 [module|all] [--dry-run] [--force]"
            echo ""
            echo "Arguments:"
            echo "  module     Specific module to publish (e.g., module-bridge-core)"
            echo "  all        Publish all modules (default)"
            echo ""
            echo "Options:"
            echo "  --dry-run  Validate only, don't notify Packagist"
            echo "  --force    Skip dependency checks"
            echo "  --help     Show this help message"
            echo ""
            echo "Environment variables:"
            echo "  PACKAGIST_USERNAME  Packagist username (required for publishing)"
            echo "  PACKAGIST_TOKEN     Packagist API token (required for publishing)"
            echo ""
            echo "Available modules:"
            for module_def in "${MODULES[@]}"; do
                IFS=':' read -r dir pkg deps <<< "$module_def"
                echo "  - $dir ($pkg)"
            done
            exit 0
            ;;
        *)
            TARGET_MODULE="$1"
            shift
            ;;
    esac
done

# Functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

check_php() {
    if ! command -v php &> /dev/null; then
        log_error "PHP is not installed"
        exit 1
    fi
    log_info "PHP version: $(php -v | head -n 1)"
}

check_composer() {
    if ! command -v composer &> /dev/null; then
        log_error "Composer is not installed"
        exit 1
    fi
    log_info "Composer version: $(composer --version)"
}

validate_module() {
    local dir=$1
    local module_path="$MAGENTO_DIR/$dir"

    if [[ ! -d "$module_path" ]]; then
        log_error "Module directory not found: $module_path"
        return 1
    fi

    if [[ ! -f "$module_path/composer.json" ]]; then
        log_error "composer.json not found in $module_path"
        return 1
    fi

    log_info "Validating $dir..."

    cd "$module_path"
    if composer validate --strict 2>&1; then
        log_success "composer.json is valid"
        return 0
    else
        log_error "composer.json validation failed"
        return 1
    fi
}

notify_packagist() {
    local package=$1

    if [[ -z "$PACKAGIST_USERNAME" ]] || [[ -z "$PACKAGIST_TOKEN" ]]; then
        log_warning "Packagist credentials not set. Skipping notification."
        log_info "Set PACKAGIST_USERNAME and PACKAGIST_TOKEN environment variables."
        return 0
    fi

    log_info "Notifying Packagist about $package..."

    local response
    response=$(curl -s -w "\n%{http_code}" -X POST \
        -H "content-type: application/json" \
        "https://packagist.org/api/update-package?username=$PACKAGIST_USERNAME&apiToken=$PACKAGIST_TOKEN" \
        -d "{\"repository\":{\"url\":\"https://packagist.org/packages/$package\"}}")

    local http_code
    http_code=$(echo "$response" | tail -n 1)
    local body
    body=$(echo "$response" | head -n -1)

    if [[ "$http_code" == "200" ]] || [[ "$http_code" == "202" ]]; then
        log_success "Packagist notified successfully"
        return 0
    else
        log_warning "Packagist notification returned HTTP $http_code: $body"
        return 0  # Don't fail on Packagist errors
    fi
}

publish_module() {
    local dir=$1
    local package=$2
    local deps=$3

    echo ""
    echo "========================================"
    log_info "Publishing: $package"
    echo "========================================"

    # Check dependencies first
    if [[ -n "$deps" ]] && [[ "$FORCE" == "false" ]]; then
        IFS=',' read -ra DEP_ARRAY <<< "$deps"
        for dep in "${DEP_ARRAY[@]}"; do
            log_info "Checking dependency: $dep"
            if ! validate_module "$dep" > /dev/null 2>&1; then
                log_error "Dependency $dep is not valid. Use --force to skip."
                return 1
            fi
        done
    fi

    # Validate module
    if ! validate_module "$dir"; then
        return 1
    fi

    # Notify Packagist
    if [[ "$DRY_RUN" == "true" ]]; then
        log_info "[DRY-RUN] Would notify Packagist about $package"
    else
        notify_packagist "$package"
    fi

    log_success "Module $package processed successfully"
    return 0
}

get_module_by_name() {
    local name=$1
    for module_def in "${MODULES[@]}"; do
        IFS=':' read -r dir pkg deps <<< "$module_def"
        if [[ "$dir" == "$name" ]] || [[ "$pkg" == "$name" ]]; then
            echo "$module_def"
            return 0
        fi
    done
    return 1
}

# Main
echo ""
echo "=========================================="
echo "  Magento Module Publisher"
echo "=========================================="
echo ""

if [[ "$DRY_RUN" == "true" ]]; then
    log_warning "Running in DRY-RUN mode"
fi

check_php
check_composer

FAILED_MODULES=()
SUCCESS_MODULES=()

if [[ "$TARGET_MODULE" == "all" ]]; then
    log_info "Publishing all modules in dependency order..."

    for module_def in "${MODULES[@]}"; do
        IFS=':' read -r dir pkg deps <<< "$module_def"
        if publish_module "$dir" "$pkg" "$deps"; then
            SUCCESS_MODULES+=("$pkg")
        else
            FAILED_MODULES+=("$pkg")
        fi
    done
else
    module_def=$(get_module_by_name "$TARGET_MODULE")
    if [[ -z "$module_def" ]]; then
        log_error "Unknown module: $TARGET_MODULE"
        echo ""
        echo "Available modules:"
        for m in "${MODULES[@]}"; do
            IFS=':' read -r dir pkg deps <<< "$m"
            echo "  - $dir ($pkg)"
        done
        exit 1
    fi

    IFS=':' read -r dir pkg deps <<< "$module_def"
    if publish_module "$dir" "$pkg" "$deps"; then
        SUCCESS_MODULES+=("$pkg")
    else
        FAILED_MODULES+=("$pkg")
    fi
fi

# Summary
echo ""
echo "=========================================="
echo "  Summary"
echo "=========================================="
echo ""

if [[ ${#SUCCESS_MODULES[@]} -gt 0 ]]; then
    log_success "Successfully processed: ${#SUCCESS_MODULES[@]} module(s)"
    for pkg in "${SUCCESS_MODULES[@]}"; do
        echo "  - $pkg"
    done
fi

if [[ ${#FAILED_MODULES[@]} -gt 0 ]]; then
    log_error "Failed: ${#FAILED_MODULES[@]} module(s)"
    for pkg in "${FAILED_MODULES[@]}"; do
        echo "  - $pkg"
    done
    exit 1
fi

echo ""
log_success "All done!"
