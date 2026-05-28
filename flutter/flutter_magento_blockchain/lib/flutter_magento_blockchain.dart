/// Blockchain integration for Flutter Magento SDK.
///
/// Provides:
/// - ICP and EVM payment adapters
/// - NFT product support
/// - Yuku marketplace integration
library;

// Models
export 'src/models/blockchain_network.dart';
export 'src/models/nft_metadata.dart';
export 'src/models/payment_result.dart';
export 'src/models/wallet_balance.dart';
export 'src/models/yuku_listing.dart';

// Config
export 'src/config/blockchain_config.dart';
export 'src/config/network_config.dart';

// Payment adapters
export 'src/payment/blockchain_payment_adapter.dart';
export 'src/payment/evm_payment_adapter.dart';
export 'src/payment/icp_payment_adapter.dart';

// Extensions
export 'src/extensions/nft_product_extension.dart';
export 'src/extensions/yuku_marketplace_extension.dart';
