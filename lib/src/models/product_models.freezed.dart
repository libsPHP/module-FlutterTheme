// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  int get id => throw _privateConstructorUsedError;
  String get sku => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get typeId => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double? get specialPrice => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;
  int get visibility => throw _privateConstructorUsedError;
  int get stockStatus => throw _privateConstructorUsedError;
  int? get stockQuantity => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get shortDescription => throw _privateConstructorUsedError;
  String? get metaTitle => throw _privateConstructorUsedError;
  String? get metaDescription => throw _privateConstructorUsedError;
  String? get metaKeyword => throw _privateConstructorUsedError;
  List<String>? get categories => throw _privateConstructorUsedError;
  List<String>? get websites => throw _privateConstructorUsedError;
  List<CustomAttribute>? get customAttributes =>
      throw _privateConstructorUsedError;
  List<MediaGalleryEntry>? get mediaGalleryEntries =>
      throw _privateConstructorUsedError;
  List<ProductOption>? get options => throw _privateConstructorUsedError;
  List<ProductLink>? get productLinks => throw _privateConstructorUsedError;
  List<TierPrice>? get tierPrices => throw _privateConstructorUsedError;
  List<Review>? get reviews => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call({
    int id,
    String sku,
    String name,
    String typeId,
    double price,
    double? specialPrice,
    int status,
    int visibility,
    int stockStatus,
    int? stockQuantity,
    String? description,
    String? shortDescription,
    String? metaTitle,
    String? metaDescription,
    String? metaKeyword,
    List<String>? categories,
    List<String>? websites,
    List<CustomAttribute>? customAttributes,
    List<MediaGalleryEntry>? mediaGalleryEntries,
    List<ProductOption>? options,
    List<ProductLink>? productLinks,
    List<TierPrice>? tierPrices,
    List<Review>? reviews,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sku = null,
    Object? name = null,
    Object? typeId = null,
    Object? price = null,
    Object? specialPrice = freezed,
    Object? status = null,
    Object? visibility = null,
    Object? stockStatus = null,
    Object? stockQuantity = freezed,
    Object? description = freezed,
    Object? shortDescription = freezed,
    Object? metaTitle = freezed,
    Object? metaDescription = freezed,
    Object? metaKeyword = freezed,
    Object? categories = freezed,
    Object? websites = freezed,
    Object? customAttributes = freezed,
    Object? mediaGalleryEntries = freezed,
    Object? options = freezed,
    Object? productLinks = freezed,
    Object? tierPrices = freezed,
    Object? reviews = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            sku: null == sku
                ? _value.sku
                : sku // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            typeId: null == typeId
                ? _value.typeId
                : typeId // ignore: cast_nullable_to_non_nullable
                      as String,
            price: null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as double,
            specialPrice: freezed == specialPrice
                ? _value.specialPrice
                : specialPrice // ignore: cast_nullable_to_non_nullable
                      as double?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as int,
            visibility: null == visibility
                ? _value.visibility
                : visibility // ignore: cast_nullable_to_non_nullable
                      as int,
            stockStatus: null == stockStatus
                ? _value.stockStatus
                : stockStatus // ignore: cast_nullable_to_non_nullable
                      as int,
            stockQuantity: freezed == stockQuantity
                ? _value.stockQuantity
                : stockQuantity // ignore: cast_nullable_to_non_nullable
                      as int?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            shortDescription: freezed == shortDescription
                ? _value.shortDescription
                : shortDescription // ignore: cast_nullable_to_non_nullable
                      as String?,
            metaTitle: freezed == metaTitle
                ? _value.metaTitle
                : metaTitle // ignore: cast_nullable_to_non_nullable
                      as String?,
            metaDescription: freezed == metaDescription
                ? _value.metaDescription
                : metaDescription // ignore: cast_nullable_to_non_nullable
                      as String?,
            metaKeyword: freezed == metaKeyword
                ? _value.metaKeyword
                : metaKeyword // ignore: cast_nullable_to_non_nullable
                      as String?,
            categories: freezed == categories
                ? _value.categories
                : categories // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            websites: freezed == websites
                ? _value.websites
                : websites // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            customAttributes: freezed == customAttributes
                ? _value.customAttributes
                : customAttributes // ignore: cast_nullable_to_non_nullable
                      as List<CustomAttribute>?,
            mediaGalleryEntries: freezed == mediaGalleryEntries
                ? _value.mediaGalleryEntries
                : mediaGalleryEntries // ignore: cast_nullable_to_non_nullable
                      as List<MediaGalleryEntry>?,
            options: freezed == options
                ? _value.options
                : options // ignore: cast_nullable_to_non_nullable
                      as List<ProductOption>?,
            productLinks: freezed == productLinks
                ? _value.productLinks
                : productLinks // ignore: cast_nullable_to_non_nullable
                      as List<ProductLink>?,
            tierPrices: freezed == tierPrices
                ? _value.tierPrices
                : tierPrices // ignore: cast_nullable_to_non_nullable
                      as List<TierPrice>?,
            reviews: freezed == reviews
                ? _value.reviews
                : reviews // ignore: cast_nullable_to_non_nullable
                      as List<Review>?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
    _$ProductImpl value,
    $Res Function(_$ProductImpl) then,
  ) = __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String sku,
    String name,
    String typeId,
    double price,
    double? specialPrice,
    int status,
    int visibility,
    int stockStatus,
    int? stockQuantity,
    String? description,
    String? shortDescription,
    String? metaTitle,
    String? metaDescription,
    String? metaKeyword,
    List<String>? categories,
    List<String>? websites,
    List<CustomAttribute>? customAttributes,
    List<MediaGalleryEntry>? mediaGalleryEntries,
    List<ProductOption>? options,
    List<ProductLink>? productLinks,
    List<TierPrice>? tierPrices,
    List<Review>? reviews,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
    _$ProductImpl _value,
    $Res Function(_$ProductImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sku = null,
    Object? name = null,
    Object? typeId = null,
    Object? price = null,
    Object? specialPrice = freezed,
    Object? status = null,
    Object? visibility = null,
    Object? stockStatus = null,
    Object? stockQuantity = freezed,
    Object? description = freezed,
    Object? shortDescription = freezed,
    Object? metaTitle = freezed,
    Object? metaDescription = freezed,
    Object? metaKeyword = freezed,
    Object? categories = freezed,
    Object? websites = freezed,
    Object? customAttributes = freezed,
    Object? mediaGalleryEntries = freezed,
    Object? options = freezed,
    Object? productLinks = freezed,
    Object? tierPrices = freezed,
    Object? reviews = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$ProductImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        sku: null == sku
            ? _value.sku
            : sku // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        typeId: null == typeId
            ? _value.typeId
            : typeId // ignore: cast_nullable_to_non_nullable
                  as String,
        price: null == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as double,
        specialPrice: freezed == specialPrice
            ? _value.specialPrice
            : specialPrice // ignore: cast_nullable_to_non_nullable
                  as double?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as int,
        visibility: null == visibility
            ? _value.visibility
            : visibility // ignore: cast_nullable_to_non_nullable
                  as int,
        stockStatus: null == stockStatus
            ? _value.stockStatus
            : stockStatus // ignore: cast_nullable_to_non_nullable
                  as int,
        stockQuantity: freezed == stockQuantity
            ? _value.stockQuantity
            : stockQuantity // ignore: cast_nullable_to_non_nullable
                  as int?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        shortDescription: freezed == shortDescription
            ? _value.shortDescription
            : shortDescription // ignore: cast_nullable_to_non_nullable
                  as String?,
        metaTitle: freezed == metaTitle
            ? _value.metaTitle
            : metaTitle // ignore: cast_nullable_to_non_nullable
                  as String?,
        metaDescription: freezed == metaDescription
            ? _value.metaDescription
            : metaDescription // ignore: cast_nullable_to_non_nullable
                  as String?,
        metaKeyword: freezed == metaKeyword
            ? _value.metaKeyword
            : metaKeyword // ignore: cast_nullable_to_non_nullable
                  as String?,
        categories: freezed == categories
            ? _value._categories
            : categories // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        websites: freezed == websites
            ? _value._websites
            : websites // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        customAttributes: freezed == customAttributes
            ? _value._customAttributes
            : customAttributes // ignore: cast_nullable_to_non_nullable
                  as List<CustomAttribute>?,
        mediaGalleryEntries: freezed == mediaGalleryEntries
            ? _value._mediaGalleryEntries
            : mediaGalleryEntries // ignore: cast_nullable_to_non_nullable
                  as List<MediaGalleryEntry>?,
        options: freezed == options
            ? _value._options
            : options // ignore: cast_nullable_to_non_nullable
                  as List<ProductOption>?,
        productLinks: freezed == productLinks
            ? _value._productLinks
            : productLinks // ignore: cast_nullable_to_non_nullable
                  as List<ProductLink>?,
        tierPrices: freezed == tierPrices
            ? _value._tierPrices
            : tierPrices // ignore: cast_nullable_to_non_nullable
                  as List<TierPrice>?,
        reviews: freezed == reviews
            ? _value._reviews
            : reviews // ignore: cast_nullable_to_non_nullable
                  as List<Review>?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl extends _Product {
  const _$ProductImpl({
    required this.id,
    required this.sku,
    required this.name,
    required this.typeId,
    required this.price,
    this.specialPrice,
    required this.status,
    required this.visibility,
    required this.stockStatus,
    this.stockQuantity,
    this.description,
    this.shortDescription,
    this.metaTitle,
    this.metaDescription,
    this.metaKeyword,
    final List<String>? categories,
    final List<String>? websites,
    final List<CustomAttribute>? customAttributes,
    final List<MediaGalleryEntry>? mediaGalleryEntries,
    final List<ProductOption>? options,
    final List<ProductLink>? productLinks,
    final List<TierPrice>? tierPrices,
    final List<Review>? reviews,
    this.createdAt,
    this.updatedAt,
  }) : _categories = categories,
       _websites = websites,
       _customAttributes = customAttributes,
       _mediaGalleryEntries = mediaGalleryEntries,
       _options = options,
       _productLinks = productLinks,
       _tierPrices = tierPrices,
       _reviews = reviews,
       super._();

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  final int id;
  @override
  final String sku;
  @override
  final String name;
  @override
  final String typeId;
  @override
  final double price;
  @override
  final double? specialPrice;
  @override
  final int status;
  @override
  final int visibility;
  @override
  final int stockStatus;
  @override
  final int? stockQuantity;
  @override
  final String? description;
  @override
  final String? shortDescription;
  @override
  final String? metaTitle;
  @override
  final String? metaDescription;
  @override
  final String? metaKeyword;
  final List<String>? _categories;
  @override
  List<String>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _websites;
  @override
  List<String>? get websites {
    final value = _websites;
    if (value == null) return null;
    if (_websites is EqualUnmodifiableListView) return _websites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CustomAttribute>? _customAttributes;
  @override
  List<CustomAttribute>? get customAttributes {
    final value = _customAttributes;
    if (value == null) return null;
    if (_customAttributes is EqualUnmodifiableListView)
      return _customAttributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<MediaGalleryEntry>? _mediaGalleryEntries;
  @override
  List<MediaGalleryEntry>? get mediaGalleryEntries {
    final value = _mediaGalleryEntries;
    if (value == null) return null;
    if (_mediaGalleryEntries is EqualUnmodifiableListView)
      return _mediaGalleryEntries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ProductOption>? _options;
  @override
  List<ProductOption>? get options {
    final value = _options;
    if (value == null) return null;
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ProductLink>? _productLinks;
  @override
  List<ProductLink>? get productLinks {
    final value = _productLinks;
    if (value == null) return null;
    if (_productLinks is EqualUnmodifiableListView) return _productLinks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<TierPrice>? _tierPrices;
  @override
  List<TierPrice>? get tierPrices {
    final value = _tierPrices;
    if (value == null) return null;
    if (_tierPrices is EqualUnmodifiableListView) return _tierPrices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Review>? _reviews;
  @override
  List<Review>? get reviews {
    final value = _reviews;
    if (value == null) return null;
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Product(id: $id, sku: $sku, name: $name, typeId: $typeId, price: $price, specialPrice: $specialPrice, status: $status, visibility: $visibility, stockStatus: $stockStatus, stockQuantity: $stockQuantity, description: $description, shortDescription: $shortDescription, metaTitle: $metaTitle, metaDescription: $metaDescription, metaKeyword: $metaKeyword, categories: $categories, websites: $websites, customAttributes: $customAttributes, mediaGalleryEntries: $mediaGalleryEntries, options: $options, productLinks: $productLinks, tierPrices: $tierPrices, reviews: $reviews, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.typeId, typeId) || other.typeId == typeId) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.specialPrice, specialPrice) ||
                other.specialPrice == specialPrice) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            (identical(other.stockStatus, stockStatus) ||
                other.stockStatus == stockStatus) &&
            (identical(other.stockQuantity, stockQuantity) ||
                other.stockQuantity == stockQuantity) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.shortDescription, shortDescription) ||
                other.shortDescription == shortDescription) &&
            (identical(other.metaTitle, metaTitle) ||
                other.metaTitle == metaTitle) &&
            (identical(other.metaDescription, metaDescription) ||
                other.metaDescription == metaDescription) &&
            (identical(other.metaKeyword, metaKeyword) ||
                other.metaKeyword == metaKeyword) &&
            const DeepCollectionEquality().equals(
              other._categories,
              _categories,
            ) &&
            const DeepCollectionEquality().equals(other._websites, _websites) &&
            const DeepCollectionEquality().equals(
              other._customAttributes,
              _customAttributes,
            ) &&
            const DeepCollectionEquality().equals(
              other._mediaGalleryEntries,
              _mediaGalleryEntries,
            ) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            const DeepCollectionEquality().equals(
              other._productLinks,
              _productLinks,
            ) &&
            const DeepCollectionEquality().equals(
              other._tierPrices,
              _tierPrices,
            ) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    sku,
    name,
    typeId,
    price,
    specialPrice,
    status,
    visibility,
    stockStatus,
    stockQuantity,
    description,
    shortDescription,
    metaTitle,
    metaDescription,
    metaKeyword,
    const DeepCollectionEquality().hash(_categories),
    const DeepCollectionEquality().hash(_websites),
    const DeepCollectionEquality().hash(_customAttributes),
    const DeepCollectionEquality().hash(_mediaGalleryEntries),
    const DeepCollectionEquality().hash(_options),
    const DeepCollectionEquality().hash(_productLinks),
    const DeepCollectionEquality().hash(_tierPrices),
    const DeepCollectionEquality().hash(_reviews),
    createdAt,
    updatedAt,
  ]);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(this);
  }
}

abstract class _Product extends Product {
  const factory _Product({
    required final int id,
    required final String sku,
    required final String name,
    required final String typeId,
    required final double price,
    final double? specialPrice,
    required final int status,
    required final int visibility,
    required final int stockStatus,
    final int? stockQuantity,
    final String? description,
    final String? shortDescription,
    final String? metaTitle,
    final String? metaDescription,
    final String? metaKeyword,
    final List<String>? categories,
    final List<String>? websites,
    final List<CustomAttribute>? customAttributes,
    final List<MediaGalleryEntry>? mediaGalleryEntries,
    final List<ProductOption>? options,
    final List<ProductLink>? productLinks,
    final List<TierPrice>? tierPrices,
    final List<Review>? reviews,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _$ProductImpl;
  const _Product._() : super._();

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  int get id;
  @override
  String get sku;
  @override
  String get name;
  @override
  String get typeId;
  @override
  double get price;
  @override
  double? get specialPrice;
  @override
  int get status;
  @override
  int get visibility;
  @override
  int get stockStatus;
  @override
  int? get stockQuantity;
  @override
  String? get description;
  @override
  String? get shortDescription;
  @override
  String? get metaTitle;
  @override
  String? get metaDescription;
  @override
  String? get metaKeyword;
  @override
  List<String>? get categories;
  @override
  List<String>? get websites;
  @override
  List<CustomAttribute>? get customAttributes;
  @override
  List<MediaGalleryEntry>? get mediaGalleryEntries;
  @override
  List<ProductOption>? get options;
  @override
  List<ProductLink>? get productLinks;
  @override
  List<TierPrice>? get tierPrices;
  @override
  List<Review>? get reviews;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductListResponse _$ProductListResponseFromJson(Map<String, dynamic> json) {
  return _ProductListResponse.fromJson(json);
}

/// @nodoc
mixin _$ProductListResponse {
  List<Product> get items => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  List<Aggregation>? get aggregations => throw _privateConstructorUsedError;
  List<SortOption>? get sortOptions => throw _privateConstructorUsedError;

  /// Serializes this ProductListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductListResponseCopyWith<ProductListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductListResponseCopyWith<$Res> {
  factory $ProductListResponseCopyWith(
    ProductListResponse value,
    $Res Function(ProductListResponse) then,
  ) = _$ProductListResponseCopyWithImpl<$Res, ProductListResponse>;
  @useResult
  $Res call({
    List<Product> items,
    int totalCount,
    int pageSize,
    int currentPage,
    int totalPages,
    List<Aggregation>? aggregations,
    List<SortOption>? sortOptions,
  });
}

/// @nodoc
class _$ProductListResponseCopyWithImpl<$Res, $Val extends ProductListResponse>
    implements $ProductListResponseCopyWith<$Res> {
  _$ProductListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? totalCount = null,
    Object? pageSize = null,
    Object? currentPage = null,
    Object? totalPages = null,
    Object? aggregations = freezed,
    Object? sortOptions = freezed,
  }) {
    return _then(
      _value.copyWith(
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<Product>,
            totalCount: null == totalCount
                ? _value.totalCount
                : totalCount // ignore: cast_nullable_to_non_nullable
                      as int,
            pageSize: null == pageSize
                ? _value.pageSize
                : pageSize // ignore: cast_nullable_to_non_nullable
                      as int,
            currentPage: null == currentPage
                ? _value.currentPage
                : currentPage // ignore: cast_nullable_to_non_nullable
                      as int,
            totalPages: null == totalPages
                ? _value.totalPages
                : totalPages // ignore: cast_nullable_to_non_nullable
                      as int,
            aggregations: freezed == aggregations
                ? _value.aggregations
                : aggregations // ignore: cast_nullable_to_non_nullable
                      as List<Aggregation>?,
            sortOptions: freezed == sortOptions
                ? _value.sortOptions
                : sortOptions // ignore: cast_nullable_to_non_nullable
                      as List<SortOption>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductListResponseImplCopyWith<$Res>
    implements $ProductListResponseCopyWith<$Res> {
  factory _$$ProductListResponseImplCopyWith(
    _$ProductListResponseImpl value,
    $Res Function(_$ProductListResponseImpl) then,
  ) = __$$ProductListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Product> items,
    int totalCount,
    int pageSize,
    int currentPage,
    int totalPages,
    List<Aggregation>? aggregations,
    List<SortOption>? sortOptions,
  });
}

/// @nodoc
class __$$ProductListResponseImplCopyWithImpl<$Res>
    extends _$ProductListResponseCopyWithImpl<$Res, _$ProductListResponseImpl>
    implements _$$ProductListResponseImplCopyWith<$Res> {
  __$$ProductListResponseImplCopyWithImpl(
    _$ProductListResponseImpl _value,
    $Res Function(_$ProductListResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? totalCount = null,
    Object? pageSize = null,
    Object? currentPage = null,
    Object? totalPages = null,
    Object? aggregations = freezed,
    Object? sortOptions = freezed,
  }) {
    return _then(
      _$ProductListResponseImpl(
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<Product>,
        totalCount: null == totalCount
            ? _value.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as int,
        pageSize: null == pageSize
            ? _value.pageSize
            : pageSize // ignore: cast_nullable_to_non_nullable
                  as int,
        currentPage: null == currentPage
            ? _value.currentPage
            : currentPage // ignore: cast_nullable_to_non_nullable
                  as int,
        totalPages: null == totalPages
            ? _value.totalPages
            : totalPages // ignore: cast_nullable_to_non_nullable
                  as int,
        aggregations: freezed == aggregations
            ? _value._aggregations
            : aggregations // ignore: cast_nullable_to_non_nullable
                  as List<Aggregation>?,
        sortOptions: freezed == sortOptions
            ? _value._sortOptions
            : sortOptions // ignore: cast_nullable_to_non_nullable
                  as List<SortOption>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductListResponseImpl implements _ProductListResponse {
  const _$ProductListResponseImpl({
    required final List<Product> items,
    required this.totalCount,
    required this.pageSize,
    required this.currentPage,
    required this.totalPages,
    final List<Aggregation>? aggregations,
    final List<SortOption>? sortOptions,
  }) : _items = items,
       _aggregations = aggregations,
       _sortOptions = sortOptions;

  factory _$ProductListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductListResponseImplFromJson(json);

  final List<Product> _items;
  @override
  List<Product> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int totalCount;
  @override
  final int pageSize;
  @override
  final int currentPage;
  @override
  final int totalPages;
  final List<Aggregation>? _aggregations;
  @override
  List<Aggregation>? get aggregations {
    final value = _aggregations;
    if (value == null) return null;
    if (_aggregations is EqualUnmodifiableListView) return _aggregations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<SortOption>? _sortOptions;
  @override
  List<SortOption>? get sortOptions {
    final value = _sortOptions;
    if (value == null) return null;
    if (_sortOptions is EqualUnmodifiableListView) return _sortOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ProductListResponse(items: $items, totalCount: $totalCount, pageSize: $pageSize, currentPage: $currentPage, totalPages: $totalPages, aggregations: $aggregations, sortOptions: $sortOptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductListResponseImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            const DeepCollectionEquality().equals(
              other._aggregations,
              _aggregations,
            ) &&
            const DeepCollectionEquality().equals(
              other._sortOptions,
              _sortOptions,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_items),
    totalCount,
    pageSize,
    currentPage,
    totalPages,
    const DeepCollectionEquality().hash(_aggregations),
    const DeepCollectionEquality().hash(_sortOptions),
  );

  /// Create a copy of ProductListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductListResponseImplCopyWith<_$ProductListResponseImpl> get copyWith =>
      __$$ProductListResponseImplCopyWithImpl<_$ProductListResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductListResponseImplToJson(this);
  }
}

abstract class _ProductListResponse implements ProductListResponse {
  const factory _ProductListResponse({
    required final List<Product> items,
    required final int totalCount,
    required final int pageSize,
    required final int currentPage,
    required final int totalPages,
    final List<Aggregation>? aggregations,
    final List<SortOption>? sortOptions,
  }) = _$ProductListResponseImpl;

  factory _ProductListResponse.fromJson(Map<String, dynamic> json) =
      _$ProductListResponseImpl.fromJson;

  @override
  List<Product> get items;
  @override
  int get totalCount;
  @override
  int get pageSize;
  @override
  int get currentPage;
  @override
  int get totalPages;
  @override
  List<Aggregation>? get aggregations;
  @override
  List<SortOption>? get sortOptions;

  /// Create a copy of ProductListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductListResponseImplCopyWith<_$ProductListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
mixin _$Category {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  int? get parentId => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  int get childrenCount => throw _privateConstructorUsedError;
  List<Category>? get children => throw _privateConstructorUsedError;
  List<CategoryAttribute>? get attributes => throw _privateConstructorUsedError;

  /// Serializes this Category to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res, Category>;
  @useResult
  $Res call({
    int id,
    String name,
    String? description,
    String? image,
    int? parentId,
    int level,
    int position,
    bool isActive,
    int childrenCount,
    List<Category>? children,
    List<CategoryAttribute>? attributes,
  });
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res, $Val extends Category>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? image = freezed,
    Object? parentId = freezed,
    Object? level = null,
    Object? position = null,
    Object? isActive = null,
    Object? childrenCount = null,
    Object? children = freezed,
    Object? attributes = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            image: freezed == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String?,
            parentId: freezed == parentId
                ? _value.parentId
                : parentId // ignore: cast_nullable_to_non_nullable
                      as int?,
            level: null == level
                ? _value.level
                : level // ignore: cast_nullable_to_non_nullable
                      as int,
            position: null == position
                ? _value.position
                : position // ignore: cast_nullable_to_non_nullable
                      as int,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            childrenCount: null == childrenCount
                ? _value.childrenCount
                : childrenCount // ignore: cast_nullable_to_non_nullable
                      as int,
            children: freezed == children
                ? _value.children
                : children // ignore: cast_nullable_to_non_nullable
                      as List<Category>?,
            attributes: freezed == attributes
                ? _value.attributes
                : attributes // ignore: cast_nullable_to_non_nullable
                      as List<CategoryAttribute>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CategoryImplCopyWith<$Res>
    implements $CategoryCopyWith<$Res> {
  factory _$$CategoryImplCopyWith(
    _$CategoryImpl value,
    $Res Function(_$CategoryImpl) then,
  ) = __$$CategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    String? description,
    String? image,
    int? parentId,
    int level,
    int position,
    bool isActive,
    int childrenCount,
    List<Category>? children,
    List<CategoryAttribute>? attributes,
  });
}

/// @nodoc
class __$$CategoryImplCopyWithImpl<$Res>
    extends _$CategoryCopyWithImpl<$Res, _$CategoryImpl>
    implements _$$CategoryImplCopyWith<$Res> {
  __$$CategoryImplCopyWithImpl(
    _$CategoryImpl _value,
    $Res Function(_$CategoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? image = freezed,
    Object? parentId = freezed,
    Object? level = null,
    Object? position = null,
    Object? isActive = null,
    Object? childrenCount = null,
    Object? children = freezed,
    Object? attributes = freezed,
  }) {
    return _then(
      _$CategoryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        image: freezed == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String?,
        parentId: freezed == parentId
            ? _value.parentId
            : parentId // ignore: cast_nullable_to_non_nullable
                  as int?,
        level: null == level
            ? _value.level
            : level // ignore: cast_nullable_to_non_nullable
                  as int,
        position: null == position
            ? _value.position
            : position // ignore: cast_nullable_to_non_nullable
                  as int,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        childrenCount: null == childrenCount
            ? _value.childrenCount
            : childrenCount // ignore: cast_nullable_to_non_nullable
                  as int,
        children: freezed == children
            ? _value._children
            : children // ignore: cast_nullable_to_non_nullable
                  as List<Category>?,
        attributes: freezed == attributes
            ? _value._attributes
            : attributes // ignore: cast_nullable_to_non_nullable
                  as List<CategoryAttribute>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryImpl implements _Category {
  const _$CategoryImpl({
    required this.id,
    required this.name,
    this.description,
    this.image,
    this.parentId,
    required this.level,
    required this.position,
    required this.isActive,
    required this.childrenCount,
    final List<Category>? children,
    final List<CategoryAttribute>? attributes,
  }) : _children = children,
       _attributes = attributes;

  factory _$CategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String? image;
  @override
  final int? parentId;
  @override
  final int level;
  @override
  final int position;
  @override
  final bool isActive;
  @override
  final int childrenCount;
  final List<Category>? _children;
  @override
  List<Category>? get children {
    final value = _children;
    if (value == null) return null;
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CategoryAttribute>? _attributes;
  @override
  List<CategoryAttribute>? get attributes {
    final value = _attributes;
    if (value == null) return null;
    if (_attributes is EqualUnmodifiableListView) return _attributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Category(id: $id, name: $name, description: $description, image: $image, parentId: $parentId, level: $level, position: $position, isActive: $isActive, childrenCount: $childrenCount, children: $children, attributes: $attributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.childrenCount, childrenCount) ||
                other.childrenCount == childrenCount) &&
            const DeepCollectionEquality().equals(other._children, _children) &&
            const DeepCollectionEquality().equals(
              other._attributes,
              _attributes,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    description,
    image,
    parentId,
    level,
    position,
    isActive,
    childrenCount,
    const DeepCollectionEquality().hash(_children),
    const DeepCollectionEquality().hash(_attributes),
  );

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      __$$CategoryImplCopyWithImpl<_$CategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryImplToJson(this);
  }
}

abstract class _Category implements Category {
  const factory _Category({
    required final int id,
    required final String name,
    final String? description,
    final String? image,
    final int? parentId,
    required final int level,
    required final int position,
    required final bool isActive,
    required final int childrenCount,
    final List<Category>? children,
    final List<CategoryAttribute>? attributes,
  }) = _$CategoryImpl;

  factory _Category.fromJson(Map<String, dynamic> json) =
      _$CategoryImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  String? get image;
  @override
  int? get parentId;
  @override
  int get level;
  @override
  int get position;
  @override
  bool get isActive;
  @override
  int get childrenCount;
  @override
  List<Category>? get children;
  @override
  List<CategoryAttribute>? get attributes;

  /// Create a copy of Category
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryTree _$CategoryTreeFromJson(Map<String, dynamic> json) {
  return _CategoryTree.fromJson(json);
}

/// @nodoc
mixin _$CategoryTree {
  List<Category> get categories => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;

  /// Serializes this CategoryTree to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryTree
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryTreeCopyWith<CategoryTree> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryTreeCopyWith<$Res> {
  factory $CategoryTreeCopyWith(
    CategoryTree value,
    $Res Function(CategoryTree) then,
  ) = _$CategoryTreeCopyWithImpl<$Res, CategoryTree>;
  @useResult
  $Res call({List<Category> categories, int totalCount});
}

/// @nodoc
class _$CategoryTreeCopyWithImpl<$Res, $Val extends CategoryTree>
    implements $CategoryTreeCopyWith<$Res> {
  _$CategoryTreeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryTree
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? categories = null, Object? totalCount = null}) {
    return _then(
      _value.copyWith(
            categories: null == categories
                ? _value.categories
                : categories // ignore: cast_nullable_to_non_nullable
                      as List<Category>,
            totalCount: null == totalCount
                ? _value.totalCount
                : totalCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CategoryTreeImplCopyWith<$Res>
    implements $CategoryTreeCopyWith<$Res> {
  factory _$$CategoryTreeImplCopyWith(
    _$CategoryTreeImpl value,
    $Res Function(_$CategoryTreeImpl) then,
  ) = __$$CategoryTreeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Category> categories, int totalCount});
}

/// @nodoc
class __$$CategoryTreeImplCopyWithImpl<$Res>
    extends _$CategoryTreeCopyWithImpl<$Res, _$CategoryTreeImpl>
    implements _$$CategoryTreeImplCopyWith<$Res> {
  __$$CategoryTreeImplCopyWithImpl(
    _$CategoryTreeImpl _value,
    $Res Function(_$CategoryTreeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CategoryTree
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? categories = null, Object? totalCount = null}) {
    return _then(
      _$CategoryTreeImpl(
        categories: null == categories
            ? _value._categories
            : categories // ignore: cast_nullable_to_non_nullable
                  as List<Category>,
        totalCount: null == totalCount
            ? _value.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryTreeImpl implements _CategoryTree {
  const _$CategoryTreeImpl({
    required final List<Category> categories,
    required this.totalCount,
  }) : _categories = categories;

  factory _$CategoryTreeImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryTreeImplFromJson(json);

  final List<Category> _categories;
  @override
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final int totalCount;

  @override
  String toString() {
    return 'CategoryTree(categories: $categories, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryTreeImpl &&
            const DeepCollectionEquality().equals(
              other._categories,
              _categories,
            ) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_categories),
    totalCount,
  );

  /// Create a copy of CategoryTree
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryTreeImplCopyWith<_$CategoryTreeImpl> get copyWith =>
      __$$CategoryTreeImplCopyWithImpl<_$CategoryTreeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryTreeImplToJson(this);
  }
}

abstract class _CategoryTree implements CategoryTree {
  const factory _CategoryTree({
    required final List<Category> categories,
    required final int totalCount,
  }) = _$CategoryTreeImpl;

  factory _CategoryTree.fromJson(Map<String, dynamic> json) =
      _$CategoryTreeImpl.fromJson;

  @override
  List<Category> get categories;
  @override
  int get totalCount;

  /// Create a copy of CategoryTree
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryTreeImplCopyWith<_$CategoryTreeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductFilterParams _$ProductFilterParamsFromJson(Map<String, dynamic> json) {
  return _ProductFilterParams.fromJson(json);
}

/// @nodoc
mixin _$ProductFilterParams {
  int? get page => throw _privateConstructorUsedError;
  int? get pageSize => throw _privateConstructorUsedError;
  String? get searchQuery => throw _privateConstructorUsedError;
  String? get categoryId => throw _privateConstructorUsedError;
  String? get sortBy => throw _privateConstructorUsedError;
  String? get sortOrder => throw _privateConstructorUsedError;
  Map<String, dynamic>? get filters => throw _privateConstructorUsedError;
  double? get minPrice => throw _privateConstructorUsedError;
  double? get maxPrice => throw _privateConstructorUsedError;
  List<String>? get attributes => throw _privateConstructorUsedError;
  bool? get inStock => throw _privateConstructorUsedError;
  String? get brand => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;

  /// Serializes this ProductFilterParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductFilterParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductFilterParamsCopyWith<ProductFilterParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductFilterParamsCopyWith<$Res> {
  factory $ProductFilterParamsCopyWith(
    ProductFilterParams value,
    $Res Function(ProductFilterParams) then,
  ) = _$ProductFilterParamsCopyWithImpl<$Res, ProductFilterParams>;
  @useResult
  $Res call({
    int? page,
    int? pageSize,
    String? searchQuery,
    String? categoryId,
    String? sortBy,
    String? sortOrder,
    Map<String, dynamic>? filters,
    double? minPrice,
    double? maxPrice,
    List<String>? attributes,
    bool? inStock,
    String? brand,
    List<String>? tags,
  });
}

/// @nodoc
class _$ProductFilterParamsCopyWithImpl<$Res, $Val extends ProductFilterParams>
    implements $ProductFilterParamsCopyWith<$Res> {
  _$ProductFilterParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductFilterParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? pageSize = freezed,
    Object? searchQuery = freezed,
    Object? categoryId = freezed,
    Object? sortBy = freezed,
    Object? sortOrder = freezed,
    Object? filters = freezed,
    Object? minPrice = freezed,
    Object? maxPrice = freezed,
    Object? attributes = freezed,
    Object? inStock = freezed,
    Object? brand = freezed,
    Object? tags = freezed,
  }) {
    return _then(
      _value.copyWith(
            page: freezed == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                      as int?,
            pageSize: freezed == pageSize
                ? _value.pageSize
                : pageSize // ignore: cast_nullable_to_non_nullable
                      as int?,
            searchQuery: freezed == searchQuery
                ? _value.searchQuery
                : searchQuery // ignore: cast_nullable_to_non_nullable
                      as String?,
            categoryId: freezed == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                      as String?,
            sortBy: freezed == sortBy
                ? _value.sortBy
                : sortBy // ignore: cast_nullable_to_non_nullable
                      as String?,
            sortOrder: freezed == sortOrder
                ? _value.sortOrder
                : sortOrder // ignore: cast_nullable_to_non_nullable
                      as String?,
            filters: freezed == filters
                ? _value.filters
                : filters // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            minPrice: freezed == minPrice
                ? _value.minPrice
                : minPrice // ignore: cast_nullable_to_non_nullable
                      as double?,
            maxPrice: freezed == maxPrice
                ? _value.maxPrice
                : maxPrice // ignore: cast_nullable_to_non_nullable
                      as double?,
            attributes: freezed == attributes
                ? _value.attributes
                : attributes // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            inStock: freezed == inStock
                ? _value.inStock
                : inStock // ignore: cast_nullable_to_non_nullable
                      as bool?,
            brand: freezed == brand
                ? _value.brand
                : brand // ignore: cast_nullable_to_non_nullable
                      as String?,
            tags: freezed == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductFilterParamsImplCopyWith<$Res>
    implements $ProductFilterParamsCopyWith<$Res> {
  factory _$$ProductFilterParamsImplCopyWith(
    _$ProductFilterParamsImpl value,
    $Res Function(_$ProductFilterParamsImpl) then,
  ) = __$$ProductFilterParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? page,
    int? pageSize,
    String? searchQuery,
    String? categoryId,
    String? sortBy,
    String? sortOrder,
    Map<String, dynamic>? filters,
    double? minPrice,
    double? maxPrice,
    List<String>? attributes,
    bool? inStock,
    String? brand,
    List<String>? tags,
  });
}

/// @nodoc
class __$$ProductFilterParamsImplCopyWithImpl<$Res>
    extends _$ProductFilterParamsCopyWithImpl<$Res, _$ProductFilterParamsImpl>
    implements _$$ProductFilterParamsImplCopyWith<$Res> {
  __$$ProductFilterParamsImplCopyWithImpl(
    _$ProductFilterParamsImpl _value,
    $Res Function(_$ProductFilterParamsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductFilterParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? pageSize = freezed,
    Object? searchQuery = freezed,
    Object? categoryId = freezed,
    Object? sortBy = freezed,
    Object? sortOrder = freezed,
    Object? filters = freezed,
    Object? minPrice = freezed,
    Object? maxPrice = freezed,
    Object? attributes = freezed,
    Object? inStock = freezed,
    Object? brand = freezed,
    Object? tags = freezed,
  }) {
    return _then(
      _$ProductFilterParamsImpl(
        page: freezed == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int?,
        pageSize: freezed == pageSize
            ? _value.pageSize
            : pageSize // ignore: cast_nullable_to_non_nullable
                  as int?,
        searchQuery: freezed == searchQuery
            ? _value.searchQuery
            : searchQuery // ignore: cast_nullable_to_non_nullable
                  as String?,
        categoryId: freezed == categoryId
            ? _value.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as String?,
        sortBy: freezed == sortBy
            ? _value.sortBy
            : sortBy // ignore: cast_nullable_to_non_nullable
                  as String?,
        sortOrder: freezed == sortOrder
            ? _value.sortOrder
            : sortOrder // ignore: cast_nullable_to_non_nullable
                  as String?,
        filters: freezed == filters
            ? _value._filters
            : filters // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        minPrice: freezed == minPrice
            ? _value.minPrice
            : minPrice // ignore: cast_nullable_to_non_nullable
                  as double?,
        maxPrice: freezed == maxPrice
            ? _value.maxPrice
            : maxPrice // ignore: cast_nullable_to_non_nullable
                  as double?,
        attributes: freezed == attributes
            ? _value._attributes
            : attributes // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        inStock: freezed == inStock
            ? _value.inStock
            : inStock // ignore: cast_nullable_to_non_nullable
                  as bool?,
        brand: freezed == brand
            ? _value.brand
            : brand // ignore: cast_nullable_to_non_nullable
                  as String?,
        tags: freezed == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductFilterParamsImpl implements _ProductFilterParams {
  const _$ProductFilterParamsImpl({
    this.page,
    this.pageSize,
    this.searchQuery,
    this.categoryId,
    this.sortBy,
    this.sortOrder,
    final Map<String, dynamic>? filters,
    this.minPrice,
    this.maxPrice,
    final List<String>? attributes,
    this.inStock,
    this.brand,
    final List<String>? tags,
  }) : _filters = filters,
       _attributes = attributes,
       _tags = tags;

  factory _$ProductFilterParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductFilterParamsImplFromJson(json);

  @override
  final int? page;
  @override
  final int? pageSize;
  @override
  final String? searchQuery;
  @override
  final String? categoryId;
  @override
  final String? sortBy;
  @override
  final String? sortOrder;
  final Map<String, dynamic>? _filters;
  @override
  Map<String, dynamic>? get filters {
    final value = _filters;
    if (value == null) return null;
    if (_filters is EqualUnmodifiableMapView) return _filters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final double? minPrice;
  @override
  final double? maxPrice;
  final List<String>? _attributes;
  @override
  List<String>? get attributes {
    final value = _attributes;
    if (value == null) return null;
    if (_attributes is EqualUnmodifiableListView) return _attributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? inStock;
  @override
  final String? brand;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ProductFilterParams(page: $page, pageSize: $pageSize, searchQuery: $searchQuery, categoryId: $categoryId, sortBy: $sortBy, sortOrder: $sortOrder, filters: $filters, minPrice: $minPrice, maxPrice: $maxPrice, attributes: $attributes, inStock: $inStock, brand: $brand, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductFilterParamsImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            const DeepCollectionEquality().equals(other._filters, _filters) &&
            (identical(other.minPrice, minPrice) ||
                other.minPrice == minPrice) &&
            (identical(other.maxPrice, maxPrice) ||
                other.maxPrice == maxPrice) &&
            const DeepCollectionEquality().equals(
              other._attributes,
              _attributes,
            ) &&
            (identical(other.inStock, inStock) || other.inStock == inStock) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    page,
    pageSize,
    searchQuery,
    categoryId,
    sortBy,
    sortOrder,
    const DeepCollectionEquality().hash(_filters),
    minPrice,
    maxPrice,
    const DeepCollectionEquality().hash(_attributes),
    inStock,
    brand,
    const DeepCollectionEquality().hash(_tags),
  );

  /// Create a copy of ProductFilterParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductFilterParamsImplCopyWith<_$ProductFilterParamsImpl> get copyWith =>
      __$$ProductFilterParamsImplCopyWithImpl<_$ProductFilterParamsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductFilterParamsImplToJson(this);
  }
}

abstract class _ProductFilterParams implements ProductFilterParams {
  const factory _ProductFilterParams({
    final int? page,
    final int? pageSize,
    final String? searchQuery,
    final String? categoryId,
    final String? sortBy,
    final String? sortOrder,
    final Map<String, dynamic>? filters,
    final double? minPrice,
    final double? maxPrice,
    final List<String>? attributes,
    final bool? inStock,
    final String? brand,
    final List<String>? tags,
  }) = _$ProductFilterParamsImpl;

  factory _ProductFilterParams.fromJson(Map<String, dynamic> json) =
      _$ProductFilterParamsImpl.fromJson;

  @override
  int? get page;
  @override
  int? get pageSize;
  @override
  String? get searchQuery;
  @override
  String? get categoryId;
  @override
  String? get sortBy;
  @override
  String? get sortOrder;
  @override
  Map<String, dynamic>? get filters;
  @override
  double? get minPrice;
  @override
  double? get maxPrice;
  @override
  List<String>? get attributes;
  @override
  bool? get inStock;
  @override
  String? get brand;
  @override
  List<String>? get tags;

  /// Create a copy of ProductFilterParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductFilterParamsImplCopyWith<_$ProductFilterParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomAttribute _$CustomAttributeFromJson(Map<String, dynamic> json) {
  return _CustomAttribute.fromJson(json);
}

/// @nodoc
mixin _$CustomAttribute {
  String get attributeCode => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  List<String>? get options => throw _privateConstructorUsedError;

  /// Serializes this CustomAttribute to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomAttribute
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomAttributeCopyWith<CustomAttribute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomAttributeCopyWith<$Res> {
  factory $CustomAttributeCopyWith(
    CustomAttribute value,
    $Res Function(CustomAttribute) then,
  ) = _$CustomAttributeCopyWithImpl<$Res, CustomAttribute>;
  @useResult
  $Res call({
    String attributeCode,
    String value,
    String? label,
    String? type,
    List<String>? options,
  });
}

/// @nodoc
class _$CustomAttributeCopyWithImpl<$Res, $Val extends CustomAttribute>
    implements $CustomAttributeCopyWith<$Res> {
  _$CustomAttributeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomAttribute
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attributeCode = null,
    Object? value = null,
    Object? label = freezed,
    Object? type = freezed,
    Object? options = freezed,
  }) {
    return _then(
      _value.copyWith(
            attributeCode: null == attributeCode
                ? _value.attributeCode
                : attributeCode // ignore: cast_nullable_to_non_nullable
                      as String,
            value: null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as String,
            label: freezed == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String?,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String?,
            options: freezed == options
                ? _value.options
                : options // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CustomAttributeImplCopyWith<$Res>
    implements $CustomAttributeCopyWith<$Res> {
  factory _$$CustomAttributeImplCopyWith(
    _$CustomAttributeImpl value,
    $Res Function(_$CustomAttributeImpl) then,
  ) = __$$CustomAttributeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String attributeCode,
    String value,
    String? label,
    String? type,
    List<String>? options,
  });
}

/// @nodoc
class __$$CustomAttributeImplCopyWithImpl<$Res>
    extends _$CustomAttributeCopyWithImpl<$Res, _$CustomAttributeImpl>
    implements _$$CustomAttributeImplCopyWith<$Res> {
  __$$CustomAttributeImplCopyWithImpl(
    _$CustomAttributeImpl _value,
    $Res Function(_$CustomAttributeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CustomAttribute
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attributeCode = null,
    Object? value = null,
    Object? label = freezed,
    Object? type = freezed,
    Object? options = freezed,
  }) {
    return _then(
      _$CustomAttributeImpl(
        attributeCode: null == attributeCode
            ? _value.attributeCode
            : attributeCode // ignore: cast_nullable_to_non_nullable
                  as String,
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as String,
        label: freezed == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String?,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String?,
        options: freezed == options
            ? _value._options
            : options // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomAttributeImpl implements _CustomAttribute {
  const _$CustomAttributeImpl({
    required this.attributeCode,
    required this.value,
    this.label,
    this.type,
    final List<String>? options,
  }) : _options = options;

  factory _$CustomAttributeImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomAttributeImplFromJson(json);

  @override
  final String attributeCode;
  @override
  final String value;
  @override
  final String? label;
  @override
  final String? type;
  final List<String>? _options;
  @override
  List<String>? get options {
    final value = _options;
    if (value == null) return null;
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CustomAttribute(attributeCode: $attributeCode, value: $value, label: $label, type: $type, options: $options)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomAttributeImpl &&
            (identical(other.attributeCode, attributeCode) ||
                other.attributeCode == attributeCode) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    attributeCode,
    value,
    label,
    type,
    const DeepCollectionEquality().hash(_options),
  );

  /// Create a copy of CustomAttribute
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomAttributeImplCopyWith<_$CustomAttributeImpl> get copyWith =>
      __$$CustomAttributeImplCopyWithImpl<_$CustomAttributeImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomAttributeImplToJson(this);
  }
}

abstract class _CustomAttribute implements CustomAttribute {
  const factory _CustomAttribute({
    required final String attributeCode,
    required final String value,
    final String? label,
    final String? type,
    final List<String>? options,
  }) = _$CustomAttributeImpl;

  factory _CustomAttribute.fromJson(Map<String, dynamic> json) =
      _$CustomAttributeImpl.fromJson;

  @override
  String get attributeCode;
  @override
  String get value;
  @override
  String? get label;
  @override
  String? get type;
  @override
  List<String>? get options;

  /// Create a copy of CustomAttribute
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomAttributeImplCopyWith<_$CustomAttributeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MediaGalleryEntry _$MediaGalleryEntryFromJson(Map<String, dynamic> json) {
  return _MediaGalleryEntry.fromJson(json);
}

/// @nodoc
mixin _$MediaGalleryEntry {
  int get id => throw _privateConstructorUsedError;
  String get mediaType => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;
  bool get disabled => throw _privateConstructorUsedError;
  List<String>? get types => throw _privateConstructorUsedError;
  String get file => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;
  String? get smallImage => throw _privateConstructorUsedError;
  String? get baseImage => throw _privateConstructorUsedError;

  /// Serializes this MediaGalleryEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MediaGalleryEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MediaGalleryEntryCopyWith<MediaGalleryEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaGalleryEntryCopyWith<$Res> {
  factory $MediaGalleryEntryCopyWith(
    MediaGalleryEntry value,
    $Res Function(MediaGalleryEntry) then,
  ) = _$MediaGalleryEntryCopyWithImpl<$Res, MediaGalleryEntry>;
  @useResult
  $Res call({
    int id,
    String mediaType,
    String label,
    int position,
    bool disabled,
    List<String>? types,
    String file,
    String? thumbnail,
    String? smallImage,
    String? baseImage,
  });
}

/// @nodoc
class _$MediaGalleryEntryCopyWithImpl<$Res, $Val extends MediaGalleryEntry>
    implements $MediaGalleryEntryCopyWith<$Res> {
  _$MediaGalleryEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MediaGalleryEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mediaType = null,
    Object? label = null,
    Object? position = null,
    Object? disabled = null,
    Object? types = freezed,
    Object? file = null,
    Object? thumbnail = freezed,
    Object? smallImage = freezed,
    Object? baseImage = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            mediaType: null == mediaType
                ? _value.mediaType
                : mediaType // ignore: cast_nullable_to_non_nullable
                      as String,
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            position: null == position
                ? _value.position
                : position // ignore: cast_nullable_to_non_nullable
                      as int,
            disabled: null == disabled
                ? _value.disabled
                : disabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            types: freezed == types
                ? _value.types
                : types // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            file: null == file
                ? _value.file
                : file // ignore: cast_nullable_to_non_nullable
                      as String,
            thumbnail: freezed == thumbnail
                ? _value.thumbnail
                : thumbnail // ignore: cast_nullable_to_non_nullable
                      as String?,
            smallImage: freezed == smallImage
                ? _value.smallImage
                : smallImage // ignore: cast_nullable_to_non_nullable
                      as String?,
            baseImage: freezed == baseImage
                ? _value.baseImage
                : baseImage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MediaGalleryEntryImplCopyWith<$Res>
    implements $MediaGalleryEntryCopyWith<$Res> {
  factory _$$MediaGalleryEntryImplCopyWith(
    _$MediaGalleryEntryImpl value,
    $Res Function(_$MediaGalleryEntryImpl) then,
  ) = __$$MediaGalleryEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String mediaType,
    String label,
    int position,
    bool disabled,
    List<String>? types,
    String file,
    String? thumbnail,
    String? smallImage,
    String? baseImage,
  });
}

/// @nodoc
class __$$MediaGalleryEntryImplCopyWithImpl<$Res>
    extends _$MediaGalleryEntryCopyWithImpl<$Res, _$MediaGalleryEntryImpl>
    implements _$$MediaGalleryEntryImplCopyWith<$Res> {
  __$$MediaGalleryEntryImplCopyWithImpl(
    _$MediaGalleryEntryImpl _value,
    $Res Function(_$MediaGalleryEntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MediaGalleryEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mediaType = null,
    Object? label = null,
    Object? position = null,
    Object? disabled = null,
    Object? types = freezed,
    Object? file = null,
    Object? thumbnail = freezed,
    Object? smallImage = freezed,
    Object? baseImage = freezed,
  }) {
    return _then(
      _$MediaGalleryEntryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        mediaType: null == mediaType
            ? _value.mediaType
            : mediaType // ignore: cast_nullable_to_non_nullable
                  as String,
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        position: null == position
            ? _value.position
            : position // ignore: cast_nullable_to_non_nullable
                  as int,
        disabled: null == disabled
            ? _value.disabled
            : disabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        types: freezed == types
            ? _value._types
            : types // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        file: null == file
            ? _value.file
            : file // ignore: cast_nullable_to_non_nullable
                  as String,
        thumbnail: freezed == thumbnail
            ? _value.thumbnail
            : thumbnail // ignore: cast_nullable_to_non_nullable
                  as String?,
        smallImage: freezed == smallImage
            ? _value.smallImage
            : smallImage // ignore: cast_nullable_to_non_nullable
                  as String?,
        baseImage: freezed == baseImage
            ? _value.baseImage
            : baseImage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaGalleryEntryImpl implements _MediaGalleryEntry {
  const _$MediaGalleryEntryImpl({
    required this.id,
    required this.mediaType,
    required this.label,
    required this.position,
    required this.disabled,
    final List<String>? types,
    required this.file,
    this.thumbnail,
    this.smallImage,
    this.baseImage,
  }) : _types = types;

  factory _$MediaGalleryEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaGalleryEntryImplFromJson(json);

  @override
  final int id;
  @override
  final String mediaType;
  @override
  final String label;
  @override
  final int position;
  @override
  final bool disabled;
  final List<String>? _types;
  @override
  List<String>? get types {
    final value = _types;
    if (value == null) return null;
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String file;
  @override
  final String? thumbnail;
  @override
  final String? smallImage;
  @override
  final String? baseImage;

  @override
  String toString() {
    return 'MediaGalleryEntry(id: $id, mediaType: $mediaType, label: $label, position: $position, disabled: $disabled, types: $types, file: $file, thumbnail: $thumbnail, smallImage: $smallImage, baseImage: $baseImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaGalleryEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.disabled, disabled) ||
                other.disabled == disabled) &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.smallImage, smallImage) ||
                other.smallImage == smallImage) &&
            (identical(other.baseImage, baseImage) ||
                other.baseImage == baseImage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    mediaType,
    label,
    position,
    disabled,
    const DeepCollectionEquality().hash(_types),
    file,
    thumbnail,
    smallImage,
    baseImage,
  );

  /// Create a copy of MediaGalleryEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaGalleryEntryImplCopyWith<_$MediaGalleryEntryImpl> get copyWith =>
      __$$MediaGalleryEntryImplCopyWithImpl<_$MediaGalleryEntryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaGalleryEntryImplToJson(this);
  }
}

abstract class _MediaGalleryEntry implements MediaGalleryEntry {
  const factory _MediaGalleryEntry({
    required final int id,
    required final String mediaType,
    required final String label,
    required final int position,
    required final bool disabled,
    final List<String>? types,
    required final String file,
    final String? thumbnail,
    final String? smallImage,
    final String? baseImage,
  }) = _$MediaGalleryEntryImpl;

  factory _MediaGalleryEntry.fromJson(Map<String, dynamic> json) =
      _$MediaGalleryEntryImpl.fromJson;

  @override
  int get id;
  @override
  String get mediaType;
  @override
  String get label;
  @override
  int get position;
  @override
  bool get disabled;
  @override
  List<String>? get types;
  @override
  String get file;
  @override
  String? get thumbnail;
  @override
  String? get smallImage;
  @override
  String? get baseImage;

  /// Create a copy of MediaGalleryEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MediaGalleryEntryImplCopyWith<_$MediaGalleryEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductOption _$ProductOptionFromJson(Map<String, dynamic> json) {
  return _ProductOption.fromJson(json);
}

/// @nodoc
mixin _$ProductOption {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  bool get required => throw _privateConstructorUsedError;
  List<ProductOptionValue>? get values => throw _privateConstructorUsedError;
  String? get defaultValue => throw _privateConstructorUsedError;
  int? get maxCharacters => throw _privateConstructorUsedError;
  String? get fileExtension => throw _privateConstructorUsedError;
  String? get imageSizeX => throw _privateConstructorUsedError;
  String? get imageSizeY => throw _privateConstructorUsedError;

  /// Serializes this ProductOption to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductOptionCopyWith<ProductOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductOptionCopyWith<$Res> {
  factory $ProductOptionCopyWith(
    ProductOption value,
    $Res Function(ProductOption) then,
  ) = _$ProductOptionCopyWithImpl<$Res, ProductOption>;
  @useResult
  $Res call({
    int id,
    String title,
    String type,
    bool required,
    List<ProductOptionValue>? values,
    String? defaultValue,
    int? maxCharacters,
    String? fileExtension,
    String? imageSizeX,
    String? imageSizeY,
  });
}

/// @nodoc
class _$ProductOptionCopyWithImpl<$Res, $Val extends ProductOption>
    implements $ProductOptionCopyWith<$Res> {
  _$ProductOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? required = null,
    Object? values = freezed,
    Object? defaultValue = freezed,
    Object? maxCharacters = freezed,
    Object? fileExtension = freezed,
    Object? imageSizeX = freezed,
    Object? imageSizeY = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            required: null == required
                ? _value.required
                : required // ignore: cast_nullable_to_non_nullable
                      as bool,
            values: freezed == values
                ? _value.values
                : values // ignore: cast_nullable_to_non_nullable
                      as List<ProductOptionValue>?,
            defaultValue: freezed == defaultValue
                ? _value.defaultValue
                : defaultValue // ignore: cast_nullable_to_non_nullable
                      as String?,
            maxCharacters: freezed == maxCharacters
                ? _value.maxCharacters
                : maxCharacters // ignore: cast_nullable_to_non_nullable
                      as int?,
            fileExtension: freezed == fileExtension
                ? _value.fileExtension
                : fileExtension // ignore: cast_nullable_to_non_nullable
                      as String?,
            imageSizeX: freezed == imageSizeX
                ? _value.imageSizeX
                : imageSizeX // ignore: cast_nullable_to_non_nullable
                      as String?,
            imageSizeY: freezed == imageSizeY
                ? _value.imageSizeY
                : imageSizeY // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductOptionImplCopyWith<$Res>
    implements $ProductOptionCopyWith<$Res> {
  factory _$$ProductOptionImplCopyWith(
    _$ProductOptionImpl value,
    $Res Function(_$ProductOptionImpl) then,
  ) = __$$ProductOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String title,
    String type,
    bool required,
    List<ProductOptionValue>? values,
    String? defaultValue,
    int? maxCharacters,
    String? fileExtension,
    String? imageSizeX,
    String? imageSizeY,
  });
}

/// @nodoc
class __$$ProductOptionImplCopyWithImpl<$Res>
    extends _$ProductOptionCopyWithImpl<$Res, _$ProductOptionImpl>
    implements _$$ProductOptionImplCopyWith<$Res> {
  __$$ProductOptionImplCopyWithImpl(
    _$ProductOptionImpl _value,
    $Res Function(_$ProductOptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? type = null,
    Object? required = null,
    Object? values = freezed,
    Object? defaultValue = freezed,
    Object? maxCharacters = freezed,
    Object? fileExtension = freezed,
    Object? imageSizeX = freezed,
    Object? imageSizeY = freezed,
  }) {
    return _then(
      _$ProductOptionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        required: null == required
            ? _value.required
            : required // ignore: cast_nullable_to_non_nullable
                  as bool,
        values: freezed == values
            ? _value._values
            : values // ignore: cast_nullable_to_non_nullable
                  as List<ProductOptionValue>?,
        defaultValue: freezed == defaultValue
            ? _value.defaultValue
            : defaultValue // ignore: cast_nullable_to_non_nullable
                  as String?,
        maxCharacters: freezed == maxCharacters
            ? _value.maxCharacters
            : maxCharacters // ignore: cast_nullable_to_non_nullable
                  as int?,
        fileExtension: freezed == fileExtension
            ? _value.fileExtension
            : fileExtension // ignore: cast_nullable_to_non_nullable
                  as String?,
        imageSizeX: freezed == imageSizeX
            ? _value.imageSizeX
            : imageSizeX // ignore: cast_nullable_to_non_nullable
                  as String?,
        imageSizeY: freezed == imageSizeY
            ? _value.imageSizeY
            : imageSizeY // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductOptionImpl implements _ProductOption {
  const _$ProductOptionImpl({
    required this.id,
    required this.title,
    required this.type,
    required this.required,
    final List<ProductOptionValue>? values,
    this.defaultValue,
    this.maxCharacters,
    this.fileExtension,
    this.imageSizeX,
    this.imageSizeY,
  }) : _values = values;

  factory _$ProductOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductOptionImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String type;
  @override
  final bool required;
  final List<ProductOptionValue>? _values;
  @override
  List<ProductOptionValue>? get values {
    final value = _values;
    if (value == null) return null;
    if (_values is EqualUnmodifiableListView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? defaultValue;
  @override
  final int? maxCharacters;
  @override
  final String? fileExtension;
  @override
  final String? imageSizeX;
  @override
  final String? imageSizeY;

  @override
  String toString() {
    return 'ProductOption(id: $id, title: $title, type: $type, required: $required, values: $values, defaultValue: $defaultValue, maxCharacters: $maxCharacters, fileExtension: $fileExtension, imageSizeX: $imageSizeX, imageSizeY: $imageSizeY)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductOptionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.required, required) ||
                other.required == required) &&
            const DeepCollectionEquality().equals(other._values, _values) &&
            (identical(other.defaultValue, defaultValue) ||
                other.defaultValue == defaultValue) &&
            (identical(other.maxCharacters, maxCharacters) ||
                other.maxCharacters == maxCharacters) &&
            (identical(other.fileExtension, fileExtension) ||
                other.fileExtension == fileExtension) &&
            (identical(other.imageSizeX, imageSizeX) ||
                other.imageSizeX == imageSizeX) &&
            (identical(other.imageSizeY, imageSizeY) ||
                other.imageSizeY == imageSizeY));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    type,
    required,
    const DeepCollectionEquality().hash(_values),
    defaultValue,
    maxCharacters,
    fileExtension,
    imageSizeX,
    imageSizeY,
  );

  /// Create a copy of ProductOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductOptionImplCopyWith<_$ProductOptionImpl> get copyWith =>
      __$$ProductOptionImplCopyWithImpl<_$ProductOptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductOptionImplToJson(this);
  }
}

abstract class _ProductOption implements ProductOption {
  const factory _ProductOption({
    required final int id,
    required final String title,
    required final String type,
    required final bool required,
    final List<ProductOptionValue>? values,
    final String? defaultValue,
    final int? maxCharacters,
    final String? fileExtension,
    final String? imageSizeX,
    final String? imageSizeY,
  }) = _$ProductOptionImpl;

  factory _ProductOption.fromJson(Map<String, dynamic> json) =
      _$ProductOptionImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get type;
  @override
  bool get required;
  @override
  List<ProductOptionValue>? get values;
  @override
  String? get defaultValue;
  @override
  int? get maxCharacters;
  @override
  String? get fileExtension;
  @override
  String? get imageSizeX;
  @override
  String? get imageSizeY;

  /// Create a copy of ProductOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductOptionImplCopyWith<_$ProductOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductOptionValue _$ProductOptionValueFromJson(Map<String, dynamic> json) {
  return _ProductOptionValue.fromJson(json);
}

/// @nodoc
mixin _$ProductOptionValue {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  String? get priceType => throw _privateConstructorUsedError;
  String? get sku => throw _privateConstructorUsedError;
  int? get sortOrder => throw _privateConstructorUsedError;

  /// Serializes this ProductOptionValue to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductOptionValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductOptionValueCopyWith<ProductOptionValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductOptionValueCopyWith<$Res> {
  factory $ProductOptionValueCopyWith(
    ProductOptionValue value,
    $Res Function(ProductOptionValue) then,
  ) = _$ProductOptionValueCopyWithImpl<$Res, ProductOptionValue>;
  @useResult
  $Res call({
    int id,
    String title,
    double? price,
    String? priceType,
    String? sku,
    int? sortOrder,
  });
}

/// @nodoc
class _$ProductOptionValueCopyWithImpl<$Res, $Val extends ProductOptionValue>
    implements $ProductOptionValueCopyWith<$Res> {
  _$ProductOptionValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductOptionValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? price = freezed,
    Object? priceType = freezed,
    Object? sku = freezed,
    Object? sortOrder = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            price: freezed == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as double?,
            priceType: freezed == priceType
                ? _value.priceType
                : priceType // ignore: cast_nullable_to_non_nullable
                      as String?,
            sku: freezed == sku
                ? _value.sku
                : sku // ignore: cast_nullable_to_non_nullable
                      as String?,
            sortOrder: freezed == sortOrder
                ? _value.sortOrder
                : sortOrder // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductOptionValueImplCopyWith<$Res>
    implements $ProductOptionValueCopyWith<$Res> {
  factory _$$ProductOptionValueImplCopyWith(
    _$ProductOptionValueImpl value,
    $Res Function(_$ProductOptionValueImpl) then,
  ) = __$$ProductOptionValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String title,
    double? price,
    String? priceType,
    String? sku,
    int? sortOrder,
  });
}

/// @nodoc
class __$$ProductOptionValueImplCopyWithImpl<$Res>
    extends _$ProductOptionValueCopyWithImpl<$Res, _$ProductOptionValueImpl>
    implements _$$ProductOptionValueImplCopyWith<$Res> {
  __$$ProductOptionValueImplCopyWithImpl(
    _$ProductOptionValueImpl _value,
    $Res Function(_$ProductOptionValueImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductOptionValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? price = freezed,
    Object? priceType = freezed,
    Object? sku = freezed,
    Object? sortOrder = freezed,
  }) {
    return _then(
      _$ProductOptionValueImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        price: freezed == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as double?,
        priceType: freezed == priceType
            ? _value.priceType
            : priceType // ignore: cast_nullable_to_non_nullable
                  as String?,
        sku: freezed == sku
            ? _value.sku
            : sku // ignore: cast_nullable_to_non_nullable
                  as String?,
        sortOrder: freezed == sortOrder
            ? _value.sortOrder
            : sortOrder // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductOptionValueImpl implements _ProductOptionValue {
  const _$ProductOptionValueImpl({
    required this.id,
    required this.title,
    this.price,
    this.priceType,
    this.sku,
    this.sortOrder,
  });

  factory _$ProductOptionValueImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductOptionValueImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final double? price;
  @override
  final String? priceType;
  @override
  final String? sku;
  @override
  final int? sortOrder;

  @override
  String toString() {
    return 'ProductOptionValue(id: $id, title: $title, price: $price, priceType: $priceType, sku: $sku, sortOrder: $sortOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductOptionValueImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.priceType, priceType) ||
                other.priceType == priceType) &&
            (identical(other.sku, sku) || other.sku == sku) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, price, priceType, sku, sortOrder);

  /// Create a copy of ProductOptionValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductOptionValueImplCopyWith<_$ProductOptionValueImpl> get copyWith =>
      __$$ProductOptionValueImplCopyWithImpl<_$ProductOptionValueImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductOptionValueImplToJson(this);
  }
}

abstract class _ProductOptionValue implements ProductOptionValue {
  const factory _ProductOptionValue({
    required final int id,
    required final String title,
    final double? price,
    final String? priceType,
    final String? sku,
    final int? sortOrder,
  }) = _$ProductOptionValueImpl;

  factory _ProductOptionValue.fromJson(Map<String, dynamic> json) =
      _$ProductOptionValueImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  double? get price;
  @override
  String? get priceType;
  @override
  String? get sku;
  @override
  int? get sortOrder;

  /// Create a copy of ProductOptionValue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductOptionValueImplCopyWith<_$ProductOptionValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductLink _$ProductLinkFromJson(Map<String, dynamic> json) {
  return _ProductLink.fromJson(json);
}

/// @nodoc
mixin _$ProductLink {
  int get id => throw _privateConstructorUsedError;
  String get linkType => throw _privateConstructorUsedError;
  Product get linkedProduct => throw _privateConstructorUsedError;
  int? get position => throw _privateConstructorUsedError;

  /// Serializes this ProductLink to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductLinkCopyWith<ProductLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductLinkCopyWith<$Res> {
  factory $ProductLinkCopyWith(
    ProductLink value,
    $Res Function(ProductLink) then,
  ) = _$ProductLinkCopyWithImpl<$Res, ProductLink>;
  @useResult
  $Res call({int id, String linkType, Product linkedProduct, int? position});

  $ProductCopyWith<$Res> get linkedProduct;
}

/// @nodoc
class _$ProductLinkCopyWithImpl<$Res, $Val extends ProductLink>
    implements $ProductLinkCopyWith<$Res> {
  _$ProductLinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductLink
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? linkType = null,
    Object? linkedProduct = null,
    Object? position = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            linkType: null == linkType
                ? _value.linkType
                : linkType // ignore: cast_nullable_to_non_nullable
                      as String,
            linkedProduct: null == linkedProduct
                ? _value.linkedProduct
                : linkedProduct // ignore: cast_nullable_to_non_nullable
                      as Product,
            position: freezed == position
                ? _value.position
                : position // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }

  /// Create a copy of ProductLink
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get linkedProduct {
    return $ProductCopyWith<$Res>(_value.linkedProduct, (value) {
      return _then(_value.copyWith(linkedProduct: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductLinkImplCopyWith<$Res>
    implements $ProductLinkCopyWith<$Res> {
  factory _$$ProductLinkImplCopyWith(
    _$ProductLinkImpl value,
    $Res Function(_$ProductLinkImpl) then,
  ) = __$$ProductLinkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String linkType, Product linkedProduct, int? position});

  @override
  $ProductCopyWith<$Res> get linkedProduct;
}

/// @nodoc
class __$$ProductLinkImplCopyWithImpl<$Res>
    extends _$ProductLinkCopyWithImpl<$Res, _$ProductLinkImpl>
    implements _$$ProductLinkImplCopyWith<$Res> {
  __$$ProductLinkImplCopyWithImpl(
    _$ProductLinkImpl _value,
    $Res Function(_$ProductLinkImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductLink
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? linkType = null,
    Object? linkedProduct = null,
    Object? position = freezed,
  }) {
    return _then(
      _$ProductLinkImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        linkType: null == linkType
            ? _value.linkType
            : linkType // ignore: cast_nullable_to_non_nullable
                  as String,
        linkedProduct: null == linkedProduct
            ? _value.linkedProduct
            : linkedProduct // ignore: cast_nullable_to_non_nullable
                  as Product,
        position: freezed == position
            ? _value.position
            : position // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductLinkImpl implements _ProductLink {
  const _$ProductLinkImpl({
    required this.id,
    required this.linkType,
    required this.linkedProduct,
    this.position,
  });

  factory _$ProductLinkImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductLinkImplFromJson(json);

  @override
  final int id;
  @override
  final String linkType;
  @override
  final Product linkedProduct;
  @override
  final int? position;

  @override
  String toString() {
    return 'ProductLink(id: $id, linkType: $linkType, linkedProduct: $linkedProduct, position: $position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductLinkImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.linkType, linkType) ||
                other.linkType == linkType) &&
            (identical(other.linkedProduct, linkedProduct) ||
                other.linkedProduct == linkedProduct) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, linkType, linkedProduct, position);

  /// Create a copy of ProductLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductLinkImplCopyWith<_$ProductLinkImpl> get copyWith =>
      __$$ProductLinkImplCopyWithImpl<_$ProductLinkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductLinkImplToJson(this);
  }
}

abstract class _ProductLink implements ProductLink {
  const factory _ProductLink({
    required final int id,
    required final String linkType,
    required final Product linkedProduct,
    final int? position,
  }) = _$ProductLinkImpl;

  factory _ProductLink.fromJson(Map<String, dynamic> json) =
      _$ProductLinkImpl.fromJson;

  @override
  int get id;
  @override
  String get linkType;
  @override
  Product get linkedProduct;
  @override
  int? get position;

  /// Create a copy of ProductLink
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductLinkImplCopyWith<_$ProductLinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TierPrice _$TierPriceFromJson(Map<String, dynamic> json) {
  return _TierPrice.fromJson(json);
}

/// @nodoc
mixin _$TierPrice {
  int get id => throw _privateConstructorUsedError;
  int get customerGroupId => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  int get qty => throw _privateConstructorUsedError;
  String? get websiteId => throw _privateConstructorUsedError;

  /// Serializes this TierPrice to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TierPrice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TierPriceCopyWith<TierPrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TierPriceCopyWith<$Res> {
  factory $TierPriceCopyWith(TierPrice value, $Res Function(TierPrice) then) =
      _$TierPriceCopyWithImpl<$Res, TierPrice>;
  @useResult
  $Res call({
    int id,
    int customerGroupId,
    double price,
    int qty,
    String? websiteId,
  });
}

/// @nodoc
class _$TierPriceCopyWithImpl<$Res, $Val extends TierPrice>
    implements $TierPriceCopyWith<$Res> {
  _$TierPriceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TierPrice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerGroupId = null,
    Object? price = null,
    Object? qty = null,
    Object? websiteId = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            customerGroupId: null == customerGroupId
                ? _value.customerGroupId
                : customerGroupId // ignore: cast_nullable_to_non_nullable
                      as int,
            price: null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as double,
            qty: null == qty
                ? _value.qty
                : qty // ignore: cast_nullable_to_non_nullable
                      as int,
            websiteId: freezed == websiteId
                ? _value.websiteId
                : websiteId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TierPriceImplCopyWith<$Res>
    implements $TierPriceCopyWith<$Res> {
  factory _$$TierPriceImplCopyWith(
    _$TierPriceImpl value,
    $Res Function(_$TierPriceImpl) then,
  ) = __$$TierPriceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int customerGroupId,
    double price,
    int qty,
    String? websiteId,
  });
}

/// @nodoc
class __$$TierPriceImplCopyWithImpl<$Res>
    extends _$TierPriceCopyWithImpl<$Res, _$TierPriceImpl>
    implements _$$TierPriceImplCopyWith<$Res> {
  __$$TierPriceImplCopyWithImpl(
    _$TierPriceImpl _value,
    $Res Function(_$TierPriceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TierPrice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerGroupId = null,
    Object? price = null,
    Object? qty = null,
    Object? websiteId = freezed,
  }) {
    return _then(
      _$TierPriceImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        customerGroupId: null == customerGroupId
            ? _value.customerGroupId
            : customerGroupId // ignore: cast_nullable_to_non_nullable
                  as int,
        price: null == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as double,
        qty: null == qty
            ? _value.qty
            : qty // ignore: cast_nullable_to_non_nullable
                  as int,
        websiteId: freezed == websiteId
            ? _value.websiteId
            : websiteId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TierPriceImpl implements _TierPrice {
  const _$TierPriceImpl({
    required this.id,
    required this.customerGroupId,
    required this.price,
    required this.qty,
    this.websiteId,
  });

  factory _$TierPriceImpl.fromJson(Map<String, dynamic> json) =>
      _$$TierPriceImplFromJson(json);

  @override
  final int id;
  @override
  final int customerGroupId;
  @override
  final double price;
  @override
  final int qty;
  @override
  final String? websiteId;

  @override
  String toString() {
    return 'TierPrice(id: $id, customerGroupId: $customerGroupId, price: $price, qty: $qty, websiteId: $websiteId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TierPriceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.customerGroupId, customerGroupId) ||
                other.customerGroupId == customerGroupId) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.websiteId, websiteId) ||
                other.websiteId == websiteId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, customerGroupId, price, qty, websiteId);

  /// Create a copy of TierPrice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TierPriceImplCopyWith<_$TierPriceImpl> get copyWith =>
      __$$TierPriceImplCopyWithImpl<_$TierPriceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TierPriceImplToJson(this);
  }
}

abstract class _TierPrice implements TierPrice {
  const factory _TierPrice({
    required final int id,
    required final int customerGroupId,
    required final double price,
    required final int qty,
    final String? websiteId,
  }) = _$TierPriceImpl;

  factory _TierPrice.fromJson(Map<String, dynamic> json) =
      _$TierPriceImpl.fromJson;

  @override
  int get id;
  @override
  int get customerGroupId;
  @override
  double get price;
  @override
  int get qty;
  @override
  String? get websiteId;

  /// Create a copy of TierPrice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TierPriceImplCopyWith<_$TierPriceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Review _$ReviewFromJson(Map<String, dynamic> json) {
  return _Review.fromJson(json);
}

/// @nodoc
mixin _$Review {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get detail => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  int get customerId => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  List<ReviewRating>? get ratings => throw _privateConstructorUsedError;

  /// Serializes this Review to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewCopyWith<Review> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewCopyWith<$Res> {
  factory $ReviewCopyWith(Review value, $Res Function(Review) then) =
      _$ReviewCopyWithImpl<$Res, Review>;
  @useResult
  $Res call({
    int id,
    String title,
    String detail,
    String nickname,
    int customerId,
    double rating,
    DateTime createdAt,
    String? status,
    List<ReviewRating>? ratings,
  });
}

/// @nodoc
class _$ReviewCopyWithImpl<$Res, $Val extends Review>
    implements $ReviewCopyWith<$Res> {
  _$ReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? detail = null,
    Object? nickname = null,
    Object? customerId = null,
    Object? rating = null,
    Object? createdAt = null,
    Object? status = freezed,
    Object? ratings = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            detail: null == detail
                ? _value.detail
                : detail // ignore: cast_nullable_to_non_nullable
                      as String,
            nickname: null == nickname
                ? _value.nickname
                : nickname // ignore: cast_nullable_to_non_nullable
                      as String,
            customerId: null == customerId
                ? _value.customerId
                : customerId // ignore: cast_nullable_to_non_nullable
                      as int,
            rating: null == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as double,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            ratings: freezed == ratings
                ? _value.ratings
                : ratings // ignore: cast_nullable_to_non_nullable
                      as List<ReviewRating>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReviewImplCopyWith<$Res> implements $ReviewCopyWith<$Res> {
  factory _$$ReviewImplCopyWith(
    _$ReviewImpl value,
    $Res Function(_$ReviewImpl) then,
  ) = __$$ReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String title,
    String detail,
    String nickname,
    int customerId,
    double rating,
    DateTime createdAt,
    String? status,
    List<ReviewRating>? ratings,
  });
}

/// @nodoc
class __$$ReviewImplCopyWithImpl<$Res>
    extends _$ReviewCopyWithImpl<$Res, _$ReviewImpl>
    implements _$$ReviewImplCopyWith<$Res> {
  __$$ReviewImplCopyWithImpl(
    _$ReviewImpl _value,
    $Res Function(_$ReviewImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? detail = null,
    Object? nickname = null,
    Object? customerId = null,
    Object? rating = null,
    Object? createdAt = null,
    Object? status = freezed,
    Object? ratings = freezed,
  }) {
    return _then(
      _$ReviewImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        detail: null == detail
            ? _value.detail
            : detail // ignore: cast_nullable_to_non_nullable
                  as String,
        nickname: null == nickname
            ? _value.nickname
            : nickname // ignore: cast_nullable_to_non_nullable
                  as String,
        customerId: null == customerId
            ? _value.customerId
            : customerId // ignore: cast_nullable_to_non_nullable
                  as int,
        rating: null == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as double,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        ratings: freezed == ratings
            ? _value._ratings
            : ratings // ignore: cast_nullable_to_non_nullable
                  as List<ReviewRating>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewImpl implements _Review {
  const _$ReviewImpl({
    required this.id,
    required this.title,
    required this.detail,
    required this.nickname,
    required this.customerId,
    required this.rating,
    required this.createdAt,
    this.status,
    final List<ReviewRating>? ratings,
  }) : _ratings = ratings;

  factory _$ReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String detail;
  @override
  final String nickname;
  @override
  final int customerId;
  @override
  final double rating;
  @override
  final DateTime createdAt;
  @override
  final String? status;
  final List<ReviewRating>? _ratings;
  @override
  List<ReviewRating>? get ratings {
    final value = _ratings;
    if (value == null) return null;
    if (_ratings is EqualUnmodifiableListView) return _ratings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Review(id: $id, title: $title, detail: $detail, nickname: $nickname, customerId: $customerId, rating: $rating, createdAt: $createdAt, status: $status, ratings: $ratings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._ratings, _ratings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    detail,
    nickname,
    customerId,
    rating,
    createdAt,
    status,
    const DeepCollectionEquality().hash(_ratings),
  );

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      __$$ReviewImplCopyWithImpl<_$ReviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewImplToJson(this);
  }
}

abstract class _Review implements Review {
  const factory _Review({
    required final int id,
    required final String title,
    required final String detail,
    required final String nickname,
    required final int customerId,
    required final double rating,
    required final DateTime createdAt,
    final String? status,
    final List<ReviewRating>? ratings,
  }) = _$ReviewImpl;

  factory _Review.fromJson(Map<String, dynamic> json) = _$ReviewImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get detail;
  @override
  String get nickname;
  @override
  int get customerId;
  @override
  double get rating;
  @override
  DateTime get createdAt;
  @override
  String? get status;
  @override
  List<ReviewRating>? get ratings;

  /// Create a copy of Review
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReviewRating _$ReviewRatingFromJson(Map<String, dynamic> json) {
  return _ReviewRating.fromJson(json);
}

/// @nodoc
mixin _$ReviewRating {
  int get id => throw _privateConstructorUsedError;
  String get ratingName => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get ratingId => throw _privateConstructorUsedError;

  /// Serializes this ReviewRating to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReviewRating
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewRatingCopyWith<ReviewRating> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewRatingCopyWith<$Res> {
  factory $ReviewRatingCopyWith(
    ReviewRating value,
    $Res Function(ReviewRating) then,
  ) = _$ReviewRatingCopyWithImpl<$Res, ReviewRating>;
  @useResult
  $Res call({int id, String ratingName, double rating, int ratingId});
}

/// @nodoc
class _$ReviewRatingCopyWithImpl<$Res, $Val extends ReviewRating>
    implements $ReviewRatingCopyWith<$Res> {
  _$ReviewRatingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewRating
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ratingName = null,
    Object? rating = null,
    Object? ratingId = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            ratingName: null == ratingName
                ? _value.ratingName
                : ratingName // ignore: cast_nullable_to_non_nullable
                      as String,
            rating: null == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as double,
            ratingId: null == ratingId
                ? _value.ratingId
                : ratingId // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReviewRatingImplCopyWith<$Res>
    implements $ReviewRatingCopyWith<$Res> {
  factory _$$ReviewRatingImplCopyWith(
    _$ReviewRatingImpl value,
    $Res Function(_$ReviewRatingImpl) then,
  ) = __$$ReviewRatingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String ratingName, double rating, int ratingId});
}

/// @nodoc
class __$$ReviewRatingImplCopyWithImpl<$Res>
    extends _$ReviewRatingCopyWithImpl<$Res, _$ReviewRatingImpl>
    implements _$$ReviewRatingImplCopyWith<$Res> {
  __$$ReviewRatingImplCopyWithImpl(
    _$ReviewRatingImpl _value,
    $Res Function(_$ReviewRatingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReviewRating
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ratingName = null,
    Object? rating = null,
    Object? ratingId = null,
  }) {
    return _then(
      _$ReviewRatingImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        ratingName: null == ratingName
            ? _value.ratingName
            : ratingName // ignore: cast_nullable_to_non_nullable
                  as String,
        rating: null == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as double,
        ratingId: null == ratingId
            ? _value.ratingId
            : ratingId // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewRatingImpl implements _ReviewRating {
  const _$ReviewRatingImpl({
    required this.id,
    required this.ratingName,
    required this.rating,
    required this.ratingId,
  });

  factory _$ReviewRatingImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewRatingImplFromJson(json);

  @override
  final int id;
  @override
  final String ratingName;
  @override
  final double rating;
  @override
  final int ratingId;

  @override
  String toString() {
    return 'ReviewRating(id: $id, ratingName: $ratingName, rating: $rating, ratingId: $ratingId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewRatingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ratingName, ratingName) ||
                other.ratingName == ratingName) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.ratingId, ratingId) ||
                other.ratingId == ratingId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, ratingName, rating, ratingId);

  /// Create a copy of ReviewRating
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewRatingImplCopyWith<_$ReviewRatingImpl> get copyWith =>
      __$$ReviewRatingImplCopyWithImpl<_$ReviewRatingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewRatingImplToJson(this);
  }
}

abstract class _ReviewRating implements ReviewRating {
  const factory _ReviewRating({
    required final int id,
    required final String ratingName,
    required final double rating,
    required final int ratingId,
  }) = _$ReviewRatingImpl;

  factory _ReviewRating.fromJson(Map<String, dynamic> json) =
      _$ReviewRatingImpl.fromJson;

  @override
  int get id;
  @override
  String get ratingName;
  @override
  double get rating;
  @override
  int get ratingId;

  /// Create a copy of ReviewRating
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewRatingImplCopyWith<_$ReviewRatingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Aggregation _$AggregationFromJson(Map<String, dynamic> json) {
  return _Aggregation.fromJson(json);
}

/// @nodoc
mixin _$Aggregation {
  String get attributeCode => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  List<AggregationOption> get options => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  /// Serializes this Aggregation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Aggregation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AggregationCopyWith<Aggregation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AggregationCopyWith<$Res> {
  factory $AggregationCopyWith(
    Aggregation value,
    $Res Function(Aggregation) then,
  ) = _$AggregationCopyWithImpl<$Res, Aggregation>;
  @useResult
  $Res call({
    String attributeCode,
    String label,
    List<AggregationOption> options,
    int count,
  });
}

/// @nodoc
class _$AggregationCopyWithImpl<$Res, $Val extends Aggregation>
    implements $AggregationCopyWith<$Res> {
  _$AggregationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Aggregation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attributeCode = null,
    Object? label = null,
    Object? options = null,
    Object? count = null,
  }) {
    return _then(
      _value.copyWith(
            attributeCode: null == attributeCode
                ? _value.attributeCode
                : attributeCode // ignore: cast_nullable_to_non_nullable
                      as String,
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            options: null == options
                ? _value.options
                : options // ignore: cast_nullable_to_non_nullable
                      as List<AggregationOption>,
            count: null == count
                ? _value.count
                : count // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AggregationImplCopyWith<$Res>
    implements $AggregationCopyWith<$Res> {
  factory _$$AggregationImplCopyWith(
    _$AggregationImpl value,
    $Res Function(_$AggregationImpl) then,
  ) = __$$AggregationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String attributeCode,
    String label,
    List<AggregationOption> options,
    int count,
  });
}

/// @nodoc
class __$$AggregationImplCopyWithImpl<$Res>
    extends _$AggregationCopyWithImpl<$Res, _$AggregationImpl>
    implements _$$AggregationImplCopyWith<$Res> {
  __$$AggregationImplCopyWithImpl(
    _$AggregationImpl _value,
    $Res Function(_$AggregationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Aggregation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attributeCode = null,
    Object? label = null,
    Object? options = null,
    Object? count = null,
  }) {
    return _then(
      _$AggregationImpl(
        attributeCode: null == attributeCode
            ? _value.attributeCode
            : attributeCode // ignore: cast_nullable_to_non_nullable
                  as String,
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        options: null == options
            ? _value._options
            : options // ignore: cast_nullable_to_non_nullable
                  as List<AggregationOption>,
        count: null == count
            ? _value.count
            : count // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AggregationImpl implements _Aggregation {
  const _$AggregationImpl({
    required this.attributeCode,
    required this.label,
    required final List<AggregationOption> options,
    required this.count,
  }) : _options = options;

  factory _$AggregationImpl.fromJson(Map<String, dynamic> json) =>
      _$$AggregationImplFromJson(json);

  @override
  final String attributeCode;
  @override
  final String label;
  final List<AggregationOption> _options;
  @override
  List<AggregationOption> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  final int count;

  @override
  String toString() {
    return 'Aggregation(attributeCode: $attributeCode, label: $label, options: $options, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AggregationImpl &&
            (identical(other.attributeCode, attributeCode) ||
                other.attributeCode == attributeCode) &&
            (identical(other.label, label) || other.label == label) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    attributeCode,
    label,
    const DeepCollectionEquality().hash(_options),
    count,
  );

  /// Create a copy of Aggregation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AggregationImplCopyWith<_$AggregationImpl> get copyWith =>
      __$$AggregationImplCopyWithImpl<_$AggregationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AggregationImplToJson(this);
  }
}

abstract class _Aggregation implements Aggregation {
  const factory _Aggregation({
    required final String attributeCode,
    required final String label,
    required final List<AggregationOption> options,
    required final int count,
  }) = _$AggregationImpl;

  factory _Aggregation.fromJson(Map<String, dynamic> json) =
      _$AggregationImpl.fromJson;

  @override
  String get attributeCode;
  @override
  String get label;
  @override
  List<AggregationOption> get options;
  @override
  int get count;

  /// Create a copy of Aggregation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AggregationImplCopyWith<_$AggregationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AggregationOption _$AggregationOptionFromJson(Map<String, dynamic> json) {
  return _AggregationOption.fromJson(json);
}

/// @nodoc
mixin _$AggregationOption {
  String get value => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  bool? get isSelected => throw _privateConstructorUsedError;

  /// Serializes this AggregationOption to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AggregationOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AggregationOptionCopyWith<AggregationOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AggregationOptionCopyWith<$Res> {
  factory $AggregationOptionCopyWith(
    AggregationOption value,
    $Res Function(AggregationOption) then,
  ) = _$AggregationOptionCopyWithImpl<$Res, AggregationOption>;
  @useResult
  $Res call({String value, String label, int count, bool? isSelected});
}

/// @nodoc
class _$AggregationOptionCopyWithImpl<$Res, $Val extends AggregationOption>
    implements $AggregationOptionCopyWith<$Res> {
  _$AggregationOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AggregationOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? label = null,
    Object? count = null,
    Object? isSelected = freezed,
  }) {
    return _then(
      _value.copyWith(
            value: null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as String,
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            count: null == count
                ? _value.count
                : count // ignore: cast_nullable_to_non_nullable
                      as int,
            isSelected: freezed == isSelected
                ? _value.isSelected
                : isSelected // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AggregationOptionImplCopyWith<$Res>
    implements $AggregationOptionCopyWith<$Res> {
  factory _$$AggregationOptionImplCopyWith(
    _$AggregationOptionImpl value,
    $Res Function(_$AggregationOptionImpl) then,
  ) = __$$AggregationOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value, String label, int count, bool? isSelected});
}

/// @nodoc
class __$$AggregationOptionImplCopyWithImpl<$Res>
    extends _$AggregationOptionCopyWithImpl<$Res, _$AggregationOptionImpl>
    implements _$$AggregationOptionImplCopyWith<$Res> {
  __$$AggregationOptionImplCopyWithImpl(
    _$AggregationOptionImpl _value,
    $Res Function(_$AggregationOptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AggregationOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? label = null,
    Object? count = null,
    Object? isSelected = freezed,
  }) {
    return _then(
      _$AggregationOptionImpl(
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as String,
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        count: null == count
            ? _value.count
            : count // ignore: cast_nullable_to_non_nullable
                  as int,
        isSelected: freezed == isSelected
            ? _value.isSelected
            : isSelected // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AggregationOptionImpl implements _AggregationOption {
  const _$AggregationOptionImpl({
    required this.value,
    required this.label,
    required this.count,
    this.isSelected,
  });

  factory _$AggregationOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$AggregationOptionImplFromJson(json);

  @override
  final String value;
  @override
  final String label;
  @override
  final int count;
  @override
  final bool? isSelected;

  @override
  String toString() {
    return 'AggregationOption(value: $value, label: $label, count: $count, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AggregationOptionImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, label, count, isSelected);

  /// Create a copy of AggregationOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AggregationOptionImplCopyWith<_$AggregationOptionImpl> get copyWith =>
      __$$AggregationOptionImplCopyWithImpl<_$AggregationOptionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AggregationOptionImplToJson(this);
  }
}

abstract class _AggregationOption implements AggregationOption {
  const factory _AggregationOption({
    required final String value,
    required final String label,
    required final int count,
    final bool? isSelected,
  }) = _$AggregationOptionImpl;

  factory _AggregationOption.fromJson(Map<String, dynamic> json) =
      _$AggregationOptionImpl.fromJson;

  @override
  String get value;
  @override
  String get label;
  @override
  int get count;
  @override
  bool? get isSelected;

  /// Create a copy of AggregationOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AggregationOptionImplCopyWith<_$AggregationOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SortOption _$SortOptionFromJson(Map<String, dynamic> json) {
  return _SortOption.fromJson(json);
}

/// @nodoc
mixin _$SortOption {
  String get value => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  bool? get isSelected => throw _privateConstructorUsedError;

  /// Serializes this SortOption to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SortOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SortOptionCopyWith<SortOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SortOptionCopyWith<$Res> {
  factory $SortOptionCopyWith(
    SortOption value,
    $Res Function(SortOption) then,
  ) = _$SortOptionCopyWithImpl<$Res, SortOption>;
  @useResult
  $Res call({String value, String label, bool? isSelected});
}

/// @nodoc
class _$SortOptionCopyWithImpl<$Res, $Val extends SortOption>
    implements $SortOptionCopyWith<$Res> {
  _$SortOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SortOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? label = null,
    Object? isSelected = freezed,
  }) {
    return _then(
      _value.copyWith(
            value: null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as String,
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            isSelected: freezed == isSelected
                ? _value.isSelected
                : isSelected // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SortOptionImplCopyWith<$Res>
    implements $SortOptionCopyWith<$Res> {
  factory _$$SortOptionImplCopyWith(
    _$SortOptionImpl value,
    $Res Function(_$SortOptionImpl) then,
  ) = __$$SortOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value, String label, bool? isSelected});
}

/// @nodoc
class __$$SortOptionImplCopyWithImpl<$Res>
    extends _$SortOptionCopyWithImpl<$Res, _$SortOptionImpl>
    implements _$$SortOptionImplCopyWith<$Res> {
  __$$SortOptionImplCopyWithImpl(
    _$SortOptionImpl _value,
    $Res Function(_$SortOptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SortOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? label = null,
    Object? isSelected = freezed,
  }) {
    return _then(
      _$SortOptionImpl(
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as String,
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        isSelected: freezed == isSelected
            ? _value.isSelected
            : isSelected // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SortOptionImpl implements _SortOption {
  const _$SortOptionImpl({
    required this.value,
    required this.label,
    this.isSelected,
  });

  factory _$SortOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SortOptionImplFromJson(json);

  @override
  final String value;
  @override
  final String label;
  @override
  final bool? isSelected;

  @override
  String toString() {
    return 'SortOption(value: $value, label: $label, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SortOptionImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, label, isSelected);

  /// Create a copy of SortOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SortOptionImplCopyWith<_$SortOptionImpl> get copyWith =>
      __$$SortOptionImplCopyWithImpl<_$SortOptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SortOptionImplToJson(this);
  }
}

abstract class _SortOption implements SortOption {
  const factory _SortOption({
    required final String value,
    required final String label,
    final bool? isSelected,
  }) = _$SortOptionImpl;

  factory _SortOption.fromJson(Map<String, dynamic> json) =
      _$SortOptionImpl.fromJson;

  @override
  String get value;
  @override
  String get label;
  @override
  bool? get isSelected;

  /// Create a copy of SortOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SortOptionImplCopyWith<_$SortOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryAttribute _$CategoryAttributeFromJson(Map<String, dynamic> json) {
  return _CategoryAttribute.fromJson(json);
}

/// @nodoc
mixin _$CategoryAttribute {
  String get attributeCode => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;

  /// Serializes this CategoryAttribute to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryAttribute
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryAttributeCopyWith<CategoryAttribute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryAttributeCopyWith<$Res> {
  factory $CategoryAttributeCopyWith(
    CategoryAttribute value,
    $Res Function(CategoryAttribute) then,
  ) = _$CategoryAttributeCopyWithImpl<$Res, CategoryAttribute>;
  @useResult
  $Res call({String attributeCode, String value, String? label});
}

/// @nodoc
class _$CategoryAttributeCopyWithImpl<$Res, $Val extends CategoryAttribute>
    implements $CategoryAttributeCopyWith<$Res> {
  _$CategoryAttributeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryAttribute
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attributeCode = null,
    Object? value = null,
    Object? label = freezed,
  }) {
    return _then(
      _value.copyWith(
            attributeCode: null == attributeCode
                ? _value.attributeCode
                : attributeCode // ignore: cast_nullable_to_non_nullable
                      as String,
            value: null == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as String,
            label: freezed == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CategoryAttributeImplCopyWith<$Res>
    implements $CategoryAttributeCopyWith<$Res> {
  factory _$$CategoryAttributeImplCopyWith(
    _$CategoryAttributeImpl value,
    $Res Function(_$CategoryAttributeImpl) then,
  ) = __$$CategoryAttributeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String attributeCode, String value, String? label});
}

/// @nodoc
class __$$CategoryAttributeImplCopyWithImpl<$Res>
    extends _$CategoryAttributeCopyWithImpl<$Res, _$CategoryAttributeImpl>
    implements _$$CategoryAttributeImplCopyWith<$Res> {
  __$$CategoryAttributeImplCopyWithImpl(
    _$CategoryAttributeImpl _value,
    $Res Function(_$CategoryAttributeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CategoryAttribute
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attributeCode = null,
    Object? value = null,
    Object? label = freezed,
  }) {
    return _then(
      _$CategoryAttributeImpl(
        attributeCode: null == attributeCode
            ? _value.attributeCode
            : attributeCode // ignore: cast_nullable_to_non_nullable
                  as String,
        value: null == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as String,
        label: freezed == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryAttributeImpl implements _CategoryAttribute {
  const _$CategoryAttributeImpl({
    required this.attributeCode,
    required this.value,
    this.label,
  });

  factory _$CategoryAttributeImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryAttributeImplFromJson(json);

  @override
  final String attributeCode;
  @override
  final String value;
  @override
  final String? label;

  @override
  String toString() {
    return 'CategoryAttribute(attributeCode: $attributeCode, value: $value, label: $label)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryAttributeImpl &&
            (identical(other.attributeCode, attributeCode) ||
                other.attributeCode == attributeCode) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, attributeCode, value, label);

  /// Create a copy of CategoryAttribute
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryAttributeImplCopyWith<_$CategoryAttributeImpl> get copyWith =>
      __$$CategoryAttributeImplCopyWithImpl<_$CategoryAttributeImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryAttributeImplToJson(this);
  }
}

abstract class _CategoryAttribute implements CategoryAttribute {
  const factory _CategoryAttribute({
    required final String attributeCode,
    required final String value,
    final String? label,
  }) = _$CategoryAttributeImpl;

  factory _CategoryAttribute.fromJson(Map<String, dynamic> json) =
      _$CategoryAttributeImpl.fromJson;

  @override
  String get attributeCode;
  @override
  String get value;
  @override
  String? get label;

  /// Create a copy of CategoryAttribute
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryAttributeImplCopyWith<_$CategoryAttributeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
