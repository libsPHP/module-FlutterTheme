# Flutter Magento Plugin

A Flutter plugin for Magento integration that allows implementing server-side function calls using GraphQL and REST API.

## Overview

The `flutter_magento` plugin provides a seamless way to integrate Flutter applications with Magento e-commerce platform. It enables developers to interact with Magento servers through both GraphQL and REST API endpoints, making it easy to build mobile applications that can communicate with Magento-powered online stores.

## Key Features

- 🔌 **Magento Integration** - Seamless connection to Magento servers
- 📡 **GraphQL Support** - Modern GraphQL API integration for efficient data fetching
- 🌐 **REST API Support** - Traditional REST API endpoints for broader compatibility
- 📱 **Flutter Native** - Built specifically for Flutter applications
- 🔒 **Authentication** - Secure authentication handling for Magento sessions
- 📦 **Product Management** - Access to product catalogs, inventory, and details
- 🛒 **Shopping Cart** - Full cart management capabilities
- 👤 **User Management** - Customer account operations and profile management
- 📋 **Order Management** - Order history, tracking, and management
- 🔍 **Search & Filtering** - Advanced product search and filtering capabilities

## Use Cases

- E-commerce mobile applications
- Magento store companion apps
- Inventory management tools
- Customer service applications
- Multi-platform shopping experiences

## Getting Started

### Installation

Add the plugin to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_magento: ^latest_version
```

### Basic Usage

```dart
import 'package:flutter_magento/flutter_magento.dart';

// Initialize the plugin
final magento = FlutterMagento();

// Connect to Magento server
await magento.connect(
  baseUrl: 'https://your-magento-store.com',
  apiKey: 'your_api_key',
);
```

## Platform Support

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ macOS
- ✅ Linux
- ✅ Windows

## License

This project is licensed under the NativeMindNONC License - see the [LICENSE](LICENSE) file for details.

## Contributing

We welcome contributions! Please read our contributing guidelines before submitting pull requests.

## Support

For support and questions, please contact: taxlien.online

## Documentation

For detailed API documentation and examples, please refer to the [example](example/) directory and integration tests.