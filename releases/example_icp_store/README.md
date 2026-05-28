# ICP Store - E-commerce with ICP Cryptocurrency

A demo e-commerce application showcasing **Internet Computer Protocol (ICP)** blockchain integration with flutter_magento.

## Features

### 🪙 ICP Payment Integration
- **Plug Wallet** connection
- Real-time ICP balance display
- ICP to USD conversion
- Secure blockchain transactions
- Transaction history

### 🛍️ E-commerce Functionality
- Product catalog
- Shopping cart
- Checkout with ICP payment
- Order management
- Search and filters

### 📱 User Experience
- Modern, clean UI
- Real-time price updates
- Transaction status tracking
- QR code for wallet addresses
- Multi-language support

## Screenshots

```
┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐
│  Product        │  │  Shopping       │  │  ICP Checkout   │
│  Catalog        │→ │  Cart           │→ │  Payment        │
└─────────────────┘  └─────────────────┘  └─────────────────┘
        ↓                     ↓                     ↓
┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐
│  Wallet         │  │  Transaction    │  │  Order          │
│  Connection     │  │  Confirmation   │  │  Complete       │
└─────────────────┘  └─────────────────┘  └─────────────────┘
```

## Getting Started

### Prerequisites

1. **Plug Wallet** - Install Plug Wallet browser extension or mobile app
2. **ICP Tokens** - Get test ICP from faucet for testnet
3. **Flutter SDK** - Version 3.24.0 or higher

### Installation

```bash
# 1. Install dependencies
flutter pub get

# 2. Copy environment file
cp .env.example .env

# 3. Configure your settings in .env

# 4. Run the app
flutter run
```

### Configuration

Edit `.env` file:

```env
ENABLE_ICP=true
ICP_NETWORK=testnet
ICP_CANISTER_ID=your-canister-id
STORE_CURRENCY=ICP
ICP_TO_USD_RATE=12.50
```

## Architecture

```
example_icp_store/
├── lib/
│   ├── main.dart                    # App entry point
│   ├── app.dart                     # App configuration
│   │
│   ├── screens/                     # UI Screens
│   │   ├── home_screen.dart         # Home with product catalog
│   │   ├── product_detail_screen.dart
│   │   ├── cart_screen.dart         # Shopping cart
│   │   ├── checkout_screen.dart     # ICP checkout
│   │   ├── wallet_screen.dart       # Plug Wallet management
│   │   ├── orders_screen.dart       # Order history
│   │   └── transaction_history_screen.dart
│   │
│   ├── widgets/                     # Reusable widgets
│   │   ├── product_card.dart
│   │   ├── cart_item.dart
│   │   ├── icp_balance_widget.dart
│   │   ├── price_widget.dart        # ICP ↔ USD conversion
│   │   ├── transaction_item.dart
│   │   └── qr_code_widget.dart
│   │
│   ├── providers/                   # State management
│   │   ├── icp_provider.dart        # ICP service provider
│   │   ├── cart_provider.dart       # Shopping cart state
│   │   ├── products_provider.dart   # Product catalog state
│   │   └── orders_provider.dart     # Orders state
│   │
│   ├── models/                      # Data models
│   │   ├── product.dart
│   │   ├── cart_item.dart
│   │   ├── order.dart
│   │   └── transaction.dart
│   │
│   ├── services/                    # Business logic
│   │   ├── icp_service.dart         # ICP integration
│   │   ├── cart_service.dart
│   │   └── order_service.dart
│   │
│   └── utils/                       # Utilities
│       ├── currency_converter.dart
│       ├── qr_generator.dart
│       └── validators.dart
│
├── assets/                          # Assets
│   ├── images/
│   ├── icons/
│   └── fonts/
│
├── .env.example                     # Environment template
└── pubspec.yaml
```

## Usage Examples

### Connect Plug Wallet

```dart
import 'package:flutter_magento/flutter_magento.dart';

// Initialize ICP service
final icpService = FlutterMagentoICPService.instance;
await icpService.initialize(
  enabled: true,
  network: 'testnet',
  enableDebug: true,
);

// Connect wallet
final connected = await icpService.connectWallet();
if (connected) {
  print('Wallet connected!');
  print('Principal: ${icpService.walletPrincipal}');
  
  // Get balance
  final balances = await icpService.getWalletBalance();
  print('ICP Balance: ${balances['ICP']}');
}
```

### Process ICP Payment

```dart
// Calculate total in ICP
final totalUSD = cart.total;
final icpRate = double.parse(env['ICP_TO_USD_RATE'] ?? '12.50');
final totalICP = totalUSD / icpRate;

// Send ICP payment
final success = await icpService.sendTransaction(
  to: storeWalletAddress,
  amount: totalICP,
  currency: 'ICP',
  memo: 'Order #${order.id}',
);

if (success) {
  // Create order
  final order = await orderService.createOrder(
    cart: cart,
    paymentMethod: 'ICP',
    transactionHash: txHash,
  );
  
  print('Order created: ${order.id}');
}
```

## User Flow

### 1. Browse Products
```
User opens app → View product catalog → Select product → View details
```

### 2. Add to Cart
```
Product details → Add to cart → View cart → Update quantities
```

### 3. Connect Wallet
```
Checkout → Connect Plug Wallet → Authorize connection → Wallet connected
```

### 4. Make Payment
```
Review order → Confirm ICP amount → Send payment → Wait confirmation
```

### 5. Order Complete
```
Payment confirmed → Order created → View order details → Transaction history
```

## API Integration

### ICP Service Methods

| Method | Description |
|--------|-------------|
| `connectWallet()` | Connect to Plug Wallet |
| `getWalletBalance()` | Get ICP balance |
| `sendTransaction()` | Send ICP payment |
| `getTransactionHistory()` | Get transaction history |
| `formatBalance()` | Format ICP amount |

### Store Service Methods

| Method | Description |
|--------|-------------|
| `getProducts()` | Get product catalog |
| `addToCart()` | Add product to cart |
| `createOrder()` | Create order with ICP payment |
| `getOrders()` | Get user orders |

## Testing

### Test with Testnet

1. Switch to ICP testnet
2. Get test ICP from faucet
3. Test complete purchase flow

### Test Scenarios

- [ ] Connect Plug Wallet
- [ ] View ICP balance
- [ ] Add products to cart
- [ ] Calculate ICP amount
- [ ] Send ICP payment
- [ ] Verify transaction
- [ ] Create order
- [ ] View order history

## Deployment

### Web

```bash
flutter build web --release
```

### Mobile

```bash
# iOS
flutter build ios --release

# Android
flutter build apk --release
```

## Troubleshooting

### Wallet won't connect
- Ensure Plug Wallet is installed
- Check network setting (testnet/mainnet)
- Clear app cache

### Payment fails
- Verify sufficient ICP balance
- Check gas fees
- Confirm network is online

### Transaction not showing
- Wait for blockchain confirmation
- Check transaction history
- Verify canister ID

## Resources

- [Plug Wallet](https://plugwallet.ooo/)
- [Internet Computer](https://internetcomputer.org/)
- [Flutter Magento](https://pub.dev/packages/flutter_magento)
- [ICP Faucet (Testnet)](https://faucet.dfinity.org/)

## Support

For issues or questions:
- Open an issue on GitLab
- Check documentation
- Join community Discord

## License

NativeMindNONC License - see LICENSE file

## Credits

Built with:
- Flutter
- flutter_magento
- flutter_icp
- Internet Computer Protocol

---

**Demo Store** - Not for production use. Test with testnet only.

