# Flutter Magento Examples Comparison

This package includes **two separate example applications** to demonstrate different use cases.

## 📦 example/ - Standard E-commerce

**Purpose**: Demonstrates core Magento e-commerce functionality

**Best for**:
- Single-vendor stores
- Traditional e-commerce
- B2C applications
- Basic product catalog

**Features**:
- ✅ Product catalog & categories
- ✅ Shopping cart & checkout
- ✅ Customer authentication
- ✅ Order management
- ✅ Wishlist
- ✅ Search functionality
- ✅ Customer profile
- ✅ RADA offline data
- ❌ No marketplace features

**Configuration**:
```env
MARKETPLACE=false  # or omit this line
MAGENTO_API_URL=https://your-magento-store.com/
```

**Run**:
```bash
cd example
flutter run
```

---

## 🏪 example_marketplace/ - Multi-Seller Marketplace

**Purpose**: Demonstrates multi-seller marketplace functionality

**Best for**:
- Multi-vendor platforms
- Marketplace applications
- B2B2C models
- Seller management systems

**Features**:
- ✅ All standard e-commerce features
- ✅ **Seller registration**
- ✅ **Seller dashboard**
- ✅ **Seller product management**
- ✅ **Seller ratings & reviews**
- ✅ **Advanced seller search**
- ✅ **Seller statistics**
- ✅ **Multi-seller checkout**

**Configuration**:
```env
MARKETPLACE=true
MAGENTO_API_URL=https://your-marketplace-store.com/
ENABLE_SELLER_REGISTRATION=true
ENABLE_SELLER_DASHBOARD=true
```

**Backend Requirement**: Requires `module-marketplace` installed on Magento

**Run**:
```bash
cd example_marketplace
flutter run
```

---

## 🔄 Side-by-Side Comparison

| Feature | example/ | example_marketplace/ |
|---------|----------|---------------------|
| **Core E-commerce** |
| Product Catalog | ✅ | ✅ |
| Shopping Cart | ✅ | ✅ |
| Checkout | ✅ | ✅ |
| Customer Auth | ✅ | ✅ |
| Orders | ✅ | ✅ |
| Wishlist | ✅ | ✅ |
| Search | ✅ | ✅ |
| Reviews | ✅ | ✅ |
| **Marketplace Features** |
| Multi-Seller Support | ❌ | ✅ |
| Seller Registration | ❌ | ✅ |
| Seller Dashboard | ❌ | ✅ |
| Seller Profiles | ❌ | ✅ |
| Seller Products | ❌ | ✅ |
| Seller Ratings | ❌ | ✅ |
| Seller Reviews | ❌ | ✅ |
| Seller Search/Filter | ❌ | ✅ |
| Seller Statistics | ❌ | ✅ |
| Commission Management | ❌ | ✅ |
| **Backend Requirements** |
| Standard Magento 2 | ✅ | ✅ |
| module-marketplace | ❌ | ✅ Required |
| **Complexity** |
| Setup Difficulty | Low | Medium |
| Code Complexity | Simple | Advanced |

---

## 🚀 Quick Decision Guide

### Choose `example/` if you:
- Have a **single-vendor** store
- Don't need seller management
- Want a **simple** implementation
- Are learning Flutter Magento basics
- Have standard Magento 2 installation

### Choose `example_marketplace/` if you:
- Need **multi-seller** functionality
- Want to build a marketplace platform
- Need seller dashboards and tools
- Have installed module-marketplace backend
- Building advanced marketplace features

---

## 📝 Backend Setup

### For example/ (Standard)
No additional backend required. Works with any Magento 2 installation.

### For example_marketplace/ (Marketplace)

1. Install marketplace module:
```bash
cd /path/to/magento
cp -r module-marketplace app/code/NativeMind/Marketplace
php bin/magento module:enable NativeMind_Marketplace
php bin/magento setup:upgrade
php bin/magento cache:flush
```

2. Configure marketplace settings in Magento admin

---

## 🔧 Switching Between Examples

### Method 1: Run Different Directories
```bash
# Run standard example
cd example && flutter run

# Run marketplace example  
cd example_marketplace && flutter run
```

### Method 2: Use Environment Variable
Both examples read from `.env` file:

**Standard mode** (.env):
```env
MARKETPLACE=false
```

**Marketplace mode** (.env):
```env
MARKETPLACE=true
```

---

## 📖 Documentation

- **example/**: See [example/README.md](example/README.md)
- **example_marketplace/**: See [example_marketplace/README.md](example_marketplace/README.md)
- **Main Docs**: See [doc/README.md](doc/README.md)
- **Marketplace API**: See [doc/marketplace_api.md](doc/marketplace_api.md)

---

## 🎯 Recommended Learning Path

1. **Start with example/**
   - Understand basic Flutter Magento concepts
   - Learn core e-commerce flows
   - Master authentication & cart management

2. **Move to example_marketplace/**
   - Explore advanced marketplace features
   - Learn seller management
   - Understand multi-vendor workflows

---

## 💡 Tips

- Both examples use the **same flutter_magento package**
- You can mix features from both examples in your app
- Marketplace features are **additive** - they don't replace standard features
- Use environment variables to toggle marketplace mode
- Both examples support **hot reload** for fast development

---

## 🆘 Support

For questions or issues:
- 📧 Email: contact@nativemind.net
- 🐛 Issues: GitHub Issues
- 📖 Docs: Full documentation in `/doc` folder

---

**Version**: 4.2.1  
**Last Updated**: October 2025

