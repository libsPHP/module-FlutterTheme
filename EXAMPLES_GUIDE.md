# Flutter Magento - Examples Guide

## 📚 Available Examples

This package now includes **two complete example applications**:

### 1️⃣ example/ - Standard E-commerce App
**Location**: `/flutter_magento/example/`

A complete e-commerce application demonstrating core Magento functionality without marketplace features.

**Quick Start**:
```bash
cd example
cp env.example .env
flutter run
```

**See**: [example/README.md](example/README.md)

---

### 2️⃣ example_marketplace/ - Multi-Seller Marketplace App
**Location**: `/flutter_magento/example_marketplace/`

A comprehensive marketplace application showcasing multi-seller features, seller management, and advanced marketplace functionality.

**Quick Start**:
```bash
cd example_marketplace
# .env is already configured
flutter run
```

**See**: [example_marketplace/README.md](example_marketplace/README.md)

---

## 🎯 Which Example Should I Use?

### Use `example/` if:
- ✅ You're building a **single-vendor** store
- ✅ You want to **learn the basics** of Flutter Magento
- ✅ You need standard e-commerce features only
- ✅ You have a **standard Magento 2** installation

### Use `example_marketplace/` if:
- ✅ You're building a **multi-seller** marketplace
- ✅ You need **seller registration** and dashboards
- ✅ You want **seller ratings** and reviews
- ✅ You have **module-marketplace** installed on backend

---

## 🔧 Running Examples

### Run Standard Example
```bash
cd /Users/anton/proj/libs/libsMagento/flutter_magento/example
flutter run -d chrome  # or iOS/Android
```

### Run Marketplace Example
```bash
cd /Users/anton/proj/libs/libsMagento/flutter_magento/example_marketplace
flutter run -d chrome  # or iOS/Android
```

### Run Both Side-by-Side
```bash
# Terminal 1
cd example && flutter run -d chrome --web-port=8080

# Terminal 2
cd example_marketplace && flutter run -d chrome --web-port=8081
```

---

## 📁 Project Structure

```
flutter_magento/
├── example/                    # Standard e-commerce
│   ├── lib/
│   │   ├── main.dart
│   │   ├── screens/
│   │   └── providers/
│   ├── .env                   # MARKETPLACE=false
│   └── README.md
│
├── example_marketplace/        # Multi-seller marketplace
│   ├── lib/
│   │   ├── main.dart
│   │   ├── screens/
│   │   └── providers/
│   ├── .env                   # MARKETPLACE=true
│   └── README.md
│
└── EXAMPLES_COMPARISON.md     # Detailed comparison
```

---

## ⚙️ Configuration

### Standard Example (.env)
```env
MARKETPLACE=false  # or omit
MAGENTO_API_URL=https://your-store.com/
```

### Marketplace Example (.env)
```env
MARKETPLACE=true
MAGENTO_API_URL=https://your-marketplace.com/
ENABLE_SELLER_REGISTRATION=true
ENABLE_SELLER_DASHBOARD=true
```

---

## 🚀 Platform Support

Both examples support:
- ✅ iOS (Simulator & Device)
- ✅ Android (Emulator & Device)
- ✅ Web (Chrome, Safari, Firefox)
- ✅ macOS (Desktop) - example_marketplace only
- ✅ Linux (Desktop) - example_marketplace only
- ✅ Windows (Desktop) - example_marketplace only

---

## 📖 Documentation

| Document | Description |
|----------|-------------|
| [EXAMPLES_COMPARISON.md](EXAMPLES_COMPARISON.md) | Detailed feature comparison |
| [example/README.md](example/README.md) | Standard example docs |
| [example_marketplace/README.md](example_marketplace/README.md) | Marketplace example docs |
| [doc/README.md](doc/README.md) | Main library documentation |

---

## 🎓 Learning Path

**Recommended order**:

1. **Start with `example/`**
   - Understand core concepts
   - Master basic e-commerce flows
   - Learn authentication & cart

2. **Move to `example_marketplace/`**
   - Explore marketplace features
   - Learn seller management
   - Understand multi-vendor flows

---

## 🔄 Key Differences

| Feature | example/ | example_marketplace/ |
|---------|----------|---------------------|
| Sellers Management | ❌ | ✅ |
| Seller Dashboard | ❌ | ✅ |
| Seller Registration | ❌ | ✅ |
| Multi-Seller Products | ❌ | ✅ |
| Seller Ratings | ❌ | ✅ |
| Desktop Support | ❌ | ✅ |
| Complexity | Simple | Advanced |
| Backend Requirements | Magento 2 | Magento 2 + module-marketplace |

---

## 💡 Tips

1. **Both examples use the same package** - flutter_magento
2. **You can combine features** from both examples in your app
3. **Environment variables** control marketplace mode
4. **Hot reload works** in both examples
5. **Test credentials** are the same for both

---

## 🆘 Troubleshooting

### Example won't run
```bash
cd example  # or example_marketplace
flutter clean
flutter pub get
flutter run
```

### Environment issues
```bash
# Ensure .env file exists
ls -la .env

# Copy from template if missing
cp env.example .env
```

### Marketplace features not working
1. Check `MARKETPLACE=true` in `.env`
2. Verify `module-marketplace` is installed on backend
3. Ensure API URL is correct

---

## 📞 Support

- 📧 Email: contact@nativemind.net
- 🐛 Issues: GitHub Issues
- 📖 Full Docs: `/doc` folder
- 💬 Community: Discord/Slack

---

## 🎉 Next Steps

After exploring the examples:

1. Read [Getting Started Guide](doc/getting-started.md)
2. Review [API Documentation](doc/api-reference/)
3. Check [Integration Guides](doc/integration/)
4. Build your own app!

---

**Happy Coding!** 🚀

