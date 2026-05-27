import 'blockchain_network.dart';

/// NFT metadata for blockchain-backed products.
class NFTMetadata {
  /// Token ID on the blockchain.
  final String tokenId;

  /// Smart contract address.
  final String contractAddress;

  /// Blockchain network.
  final BlockchainNetwork chain;

  /// Current owner address (if fetched).
  final String? ownerAddress;

  /// Metadata URI (IPFS or HTTP).
  final String? metadataUri;

  /// Token standard (ERC-721, ERC-1155, etc.).
  final NFTStandard? standard;

  /// On-chain attributes.
  final Map<String, dynamic>? attributes;

  /// Image URL from metadata.
  final String? imageUrl;

  /// NFT name from metadata.
  final String? name;

  /// NFT description from metadata.
  final String? description;

  /// Whether metadata has been fetched.
  final bool isMetadataLoaded;

  const NFTMetadata({
    required this.tokenId,
    required this.contractAddress,
    required this.chain,
    this.ownerAddress,
    this.metadataUri,
    this.standard,
    this.attributes,
    this.imageUrl,
    this.name,
    this.description,
    this.isMetadataLoaded = false,
  });

  /// Creates empty NFT metadata (no NFT).
  factory NFTMetadata.none() {
    return const NFTMetadata(
      tokenId: '',
      contractAddress: '',
      chain: BlockchainNetwork.icp,
    );
  }

  /// Whether this product has an NFT.
  bool get hasNFT => tokenId.isNotEmpty && contractAddress.isNotEmpty;

  /// Creates a copy with loaded metadata.
  NFTMetadata withMetadata({
    String? ownerAddress,
    String? metadataUri,
    Map<String, dynamic>? attributes,
    String? imageUrl,
    String? name,
    String? description,
  }) {
    return NFTMetadata(
      tokenId: tokenId,
      contractAddress: contractAddress,
      chain: chain,
      ownerAddress: ownerAddress ?? this.ownerAddress,
      metadataUri: metadataUri ?? this.metadataUri,
      standard: standard,
      attributes: attributes ?? this.attributes,
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      description: description ?? this.description,
      isMetadataLoaded: true,
    );
  }

  /// Gets explorer URL for this NFT.
  String? get explorerUrl {
    if (!hasNFT) return null;
    final baseUrl = chain.explorerUrl;
    if (chain == BlockchainNetwork.icp) {
      return '$baseUrl/canister/$contractAddress';
    }
    return '$baseUrl/token/$contractAddress?a=$tokenId';
  }
}

/// NFT token standards.
enum NFTStandard {
  /// ERC-721 (unique tokens).
  erc721,

  /// ERC-1155 (multi-token).
  erc1155,

  /// ICP NFT standard.
  icpNft,

  /// ICRC-7 (ICP NFT standard).
  icrc7,
}
