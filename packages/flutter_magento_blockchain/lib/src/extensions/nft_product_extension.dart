import 'package:flutter_magento_core/flutter_magento_core.dart';

import '../models/blockchain_network.dart';
import '../models/nft_metadata.dart';

/// Custom attribute names for NFT data in Magento products.
class NFTAttributes {
  static const String tokenId = 'nft_token_id';
  static const String contractAddress = 'nft_contract_address';
  static const String chain = 'nft_chain';
  static const String metadataUri = 'nft_metadata_uri';
  static const String standard = 'nft_standard';
  static const String ownerAddress = 'nft_owner_address';

  NFTAttributes._();
}

/// Function type for extracting custom attribute values from products.
typedef ProductAttributeExtractor = String? Function(
  ProductDetails product,
  String attributeCode,
);

/// Extension for NFT-backed products.
///
/// Usage:
/// ```dart
/// final extension = NFTProductExtension(
///   nftClient: myNftClient, // optional, for on-chain data
/// );
///
/// final nftData = extension.getNFTMetadata(product);
/// if (nftData.hasNFT) {
///   print('Token ID: ${nftData.tokenId}');
/// }
/// ```
class NFTProductExtension {
  final NFTClient? _nftClient;
  final ProductAttributeExtractor _attributeExtractor;

  NFTProductExtension({
    NFTClient? nftClient,
    ProductAttributeExtractor? attributeExtractor,
  })  : _nftClient = nftClient,
        _attributeExtractor = attributeExtractor ?? _defaultExtractor;

  static String? _defaultExtractor(ProductDetails product, String code) {
    return product.customAttributes[code]?.toString();
  }

  /// Extracts NFT metadata from a product's custom attributes.
  NFTMetadata getNFTMetadata(ProductDetails product) {
    final tokenId = _attributeExtractor(product, NFTAttributes.tokenId);
    final contractAddress =
        _attributeExtractor(product, NFTAttributes.contractAddress);
    final chainStr = _attributeExtractor(product, NFTAttributes.chain);

    if (tokenId == null || contractAddress == null) {
      return NFTMetadata.none();
    }

    final chain = _parseChain(chainStr);
    final metadataUri = _attributeExtractor(product, NFTAttributes.metadataUri);
    final standardStr = _attributeExtractor(product, NFTAttributes.standard);
    final ownerAddress =
        _attributeExtractor(product, NFTAttributes.ownerAddress);

    return NFTMetadata(
      tokenId: tokenId,
      contractAddress: contractAddress,
      chain: chain,
      metadataUri: metadataUri,
      standard: _parseStandard(standardStr),
      ownerAddress: ownerAddress,
    );
  }

  /// Whether a product has NFT data.
  bool isNFTProduct(ProductDetails product) {
    final tokenId = _attributeExtractor(product, NFTAttributes.tokenId);
    final contractAddress =
        _attributeExtractor(product, NFTAttributes.contractAddress);
    return tokenId != null &&
        tokenId.isNotEmpty &&
        contractAddress != null &&
        contractAddress.isNotEmpty;
  }

  /// Fetches on-chain metadata for an NFT product.
  ///
  /// Requires an [NFTClient] to be configured.
  Future<NFTMetadata> fetchOnChainMetadata(ProductDetails product) async {
    final nftData = getNFTMetadata(product);
    if (!nftData.hasNFT) {
      return nftData;
    }

    final client = _nftClient;
    if (client == null) {
      return nftData;
    }

    try {
      final onChainData = await client.getTokenMetadata(
        contractAddress: nftData.contractAddress,
        tokenId: nftData.tokenId,
        chain: nftData.chain,
      );

      return nftData.withMetadata(
        ownerAddress: onChainData.owner,
        metadataUri: onChainData.metadataUri,
        attributes: onChainData.attributes,
        imageUrl: onChainData.imageUrl,
        name: onChainData.name,
        description: onChainData.description,
      );
    } catch (_) {
      return nftData;
    }
  }

  /// Verifies NFT ownership for a product.
  Future<bool> verifyOwnership({
    required ProductDetails product,
    required String walletAddress,
  }) async {
    final client = _nftClient;
    if (client == null) {
      return false;
    }

    final nftData = getNFTMetadata(product);
    if (!nftData.hasNFT) {
      return false;
    }

    try {
      return await client.verifyOwnership(
        contractAddress: nftData.contractAddress,
        tokenId: nftData.tokenId,
        ownerAddress: walletAddress,
        chain: nftData.chain,
      );
    } catch (_) {
      return false;
    }
  }

  BlockchainNetwork _parseChain(String? chain) {
    if (chain == null) return BlockchainNetwork.ethereum;

    switch (chain.toLowerCase()) {
      case 'icp':
      case 'internet_computer':
        return BlockchainNetwork.icp;
      case 'polygon':
      case 'matic':
        return BlockchainNetwork.polygon;
      case 'binance':
      case 'bsc':
        return BlockchainNetwork.binance;
      case 'avalanche':
      case 'avax':
        return BlockchainNetwork.avalanche;
      case 'arbitrum':
        return BlockchainNetwork.arbitrum;
      case 'optimism':
        return BlockchainNetwork.optimism;
      default:
        return BlockchainNetwork.ethereum;
    }
  }

  NFTStandard? _parseStandard(String? standard) {
    if (standard == null) return null;

    switch (standard.toLowerCase()) {
      case 'erc721':
      case 'erc-721':
        return NFTStandard.erc721;
      case 'erc1155':
      case 'erc-1155':
        return NFTStandard.erc1155;
      case 'icrc7':
      case 'icrc-7':
        return NFTStandard.icrc7;
      case 'icp_nft':
        return NFTStandard.icpNft;
      default:
        return null;
    }
  }
}

/// Abstract interface for NFT client operations.
///
/// Implement this with your NFT SDK.
abstract interface class NFTClient {
  /// Gets token metadata from the blockchain.
  Future<OnChainTokenData> getTokenMetadata({
    required String contractAddress,
    required String tokenId,
    required BlockchainNetwork chain,
  });

  /// Verifies that an address owns a specific token.
  Future<bool> verifyOwnership({
    required String contractAddress,
    required String tokenId,
    required String ownerAddress,
    required BlockchainNetwork chain,
  });
}

/// On-chain token data returned by NFT clients.
class OnChainTokenData {
  final String? owner;
  final String? metadataUri;
  final Map<String, dynamic>? attributes;
  final String? imageUrl;
  final String? name;
  final String? description;

  const OnChainTokenData({
    this.owner,
    this.metadataUri,
    this.attributes,
    this.imageUrl,
    this.name,
    this.description,
  });
}
