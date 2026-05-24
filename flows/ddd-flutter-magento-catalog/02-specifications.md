# Specifications: Product Catalog

> Version: 1.0 (Retrospective)  
> Status: APPROVED  
> Last Updated: March 1, 2026  
> Requirements: [01-requirements.md](01-requirements.md)

---

## Overview

Система каталога продуктов для Flutter Magento, предоставляющая полный доступ к товарам Magento с поиском, фильтрацией, категориями и кэшированием изображений.

---

## Affected Systems

| System | Impact | Notes |
|--------|--------|-------|
| `ProductApi` | Create | API client для Magento catalog endpoints |
| `EnhancedProductApi` | Create | Расширенный API с дополнительными функциями |
| `ProductModels` | Create | Product, Category, ProductListResponse |
| `NetworkService` | Integrate | HTTP запросы |
| `ImageCacheService` | Integrate | Кэширование изображений |
| `MagentoApiClient` | Integrate | Base API client |

---

## Architecture

### Component Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                      UI Layer                                │
│  (ProductsScreen, ProductDetailScreen, CategoryScreen)      │
└────────────────────┬────────────────────────────────────────┘
                     │ uses
┌────────────────────▼────────────────────────────────────────┐
│                  ProductApi                                  │
│  - getProducts()                                             │
│  - getProduct()                                              │
│  - getCategories()                                           │
│  - searchProducts()                                          │
│  - getRelatedProducts()                                      │
└──────────┬─────────────────────────────────┬────────────────┘
           │                                 │
┌──────────▼──────────┐           ┌─────────▼────────────────┐
│  MagentoApiClient   │           │  ImageCacheService       │
│  - REST calls       │           │  - cached_network_image  │
│  - Authentication   │           │  - Memory & disk cache   │
│  - Error handling   │           │  - Progressive loading   │
└─────────────────────┘           └──────────────────────────┘
```

### Data Flow

```
Product Listing:
UI → ProductApi.getProducts() → Magento API → ProductListResponse
                                         ↓
                                  Cache Images
                                         ↓
                                  UI Renders

Product Detail:
UI → ProductApi.getProduct(sku) → Magento API → Product
                                              ↓
                                       Load Reviews
                                              ↓
                                       Load Related
                                              ↓
                                       UI Renders
```

---

## Interfaces

### ProductApi Public API

```dart
class ProductApi {
  Future<ProductListResponse> getProducts({
    ProductFilterParams? params,
    int page = 1,
    int pageSize = 20,
    String? searchQuery,
    String? categoryId,
    String? sortBy,
    String? sortOrder,
    Map<String, dynamic>? filters,
  });
  
  Future<Product> getProduct(String sku);
  Future<List<Category>> getCategories();
  Future<ProductListResponse> searchProducts(
    String query, {
    int page,
    int pageSize,
  });
  Future<List<Product>> getRelatedProducts(String sku);
}
```

---

## Data Models

### Product

```dart
@freezed
class Product with _$Product {
  const factory Product({
    required int id,
    required String sku,
    required String name,
    required String typeId,
    required double price,
    double? specialPrice,
    required int status,
    required int visibility,
    required int stockStatus,
    String? description,
    String? shortDescription,
    List<String>? categories,
    List<MediaGalleryEntry>? mediaGalleryEntries,
    List<Review>? reviews,
    DateTime? createdAt,
  }) = _Product;
  
  // Computed properties
  bool get isAvailable => stockStatus == 1;
  double get currentPrice => hasSpecialPrice ? specialPrice! : price;
  double get discountPercentage => ...;
}
```

### Category

```dart
@freezed
class Category with _$Category {
  const factory Category({
    required int id,
    required String name,
    String? description,
    String? image,
    int? parentId,
    required int level,
    required int position,
    List<Category>? children,
  }) = _Category;
}
```

---

## Behavior Specifications

### Happy Path - Browse Products

1. User opens products screen
2. App calls `ProductApi.getProducts(page: 1, pageSize: 20)`
3. Magento returns ProductListResponse with 20 products
4. Images are cached automatically
5. UI displays product grid with images, prices, names

### Edge Cases

| Case | Trigger | Expected Behavior |
|------|---------|-------------------|
| Empty catalog | No products | Show "No products" message |
| Image load fails | Broken URL | Show placeholder image |
| Network error | No internet | Show cached products, retry button |
| Invalid SKU | Product not found | Show "Product not found" error |

### Error Handling

| Error | Cause | Response |
|-------|-------|----------|
| 404 Not Found | Invalid SKU | Show error, suggest similar products |
| Network error | No connectivity | Use cached data, show offline indicator |
| Timeout | Slow server | Show loading, retry automatically |

---

## Dependencies

### Requires

- ✅ `NetworkService` - HTTP requests
- ✅ `ImageCacheService` - Image caching
- ✅ `MagentoApiClient` - Base API client

### Blocks

- ❌ `CartService` - requires products to add to cart
- ❌ `WishlistApi` - requires products to add to wishlist
- ❌ `SearchApi` - builds on product search

---

## Integration Points

### External Systems

- **Magento 2.x REST API** - `/V1/products`, `/V1/categories`
- **Magento Search** - Product search functionality

### Internal Systems

- **CartService** - add products to cart
- **WishlistApi** - add products to wishlist
- **ImageCacheService** - cache product images

---

## Testing Strategy

### Unit Tests

- [ ] `getProducts()` returns correct pagination
- [ ] `getProduct()` returns product by SKU
- [ ] `searchProducts()` filters correctly
- [ ] Category hierarchy loads correctly
- [ ] Price filters work correctly

### Integration Tests

- [ ] Full product listing flow
- [ ] Search with filters
- [ ] Category navigation
- [ ] Image caching works

### Manual Verification

- [ ] Browse products with pagination
- [ ] Search products
- [ ] Filter by category and price
- [ ] View product details
- [ ] Images load and cache

---

## Approval

- [x] Reviewed by: AI Assistant (Retrospective)
- [x] Approved on: March 1, 2026
