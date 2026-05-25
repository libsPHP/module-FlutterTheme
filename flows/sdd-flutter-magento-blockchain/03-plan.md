# Implementation Plan: flutter_magento_blockchain

> Version: 1.0
> Status: DRAFT
> Last Updated: 2026-05-25
> Specifications: [02-specifications.md](./02-specifications.md)

## Summary

flutter_magento_blockchain provides extension architecture for blockchain integrations. Uses MagentoExtensionRegistry for plugin registration. Implements ICP payment adapter, NFT product extension, and Yuku marketplace integration.

## Task Breakdown

### Phase 1: Package Setup

#### Task 1.1: Remove Plugin Boilerplate
- **Description**: Remove default Flutter plugin template code
- **Files**:
  - `packages/flutter_magento_blockchain/lib/flutter_magento_blockchain.dart` - Modify
  - `packages/flutter_magento_blockchain/lib/flutter_magento_blockchain_method_channel.dart` - Delete
  - `packages/flutter_magento_blockchain/lib/flutter_magento_blockchain_platform_interface.dart` - Delete
  - `packages/flutter_magento_blockchain/android/` - Delete
  - `packages/flutter_magento_blockchain/ios/` - Delete
  - `packages/flutter_magento_blockchain/linux/` - Delete
  - `packages/flutter_magento_blockchain/macos/` - Delete
  - `packages/flutter_magento_blockchain/windows/` - Delete
- **Dependencies**: flutter_magento_core implemented
- **Verification**: `flutter pub get` succeeds
- **Complexity**: Low

#### Task 1.2: Update pubspec.yaml
- **Description**: Add dependencies: flutter_magento_core, flutter_icp, flutter_nft, flutter_yuku
- **Files**:
  - `packages/flutter_magento_blockchain/pubspec.yaml` - Modify
- **Dependencies**: Task 1.1
- **Verification**: `flutter pub get` succeeds
- **Complexity**: Low

### Phase 2: Configuration

#### Task 2.1: Create BlockchainNetwork Enum
- **Description**: Supported blockchain networks enum
- **Files**:
  - `packages/flutter_magento_blockchain/lib/src/models/blockchain_network.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Enum compiles
- **Complexity**: Low

#### Task 2.2: Create NetworkConfig
- **Description**: Per-network configuration (RPC URL, chain ID)
- **Files**:
  - `packages/flutter_magento_blockchain/lib/src/config/network_config.dart` - Create
- **Dependencies**: Task 2.1
- **Verification**: Config instantiation works
- **Complexity**: Low

#### Task 2.3: Create BlockchainConfig
- **Description**: Main config with network map, merchant wallet, test mode
- **Files**:
  - `packages/flutter_magento_blockchain/lib/src/config/blockchain_config.dart` - Create
- **Dependencies**: Task 2.2
- **Verification**: mainnet/testnet factories work
- **Complexity**: Low

### Phase 3: Payment Adapters

#### Task 3.1: Create ICPPaymentAdapter
- **Description**: ICP payment implementation
- **Files**:
  - `packages/flutter_magento_blockchain/lib/src/payment/icp_payment_adapter.dart` - Create
- **Dependencies**: Task 2.3
- **Verification**: Adapter implements MagentoPaymentAdapter
- **Complexity**: High

#### Task 3.2: Create EVMPaymentAdapter (Optional)
- **Description**: EVM-compatible payment for Ethereum/Polygon/etc
- **Files**:
  - `packages/flutter_magento_blockchain/lib/src/payment/evm_payment_adapter.dart` - Create
- **Dependencies**: Task 2.3
- **Verification**: Adapter implements interface
- **Complexity**: High

### Phase 4: Product Extensions

#### Task 4.1: Create NFTMetadata Model
- **Description**: NFT metadata model with tokenId, contract, chain
- **Files**:
  - `packages/flutter_magento_blockchain/lib/src/models/nft_metadata.dart` - Create
- **Dependencies**: Task 2.1
- **Verification**: Model compiles
- **Complexity**: Low

#### Task 4.2: Create NFTProductExtension
- **Description**: MagentoProductExtension for NFT products
- **Files**:
  - `packages/flutter_magento_blockchain/lib/src/extensions/nft_product_extension.dart` - Create
- **Dependencies**: Task 4.1
- **Verification**: Extension extracts NFT data from products
- **Complexity**: Medium

### Phase 5: Marketplace Extensions

#### Task 5.1: Create YukuListing Model
- **Description**: Yuku marketplace listing model
- **Files**:
  - `packages/flutter_magento_blockchain/lib/src/models/yuku_listing.dart` - Create
- **Dependencies**: Task 1.2
- **Verification**: Model compiles
- **Complexity**: Low

#### Task 5.2: Create YukuMarketplaceExtension
- **Description**: Yuku integration for product sync and orders
- **Files**:
  - `packages/flutter_magento_blockchain/lib/src/extensions/yuku_marketplace_extension.dart` - Create
- **Dependencies**: Task 5.1
- **Verification**: Sync and listing methods work
- **Complexity**: High

### Phase 6: Exports and Tests

#### Task 6.1: Create Public Export File
- **Description**: Export all public APIs
- **Files**:
  - `packages/flutter_magento_blockchain/lib/flutter_magento_blockchain.dart` - Modify
- **Dependencies**: All previous tasks
- **Verification**: All types accessible
- **Complexity**: Low

#### Task 6.2: Create Unit Tests
- **Description**: Test adapters and extensions
- **Files**:
  - `packages/flutter_magento_blockchain/test/icp_payment_adapter_test.dart` - Create
  - `packages/flutter_magento_blockchain/test/nft_extension_test.dart` - Create
- **Dependencies**: Task 6.1
- **Verification**: All tests pass
- **Complexity**: Medium

## Dependency Graph

```
Task 1.1 ──→ Task 1.2 ──┬──→ Task 2.1 ──→ Task 2.2 ──→ Task 2.3 ──┬──→ Task 3.1 ──┐
                        │                                         │               │
                        │                            ┌────────────┴──→ Task 3.2 ──┤
                        │                            │                            │
                        │               ┌────────────┴──→ Task 4.1 ──→ Task 4.2 ──┤
                        │               │                                         │
                        └───────────────┴──→ Task 5.1 ──→ Task 5.2 ───────────────┴──→ Task 6.1 ──→ Task 6.2
```

## File Change Summary

| File | Action | Reason |
|------|--------|--------|
| `lib/flutter_magento_blockchain.dart` | Modify | Public exports |
| Plugin boilerplate files | Delete | No native code |
| `pubspec.yaml` | Modify | Add dependencies |
| `lib/src/config/*.dart` | Create | Blockchain configuration |
| `lib/src/models/*.dart` | Create | Domain models |
| `lib/src/payment/*.dart` | Create | Payment adapters |
| `lib/src/extensions/*.dart` | Create | Product/marketplace extensions |

## Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Blockchain client unavailable | Medium | High | Graceful degradation |
| Wallet connection issues | Medium | Medium | Clear error messages |
| Network configuration errors | Low | Medium | Validate config on startup |

## Checkpoints

After each phase, verify:

- [ ] All tests pass
- [ ] No analyzer warnings
- [ ] Package resolves

---

## Approval

- [ ] Reviewed by: [name]
- [ ] Approved on: [date]
