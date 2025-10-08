// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Product {

 int get id; String get sku; String get name; String get typeId; double get price; double? get specialPrice; int get status; int get visibility; int get stockStatus; int? get stockQuantity; String? get description; String? get shortDescription; String? get metaTitle; String? get metaDescription; String? get metaKeyword; List<String>? get categories; List<String>? get websites; List<CustomAttribute>? get customAttributes; List<MediaGalleryEntry>? get mediaGalleryEntries; List<ProductOption>? get options; List<ProductLink>? get productLinks; List<TierPrice>? get tierPrices; List<Review>? get reviews; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductCopyWith<Product> get copyWith => _$ProductCopyWithImpl<Product>(this as Product, _$identity);

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Product&&(identical(other.id, id) || other.id == id)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.name, name) || other.name == name)&&(identical(other.typeId, typeId) || other.typeId == typeId)&&(identical(other.price, price) || other.price == price)&&(identical(other.specialPrice, specialPrice) || other.specialPrice == specialPrice)&&(identical(other.status, status) || other.status == status)&&(identical(other.visibility, visibility) || other.visibility == visibility)&&(identical(other.stockStatus, stockStatus) || other.stockStatus == stockStatus)&&(identical(other.stockQuantity, stockQuantity) || other.stockQuantity == stockQuantity)&&(identical(other.description, description) || other.description == description)&&(identical(other.shortDescription, shortDescription) || other.shortDescription == shortDescription)&&(identical(other.metaTitle, metaTitle) || other.metaTitle == metaTitle)&&(identical(other.metaDescription, metaDescription) || other.metaDescription == metaDescription)&&(identical(other.metaKeyword, metaKeyword) || other.metaKeyword == metaKeyword)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.websites, websites)&&const DeepCollectionEquality().equals(other.customAttributes, customAttributes)&&const DeepCollectionEquality().equals(other.mediaGalleryEntries, mediaGalleryEntries)&&const DeepCollectionEquality().equals(other.options, options)&&const DeepCollectionEquality().equals(other.productLinks, productLinks)&&const DeepCollectionEquality().equals(other.tierPrices, tierPrices)&&const DeepCollectionEquality().equals(other.reviews, reviews)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,sku,name,typeId,price,specialPrice,status,visibility,stockStatus,stockQuantity,description,shortDescription,metaTitle,metaDescription,metaKeyword,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(websites),const DeepCollectionEquality().hash(customAttributes),const DeepCollectionEquality().hash(mediaGalleryEntries),const DeepCollectionEquality().hash(options),const DeepCollectionEquality().hash(productLinks),const DeepCollectionEquality().hash(tierPrices),const DeepCollectionEquality().hash(reviews),createdAt,updatedAt]);

@override
String toString() {
  return 'Product(id: $id, sku: $sku, name: $name, typeId: $typeId, price: $price, specialPrice: $specialPrice, status: $status, visibility: $visibility, stockStatus: $stockStatus, stockQuantity: $stockQuantity, description: $description, shortDescription: $shortDescription, metaTitle: $metaTitle, metaDescription: $metaDescription, metaKeyword: $metaKeyword, categories: $categories, websites: $websites, customAttributes: $customAttributes, mediaGalleryEntries: $mediaGalleryEntries, options: $options, productLinks: $productLinks, tierPrices: $tierPrices, reviews: $reviews, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ProductCopyWith<$Res>  {
  factory $ProductCopyWith(Product value, $Res Function(Product) _then) = _$ProductCopyWithImpl;
@useResult
$Res call({
 int id, String sku, String name, String typeId, double price, double? specialPrice, int status, int visibility, int stockStatus, int? stockQuantity, String? description, String? shortDescription, String? metaTitle, String? metaDescription, String? metaKeyword, List<String>? categories, List<String>? websites, List<CustomAttribute>? customAttributes, List<MediaGalleryEntry>? mediaGalleryEntries, List<ProductOption>? options, List<ProductLink>? productLinks, List<TierPrice>? tierPrices, List<Review>? reviews, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$ProductCopyWithImpl<$Res>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._self, this._then);

  final Product _self;
  final $Res Function(Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sku = null,Object? name = null,Object? typeId = null,Object? price = null,Object? specialPrice = freezed,Object? status = null,Object? visibility = null,Object? stockStatus = null,Object? stockQuantity = freezed,Object? description = freezed,Object? shortDescription = freezed,Object? metaTitle = freezed,Object? metaDescription = freezed,Object? metaKeyword = freezed,Object? categories = freezed,Object? websites = freezed,Object? customAttributes = freezed,Object? mediaGalleryEntries = freezed,Object? options = freezed,Object? productLinks = freezed,Object? tierPrices = freezed,Object? reviews = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,typeId: null == typeId ? _self.typeId : typeId // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,specialPrice: freezed == specialPrice ? _self.specialPrice : specialPrice // ignore: cast_nullable_to_non_nullable
as double?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,visibility: null == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as int,stockStatus: null == stockStatus ? _self.stockStatus : stockStatus // ignore: cast_nullable_to_non_nullable
as int,stockQuantity: freezed == stockQuantity ? _self.stockQuantity : stockQuantity // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,shortDescription: freezed == shortDescription ? _self.shortDescription : shortDescription // ignore: cast_nullable_to_non_nullable
as String?,metaTitle: freezed == metaTitle ? _self.metaTitle : metaTitle // ignore: cast_nullable_to_non_nullable
as String?,metaDescription: freezed == metaDescription ? _self.metaDescription : metaDescription // ignore: cast_nullable_to_non_nullable
as String?,metaKeyword: freezed == metaKeyword ? _self.metaKeyword : metaKeyword // ignore: cast_nullable_to_non_nullable
as String?,categories: freezed == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>?,websites: freezed == websites ? _self.websites : websites // ignore: cast_nullable_to_non_nullable
as List<String>?,customAttributes: freezed == customAttributes ? _self.customAttributes : customAttributes // ignore: cast_nullable_to_non_nullable
as List<CustomAttribute>?,mediaGalleryEntries: freezed == mediaGalleryEntries ? _self.mediaGalleryEntries : mediaGalleryEntries // ignore: cast_nullable_to_non_nullable
as List<MediaGalleryEntry>?,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<ProductOption>?,productLinks: freezed == productLinks ? _self.productLinks : productLinks // ignore: cast_nullable_to_non_nullable
as List<ProductLink>?,tierPrices: freezed == tierPrices ? _self.tierPrices : tierPrices // ignore: cast_nullable_to_non_nullable
as List<TierPrice>?,reviews: freezed == reviews ? _self.reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<Review>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Product].
extension ProductPatterns on Product {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Product value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Product value)  $default,){
final _that = this;
switch (_that) {
case _Product():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Product value)?  $default,){
final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String sku,  String name,  String typeId,  double price,  double? specialPrice,  int status,  int visibility,  int stockStatus,  int? stockQuantity,  String? description,  String? shortDescription,  String? metaTitle,  String? metaDescription,  String? metaKeyword,  List<String>? categories,  List<String>? websites,  List<CustomAttribute>? customAttributes,  List<MediaGalleryEntry>? mediaGalleryEntries,  List<ProductOption>? options,  List<ProductLink>? productLinks,  List<TierPrice>? tierPrices,  List<Review>? reviews,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.id,_that.sku,_that.name,_that.typeId,_that.price,_that.specialPrice,_that.status,_that.visibility,_that.stockStatus,_that.stockQuantity,_that.description,_that.shortDescription,_that.metaTitle,_that.metaDescription,_that.metaKeyword,_that.categories,_that.websites,_that.customAttributes,_that.mediaGalleryEntries,_that.options,_that.productLinks,_that.tierPrices,_that.reviews,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String sku,  String name,  String typeId,  double price,  double? specialPrice,  int status,  int visibility,  int stockStatus,  int? stockQuantity,  String? description,  String? shortDescription,  String? metaTitle,  String? metaDescription,  String? metaKeyword,  List<String>? categories,  List<String>? websites,  List<CustomAttribute>? customAttributes,  List<MediaGalleryEntry>? mediaGalleryEntries,  List<ProductOption>? options,  List<ProductLink>? productLinks,  List<TierPrice>? tierPrices,  List<Review>? reviews,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Product():
return $default(_that.id,_that.sku,_that.name,_that.typeId,_that.price,_that.specialPrice,_that.status,_that.visibility,_that.stockStatus,_that.stockQuantity,_that.description,_that.shortDescription,_that.metaTitle,_that.metaDescription,_that.metaKeyword,_that.categories,_that.websites,_that.customAttributes,_that.mediaGalleryEntries,_that.options,_that.productLinks,_that.tierPrices,_that.reviews,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String sku,  String name,  String typeId,  double price,  double? specialPrice,  int status,  int visibility,  int stockStatus,  int? stockQuantity,  String? description,  String? shortDescription,  String? metaTitle,  String? metaDescription,  String? metaKeyword,  List<String>? categories,  List<String>? websites,  List<CustomAttribute>? customAttributes,  List<MediaGalleryEntry>? mediaGalleryEntries,  List<ProductOption>? options,  List<ProductLink>? productLinks,  List<TierPrice>? tierPrices,  List<Review>? reviews,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.id,_that.sku,_that.name,_that.typeId,_that.price,_that.specialPrice,_that.status,_that.visibility,_that.stockStatus,_that.stockQuantity,_that.description,_that.shortDescription,_that.metaTitle,_that.metaDescription,_that.metaKeyword,_that.categories,_that.websites,_that.customAttributes,_that.mediaGalleryEntries,_that.options,_that.productLinks,_that.tierPrices,_that.reviews,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Product extends Product {
  const _Product({required this.id, required this.sku, required this.name, required this.typeId, required this.price, this.specialPrice, required this.status, required this.visibility, required this.stockStatus, this.stockQuantity, this.description, this.shortDescription, this.metaTitle, this.metaDescription, this.metaKeyword, final  List<String>? categories, final  List<String>? websites, final  List<CustomAttribute>? customAttributes, final  List<MediaGalleryEntry>? mediaGalleryEntries, final  List<ProductOption>? options, final  List<ProductLink>? productLinks, final  List<TierPrice>? tierPrices, final  List<Review>? reviews, this.createdAt, this.updatedAt}): _categories = categories,_websites = websites,_customAttributes = customAttributes,_mediaGalleryEntries = mediaGalleryEntries,_options = options,_productLinks = productLinks,_tierPrices = tierPrices,_reviews = reviews,super._();
  factory _Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

@override final  int id;
@override final  String sku;
@override final  String name;
@override final  String typeId;
@override final  double price;
@override final  double? specialPrice;
@override final  int status;
@override final  int visibility;
@override final  int stockStatus;
@override final  int? stockQuantity;
@override final  String? description;
@override final  String? shortDescription;
@override final  String? metaTitle;
@override final  String? metaDescription;
@override final  String? metaKeyword;
 final  List<String>? _categories;
@override List<String>? get categories {
  final value = _categories;
  if (value == null) return null;
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _websites;
@override List<String>? get websites {
  final value = _websites;
  if (value == null) return null;
  if (_websites is EqualUnmodifiableListView) return _websites;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<CustomAttribute>? _customAttributes;
@override List<CustomAttribute>? get customAttributes {
  final value = _customAttributes;
  if (value == null) return null;
  if (_customAttributes is EqualUnmodifiableListView) return _customAttributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<MediaGalleryEntry>? _mediaGalleryEntries;
@override List<MediaGalleryEntry>? get mediaGalleryEntries {
  final value = _mediaGalleryEntries;
  if (value == null) return null;
  if (_mediaGalleryEntries is EqualUnmodifiableListView) return _mediaGalleryEntries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<ProductOption>? _options;
@override List<ProductOption>? get options {
  final value = _options;
  if (value == null) return null;
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<ProductLink>? _productLinks;
@override List<ProductLink>? get productLinks {
  final value = _productLinks;
  if (value == null) return null;
  if (_productLinks is EqualUnmodifiableListView) return _productLinks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<TierPrice>? _tierPrices;
@override List<TierPrice>? get tierPrices {
  final value = _tierPrices;
  if (value == null) return null;
  if (_tierPrices is EqualUnmodifiableListView) return _tierPrices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Review>? _reviews;
@override List<Review>? get reviews {
  final value = _reviews;
  if (value == null) return null;
  if (_reviews is EqualUnmodifiableListView) return _reviews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductCopyWith<_Product> get copyWith => __$ProductCopyWithImpl<_Product>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Product&&(identical(other.id, id) || other.id == id)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.name, name) || other.name == name)&&(identical(other.typeId, typeId) || other.typeId == typeId)&&(identical(other.price, price) || other.price == price)&&(identical(other.specialPrice, specialPrice) || other.specialPrice == specialPrice)&&(identical(other.status, status) || other.status == status)&&(identical(other.visibility, visibility) || other.visibility == visibility)&&(identical(other.stockStatus, stockStatus) || other.stockStatus == stockStatus)&&(identical(other.stockQuantity, stockQuantity) || other.stockQuantity == stockQuantity)&&(identical(other.description, description) || other.description == description)&&(identical(other.shortDescription, shortDescription) || other.shortDescription == shortDescription)&&(identical(other.metaTitle, metaTitle) || other.metaTitle == metaTitle)&&(identical(other.metaDescription, metaDescription) || other.metaDescription == metaDescription)&&(identical(other.metaKeyword, metaKeyword) || other.metaKeyword == metaKeyword)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._websites, _websites)&&const DeepCollectionEquality().equals(other._customAttributes, _customAttributes)&&const DeepCollectionEquality().equals(other._mediaGalleryEntries, _mediaGalleryEntries)&&const DeepCollectionEquality().equals(other._options, _options)&&const DeepCollectionEquality().equals(other._productLinks, _productLinks)&&const DeepCollectionEquality().equals(other._tierPrices, _tierPrices)&&const DeepCollectionEquality().equals(other._reviews, _reviews)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,sku,name,typeId,price,specialPrice,status,visibility,stockStatus,stockQuantity,description,shortDescription,metaTitle,metaDescription,metaKeyword,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_websites),const DeepCollectionEquality().hash(_customAttributes),const DeepCollectionEquality().hash(_mediaGalleryEntries),const DeepCollectionEquality().hash(_options),const DeepCollectionEquality().hash(_productLinks),const DeepCollectionEquality().hash(_tierPrices),const DeepCollectionEquality().hash(_reviews),createdAt,updatedAt]);

@override
String toString() {
  return 'Product(id: $id, sku: $sku, name: $name, typeId: $typeId, price: $price, specialPrice: $specialPrice, status: $status, visibility: $visibility, stockStatus: $stockStatus, stockQuantity: $stockQuantity, description: $description, shortDescription: $shortDescription, metaTitle: $metaTitle, metaDescription: $metaDescription, metaKeyword: $metaKeyword, categories: $categories, websites: $websites, customAttributes: $customAttributes, mediaGalleryEntries: $mediaGalleryEntries, options: $options, productLinks: $productLinks, tierPrices: $tierPrices, reviews: $reviews, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) _then) = __$ProductCopyWithImpl;
@override @useResult
$Res call({
 int id, String sku, String name, String typeId, double price, double? specialPrice, int status, int visibility, int stockStatus, int? stockQuantity, String? description, String? shortDescription, String? metaTitle, String? metaDescription, String? metaKeyword, List<String>? categories, List<String>? websites, List<CustomAttribute>? customAttributes, List<MediaGalleryEntry>? mediaGalleryEntries, List<ProductOption>? options, List<ProductLink>? productLinks, List<TierPrice>? tierPrices, List<Review>? reviews, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$ProductCopyWithImpl<$Res>
    implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(this._self, this._then);

  final _Product _self;
  final $Res Function(_Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sku = null,Object? name = null,Object? typeId = null,Object? price = null,Object? specialPrice = freezed,Object? status = null,Object? visibility = null,Object? stockStatus = null,Object? stockQuantity = freezed,Object? description = freezed,Object? shortDescription = freezed,Object? metaTitle = freezed,Object? metaDescription = freezed,Object? metaKeyword = freezed,Object? categories = freezed,Object? websites = freezed,Object? customAttributes = freezed,Object? mediaGalleryEntries = freezed,Object? options = freezed,Object? productLinks = freezed,Object? tierPrices = freezed,Object? reviews = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Product(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,typeId: null == typeId ? _self.typeId : typeId // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,specialPrice: freezed == specialPrice ? _self.specialPrice : specialPrice // ignore: cast_nullable_to_non_nullable
as double?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,visibility: null == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as int,stockStatus: null == stockStatus ? _self.stockStatus : stockStatus // ignore: cast_nullable_to_non_nullable
as int,stockQuantity: freezed == stockQuantity ? _self.stockQuantity : stockQuantity // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,shortDescription: freezed == shortDescription ? _self.shortDescription : shortDescription // ignore: cast_nullable_to_non_nullable
as String?,metaTitle: freezed == metaTitle ? _self.metaTitle : metaTitle // ignore: cast_nullable_to_non_nullable
as String?,metaDescription: freezed == metaDescription ? _self.metaDescription : metaDescription // ignore: cast_nullable_to_non_nullable
as String?,metaKeyword: freezed == metaKeyword ? _self.metaKeyword : metaKeyword // ignore: cast_nullable_to_non_nullable
as String?,categories: freezed == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>?,websites: freezed == websites ? _self._websites : websites // ignore: cast_nullable_to_non_nullable
as List<String>?,customAttributes: freezed == customAttributes ? _self._customAttributes : customAttributes // ignore: cast_nullable_to_non_nullable
as List<CustomAttribute>?,mediaGalleryEntries: freezed == mediaGalleryEntries ? _self._mediaGalleryEntries : mediaGalleryEntries // ignore: cast_nullable_to_non_nullable
as List<MediaGalleryEntry>?,options: freezed == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<ProductOption>?,productLinks: freezed == productLinks ? _self._productLinks : productLinks // ignore: cast_nullable_to_non_nullable
as List<ProductLink>?,tierPrices: freezed == tierPrices ? _self._tierPrices : tierPrices // ignore: cast_nullable_to_non_nullable
as List<TierPrice>?,reviews: freezed == reviews ? _self._reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<Review>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$ProductListResponse {

 List<Product> get items; int get totalCount; int get pageSize; int get currentPage; int get totalPages; List<Aggregation>? get aggregations; List<SortOption>? get sortOptions;
/// Create a copy of ProductListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductListResponseCopyWith<ProductListResponse> get copyWith => _$ProductListResponseCopyWithImpl<ProductListResponse>(this as ProductListResponse, _$identity);

  /// Serializes this ProductListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductListResponse&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&const DeepCollectionEquality().equals(other.aggregations, aggregations)&&const DeepCollectionEquality().equals(other.sortOptions, sortOptions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),totalCount,pageSize,currentPage,totalPages,const DeepCollectionEquality().hash(aggregations),const DeepCollectionEquality().hash(sortOptions));

@override
String toString() {
  return 'ProductListResponse(items: $items, totalCount: $totalCount, pageSize: $pageSize, currentPage: $currentPage, totalPages: $totalPages, aggregations: $aggregations, sortOptions: $sortOptions)';
}


}

/// @nodoc
abstract mixin class $ProductListResponseCopyWith<$Res>  {
  factory $ProductListResponseCopyWith(ProductListResponse value, $Res Function(ProductListResponse) _then) = _$ProductListResponseCopyWithImpl;
@useResult
$Res call({
 List<Product> items, int totalCount, int pageSize, int currentPage, int totalPages, List<Aggregation>? aggregations, List<SortOption>? sortOptions
});




}
/// @nodoc
class _$ProductListResponseCopyWithImpl<$Res>
    implements $ProductListResponseCopyWith<$Res> {
  _$ProductListResponseCopyWithImpl(this._self, this._then);

  final ProductListResponse _self;
  final $Res Function(ProductListResponse) _then;

/// Create a copy of ProductListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? totalCount = null,Object? pageSize = null,Object? currentPage = null,Object? totalPages = null,Object? aggregations = freezed,Object? sortOptions = freezed,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<Product>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,aggregations: freezed == aggregations ? _self.aggregations : aggregations // ignore: cast_nullable_to_non_nullable
as List<Aggregation>?,sortOptions: freezed == sortOptions ? _self.sortOptions : sortOptions // ignore: cast_nullable_to_non_nullable
as List<SortOption>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductListResponse].
extension ProductListResponsePatterns on ProductListResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductListResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductListResponse value)  $default,){
final _that = this;
switch (_that) {
case _ProductListResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ProductListResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Product> items,  int totalCount,  int pageSize,  int currentPage,  int totalPages,  List<Aggregation>? aggregations,  List<SortOption>? sortOptions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductListResponse() when $default != null:
return $default(_that.items,_that.totalCount,_that.pageSize,_that.currentPage,_that.totalPages,_that.aggregations,_that.sortOptions);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Product> items,  int totalCount,  int pageSize,  int currentPage,  int totalPages,  List<Aggregation>? aggregations,  List<SortOption>? sortOptions)  $default,) {final _that = this;
switch (_that) {
case _ProductListResponse():
return $default(_that.items,_that.totalCount,_that.pageSize,_that.currentPage,_that.totalPages,_that.aggregations,_that.sortOptions);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Product> items,  int totalCount,  int pageSize,  int currentPage,  int totalPages,  List<Aggregation>? aggregations,  List<SortOption>? sortOptions)?  $default,) {final _that = this;
switch (_that) {
case _ProductListResponse() when $default != null:
return $default(_that.items,_that.totalCount,_that.pageSize,_that.currentPage,_that.totalPages,_that.aggregations,_that.sortOptions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductListResponse implements ProductListResponse {
  const _ProductListResponse({required final  List<Product> items, required this.totalCount, required this.pageSize, required this.currentPage, required this.totalPages, final  List<Aggregation>? aggregations, final  List<SortOption>? sortOptions}): _items = items,_aggregations = aggregations,_sortOptions = sortOptions;
  factory _ProductListResponse.fromJson(Map<String, dynamic> json) => _$ProductListResponseFromJson(json);

 final  List<Product> _items;
@override List<Product> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  int totalCount;
@override final  int pageSize;
@override final  int currentPage;
@override final  int totalPages;
 final  List<Aggregation>? _aggregations;
@override List<Aggregation>? get aggregations {
  final value = _aggregations;
  if (value == null) return null;
  if (_aggregations is EqualUnmodifiableListView) return _aggregations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<SortOption>? _sortOptions;
@override List<SortOption>? get sortOptions {
  final value = _sortOptions;
  if (value == null) return null;
  if (_sortOptions is EqualUnmodifiableListView) return _sortOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ProductListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductListResponseCopyWith<_ProductListResponse> get copyWith => __$ProductListResponseCopyWithImpl<_ProductListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductListResponse&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&const DeepCollectionEquality().equals(other._aggregations, _aggregations)&&const DeepCollectionEquality().equals(other._sortOptions, _sortOptions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),totalCount,pageSize,currentPage,totalPages,const DeepCollectionEquality().hash(_aggregations),const DeepCollectionEquality().hash(_sortOptions));

@override
String toString() {
  return 'ProductListResponse(items: $items, totalCount: $totalCount, pageSize: $pageSize, currentPage: $currentPage, totalPages: $totalPages, aggregations: $aggregations, sortOptions: $sortOptions)';
}


}

/// @nodoc
abstract mixin class _$ProductListResponseCopyWith<$Res> implements $ProductListResponseCopyWith<$Res> {
  factory _$ProductListResponseCopyWith(_ProductListResponse value, $Res Function(_ProductListResponse) _then) = __$ProductListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<Product> items, int totalCount, int pageSize, int currentPage, int totalPages, List<Aggregation>? aggregations, List<SortOption>? sortOptions
});




}
/// @nodoc
class __$ProductListResponseCopyWithImpl<$Res>
    implements _$ProductListResponseCopyWith<$Res> {
  __$ProductListResponseCopyWithImpl(this._self, this._then);

  final _ProductListResponse _self;
  final $Res Function(_ProductListResponse) _then;

/// Create a copy of ProductListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? totalCount = null,Object? pageSize = null,Object? currentPage = null,Object? totalPages = null,Object? aggregations = freezed,Object? sortOptions = freezed,}) {
  return _then(_ProductListResponse(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<Product>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,aggregations: freezed == aggregations ? _self._aggregations : aggregations // ignore: cast_nullable_to_non_nullable
as List<Aggregation>?,sortOptions: freezed == sortOptions ? _self._sortOptions : sortOptions // ignore: cast_nullable_to_non_nullable
as List<SortOption>?,
  ));
}


}


/// @nodoc
mixin _$Category {

 int get id; String get name; String? get description; String? get image; int? get parentId; int get level; int get position; bool get isActive; int get childrenCount; List<Category>? get children; List<CategoryAttribute>? get attributes;
/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryCopyWith<Category> get copyWith => _$CategoryCopyWithImpl<Category>(this as Category, _$identity);

  /// Serializes this Category to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Category&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.level, level) || other.level == level)&&(identical(other.position, position) || other.position == position)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.childrenCount, childrenCount) || other.childrenCount == childrenCount)&&const DeepCollectionEquality().equals(other.children, children)&&const DeepCollectionEquality().equals(other.attributes, attributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,image,parentId,level,position,isActive,childrenCount,const DeepCollectionEquality().hash(children),const DeepCollectionEquality().hash(attributes));

@override
String toString() {
  return 'Category(id: $id, name: $name, description: $description, image: $image, parentId: $parentId, level: $level, position: $position, isActive: $isActive, childrenCount: $childrenCount, children: $children, attributes: $attributes)';
}


}

/// @nodoc
abstract mixin class $CategoryCopyWith<$Res>  {
  factory $CategoryCopyWith(Category value, $Res Function(Category) _then) = _$CategoryCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? description, String? image, int? parentId, int level, int position, bool isActive, int childrenCount, List<Category>? children, List<CategoryAttribute>? attributes
});




}
/// @nodoc
class _$CategoryCopyWithImpl<$Res>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._self, this._then);

  final Category _self;
  final $Res Function(Category) _then;

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? image = freezed,Object? parentId = freezed,Object? level = null,Object? position = null,Object? isActive = null,Object? childrenCount = null,Object? children = freezed,Object? attributes = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,childrenCount: null == childrenCount ? _self.childrenCount : childrenCount // ignore: cast_nullable_to_non_nullable
as int,children: freezed == children ? _self.children : children // ignore: cast_nullable_to_non_nullable
as List<Category>?,attributes: freezed == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as List<CategoryAttribute>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Category].
extension CategoryPatterns on Category {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Category value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Category() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Category value)  $default,){
final _that = this;
switch (_that) {
case _Category():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Category value)?  $default,){
final _that = this;
switch (_that) {
case _Category() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? description,  String? image,  int? parentId,  int level,  int position,  bool isActive,  int childrenCount,  List<Category>? children,  List<CategoryAttribute>? attributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Category() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.image,_that.parentId,_that.level,_that.position,_that.isActive,_that.childrenCount,_that.children,_that.attributes);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? description,  String? image,  int? parentId,  int level,  int position,  bool isActive,  int childrenCount,  List<Category>? children,  List<CategoryAttribute>? attributes)  $default,) {final _that = this;
switch (_that) {
case _Category():
return $default(_that.id,_that.name,_that.description,_that.image,_that.parentId,_that.level,_that.position,_that.isActive,_that.childrenCount,_that.children,_that.attributes);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? description,  String? image,  int? parentId,  int level,  int position,  bool isActive,  int childrenCount,  List<Category>? children,  List<CategoryAttribute>? attributes)?  $default,) {final _that = this;
switch (_that) {
case _Category() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.image,_that.parentId,_that.level,_that.position,_that.isActive,_that.childrenCount,_that.children,_that.attributes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Category implements Category {
  const _Category({required this.id, required this.name, this.description, this.image, this.parentId, required this.level, required this.position, required this.isActive, required this.childrenCount, final  List<Category>? children, final  List<CategoryAttribute>? attributes}): _children = children,_attributes = attributes;
  factory _Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? description;
@override final  String? image;
@override final  int? parentId;
@override final  int level;
@override final  int position;
@override final  bool isActive;
@override final  int childrenCount;
 final  List<Category>? _children;
@override List<Category>? get children {
  final value = _children;
  if (value == null) return null;
  if (_children is EqualUnmodifiableListView) return _children;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<CategoryAttribute>? _attributes;
@override List<CategoryAttribute>? get attributes {
  final value = _attributes;
  if (value == null) return null;
  if (_attributes is EqualUnmodifiableListView) return _attributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryCopyWith<_Category> get copyWith => __$CategoryCopyWithImpl<_Category>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Category&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.level, level) || other.level == level)&&(identical(other.position, position) || other.position == position)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.childrenCount, childrenCount) || other.childrenCount == childrenCount)&&const DeepCollectionEquality().equals(other._children, _children)&&const DeepCollectionEquality().equals(other._attributes, _attributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,image,parentId,level,position,isActive,childrenCount,const DeepCollectionEquality().hash(_children),const DeepCollectionEquality().hash(_attributes));

@override
String toString() {
  return 'Category(id: $id, name: $name, description: $description, image: $image, parentId: $parentId, level: $level, position: $position, isActive: $isActive, childrenCount: $childrenCount, children: $children, attributes: $attributes)';
}


}

/// @nodoc
abstract mixin class _$CategoryCopyWith<$Res> implements $CategoryCopyWith<$Res> {
  factory _$CategoryCopyWith(_Category value, $Res Function(_Category) _then) = __$CategoryCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? description, String? image, int? parentId, int level, int position, bool isActive, int childrenCount, List<Category>? children, List<CategoryAttribute>? attributes
});




}
/// @nodoc
class __$CategoryCopyWithImpl<$Res>
    implements _$CategoryCopyWith<$Res> {
  __$CategoryCopyWithImpl(this._self, this._then);

  final _Category _self;
  final $Res Function(_Category) _then;

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? image = freezed,Object? parentId = freezed,Object? level = null,Object? position = null,Object? isActive = null,Object? childrenCount = null,Object? children = freezed,Object? attributes = freezed,}) {
  return _then(_Category(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as int?,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,childrenCount: null == childrenCount ? _self.childrenCount : childrenCount // ignore: cast_nullable_to_non_nullable
as int,children: freezed == children ? _self._children : children // ignore: cast_nullable_to_non_nullable
as List<Category>?,attributes: freezed == attributes ? _self._attributes : attributes // ignore: cast_nullable_to_non_nullable
as List<CategoryAttribute>?,
  ));
}


}


/// @nodoc
mixin _$CategoryTree {

 List<Category> get categories; int get totalCount;
/// Create a copy of CategoryTree
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryTreeCopyWith<CategoryTree> get copyWith => _$CategoryTreeCopyWithImpl<CategoryTree>(this as CategoryTree, _$identity);

  /// Serializes this CategoryTree to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryTree&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(categories),totalCount);

@override
String toString() {
  return 'CategoryTree(categories: $categories, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class $CategoryTreeCopyWith<$Res>  {
  factory $CategoryTreeCopyWith(CategoryTree value, $Res Function(CategoryTree) _then) = _$CategoryTreeCopyWithImpl;
@useResult
$Res call({
 List<Category> categories, int totalCount
});




}
/// @nodoc
class _$CategoryTreeCopyWithImpl<$Res>
    implements $CategoryTreeCopyWith<$Res> {
  _$CategoryTreeCopyWithImpl(this._self, this._then);

  final CategoryTree _self;
  final $Res Function(CategoryTree) _then;

/// Create a copy of CategoryTree
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categories = null,Object? totalCount = null,}) {
  return _then(_self.copyWith(
categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<Category>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryTree].
extension CategoryTreePatterns on CategoryTree {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryTree value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryTree() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryTree value)  $default,){
final _that = this;
switch (_that) {
case _CategoryTree():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryTree value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryTree() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Category> categories,  int totalCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryTree() when $default != null:
return $default(_that.categories,_that.totalCount);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Category> categories,  int totalCount)  $default,) {final _that = this;
switch (_that) {
case _CategoryTree():
return $default(_that.categories,_that.totalCount);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Category> categories,  int totalCount)?  $default,) {final _that = this;
switch (_that) {
case _CategoryTree() when $default != null:
return $default(_that.categories,_that.totalCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryTree implements CategoryTree {
  const _CategoryTree({required final  List<Category> categories, required this.totalCount}): _categories = categories;
  factory _CategoryTree.fromJson(Map<String, dynamic> json) => _$CategoryTreeFromJson(json);

 final  List<Category> _categories;
@override List<Category> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

@override final  int totalCount;

/// Create a copy of CategoryTree
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryTreeCopyWith<_CategoryTree> get copyWith => __$CategoryTreeCopyWithImpl<_CategoryTree>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryTreeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryTree&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),totalCount);

@override
String toString() {
  return 'CategoryTree(categories: $categories, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class _$CategoryTreeCopyWith<$Res> implements $CategoryTreeCopyWith<$Res> {
  factory _$CategoryTreeCopyWith(_CategoryTree value, $Res Function(_CategoryTree) _then) = __$CategoryTreeCopyWithImpl;
@override @useResult
$Res call({
 List<Category> categories, int totalCount
});




}
/// @nodoc
class __$CategoryTreeCopyWithImpl<$Res>
    implements _$CategoryTreeCopyWith<$Res> {
  __$CategoryTreeCopyWithImpl(this._self, this._then);

  final _CategoryTree _self;
  final $Res Function(_CategoryTree) _then;

/// Create a copy of CategoryTree
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? totalCount = null,}) {
  return _then(_CategoryTree(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<Category>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ProductFilterParams {

 int? get page; int? get pageSize; String? get searchQuery; String? get categoryId; String? get sortBy; String? get sortOrder; Map<String, dynamic>? get filters; double? get minPrice; double? get maxPrice; List<String>? get attributes; bool? get inStock; String? get brand; List<String>? get tags;
/// Create a copy of ProductFilterParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductFilterParamsCopyWith<ProductFilterParams> get copyWith => _$ProductFilterParamsCopyWithImpl<ProductFilterParams>(this as ProductFilterParams, _$identity);

  /// Serializes this ProductFilterParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductFilterParams&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&const DeepCollectionEquality().equals(other.filters, filters)&&(identical(other.minPrice, minPrice) || other.minPrice == minPrice)&&(identical(other.maxPrice, maxPrice) || other.maxPrice == maxPrice)&&const DeepCollectionEquality().equals(other.attributes, attributes)&&(identical(other.inStock, inStock) || other.inStock == inStock)&&(identical(other.brand, brand) || other.brand == brand)&&const DeepCollectionEquality().equals(other.tags, tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,pageSize,searchQuery,categoryId,sortBy,sortOrder,const DeepCollectionEquality().hash(filters),minPrice,maxPrice,const DeepCollectionEquality().hash(attributes),inStock,brand,const DeepCollectionEquality().hash(tags));

@override
String toString() {
  return 'ProductFilterParams(page: $page, pageSize: $pageSize, searchQuery: $searchQuery, categoryId: $categoryId, sortBy: $sortBy, sortOrder: $sortOrder, filters: $filters, minPrice: $minPrice, maxPrice: $maxPrice, attributes: $attributes, inStock: $inStock, brand: $brand, tags: $tags)';
}


}

/// @nodoc
abstract mixin class $ProductFilterParamsCopyWith<$Res>  {
  factory $ProductFilterParamsCopyWith(ProductFilterParams value, $Res Function(ProductFilterParams) _then) = _$ProductFilterParamsCopyWithImpl;
@useResult
$Res call({
 int? page, int? pageSize, String? searchQuery, String? categoryId, String? sortBy, String? sortOrder, Map<String, dynamic>? filters, double? minPrice, double? maxPrice, List<String>? attributes, bool? inStock, String? brand, List<String>? tags
});




}
/// @nodoc
class _$ProductFilterParamsCopyWithImpl<$Res>
    implements $ProductFilterParamsCopyWith<$Res> {
  _$ProductFilterParamsCopyWithImpl(this._self, this._then);

  final ProductFilterParams _self;
  final $Res Function(ProductFilterParams) _then;

/// Create a copy of ProductFilterParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = freezed,Object? pageSize = freezed,Object? searchQuery = freezed,Object? categoryId = freezed,Object? sortBy = freezed,Object? sortOrder = freezed,Object? filters = freezed,Object? minPrice = freezed,Object? maxPrice = freezed,Object? attributes = freezed,Object? inStock = freezed,Object? brand = freezed,Object? tags = freezed,}) {
  return _then(_self.copyWith(
page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,pageSize: freezed == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int?,searchQuery: freezed == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as String?,filters: freezed == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,minPrice: freezed == minPrice ? _self.minPrice : minPrice // ignore: cast_nullable_to_non_nullable
as double?,maxPrice: freezed == maxPrice ? _self.maxPrice : maxPrice // ignore: cast_nullable_to_non_nullable
as double?,attributes: freezed == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as List<String>?,inStock: freezed == inStock ? _self.inStock : inStock // ignore: cast_nullable_to_non_nullable
as bool?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductFilterParams].
extension ProductFilterParamsPatterns on ProductFilterParams {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductFilterParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductFilterParams() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductFilterParams value)  $default,){
final _that = this;
switch (_that) {
case _ProductFilterParams():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductFilterParams value)?  $default,){
final _that = this;
switch (_that) {
case _ProductFilterParams() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? page,  int? pageSize,  String? searchQuery,  String? categoryId,  String? sortBy,  String? sortOrder,  Map<String, dynamic>? filters,  double? minPrice,  double? maxPrice,  List<String>? attributes,  bool? inStock,  String? brand,  List<String>? tags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductFilterParams() when $default != null:
return $default(_that.page,_that.pageSize,_that.searchQuery,_that.categoryId,_that.sortBy,_that.sortOrder,_that.filters,_that.minPrice,_that.maxPrice,_that.attributes,_that.inStock,_that.brand,_that.tags);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? page,  int? pageSize,  String? searchQuery,  String? categoryId,  String? sortBy,  String? sortOrder,  Map<String, dynamic>? filters,  double? minPrice,  double? maxPrice,  List<String>? attributes,  bool? inStock,  String? brand,  List<String>? tags)  $default,) {final _that = this;
switch (_that) {
case _ProductFilterParams():
return $default(_that.page,_that.pageSize,_that.searchQuery,_that.categoryId,_that.sortBy,_that.sortOrder,_that.filters,_that.minPrice,_that.maxPrice,_that.attributes,_that.inStock,_that.brand,_that.tags);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? page,  int? pageSize,  String? searchQuery,  String? categoryId,  String? sortBy,  String? sortOrder,  Map<String, dynamic>? filters,  double? minPrice,  double? maxPrice,  List<String>? attributes,  bool? inStock,  String? brand,  List<String>? tags)?  $default,) {final _that = this;
switch (_that) {
case _ProductFilterParams() when $default != null:
return $default(_that.page,_that.pageSize,_that.searchQuery,_that.categoryId,_that.sortBy,_that.sortOrder,_that.filters,_that.minPrice,_that.maxPrice,_that.attributes,_that.inStock,_that.brand,_that.tags);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductFilterParams implements ProductFilterParams {
  const _ProductFilterParams({this.page, this.pageSize, this.searchQuery, this.categoryId, this.sortBy, this.sortOrder, final  Map<String, dynamic>? filters, this.minPrice, this.maxPrice, final  List<String>? attributes, this.inStock, this.brand, final  List<String>? tags}): _filters = filters,_attributes = attributes,_tags = tags;
  factory _ProductFilterParams.fromJson(Map<String, dynamic> json) => _$ProductFilterParamsFromJson(json);

@override final  int? page;
@override final  int? pageSize;
@override final  String? searchQuery;
@override final  String? categoryId;
@override final  String? sortBy;
@override final  String? sortOrder;
 final  Map<String, dynamic>? _filters;
@override Map<String, dynamic>? get filters {
  final value = _filters;
  if (value == null) return null;
  if (_filters is EqualUnmodifiableMapView) return _filters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  double? minPrice;
@override final  double? maxPrice;
 final  List<String>? _attributes;
@override List<String>? get attributes {
  final value = _attributes;
  if (value == null) return null;
  if (_attributes is EqualUnmodifiableListView) return _attributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  bool? inStock;
@override final  String? brand;
 final  List<String>? _tags;
@override List<String>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ProductFilterParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductFilterParamsCopyWith<_ProductFilterParams> get copyWith => __$ProductFilterParamsCopyWithImpl<_ProductFilterParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductFilterParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductFilterParams&&(identical(other.page, page) || other.page == page)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&const DeepCollectionEquality().equals(other._filters, _filters)&&(identical(other.minPrice, minPrice) || other.minPrice == minPrice)&&(identical(other.maxPrice, maxPrice) || other.maxPrice == maxPrice)&&const DeepCollectionEquality().equals(other._attributes, _attributes)&&(identical(other.inStock, inStock) || other.inStock == inStock)&&(identical(other.brand, brand) || other.brand == brand)&&const DeepCollectionEquality().equals(other._tags, _tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,pageSize,searchQuery,categoryId,sortBy,sortOrder,const DeepCollectionEquality().hash(_filters),minPrice,maxPrice,const DeepCollectionEquality().hash(_attributes),inStock,brand,const DeepCollectionEquality().hash(_tags));

@override
String toString() {
  return 'ProductFilterParams(page: $page, pageSize: $pageSize, searchQuery: $searchQuery, categoryId: $categoryId, sortBy: $sortBy, sortOrder: $sortOrder, filters: $filters, minPrice: $minPrice, maxPrice: $maxPrice, attributes: $attributes, inStock: $inStock, brand: $brand, tags: $tags)';
}


}

/// @nodoc
abstract mixin class _$ProductFilterParamsCopyWith<$Res> implements $ProductFilterParamsCopyWith<$Res> {
  factory _$ProductFilterParamsCopyWith(_ProductFilterParams value, $Res Function(_ProductFilterParams) _then) = __$ProductFilterParamsCopyWithImpl;
@override @useResult
$Res call({
 int? page, int? pageSize, String? searchQuery, String? categoryId, String? sortBy, String? sortOrder, Map<String, dynamic>? filters, double? minPrice, double? maxPrice, List<String>? attributes, bool? inStock, String? brand, List<String>? tags
});




}
/// @nodoc
class __$ProductFilterParamsCopyWithImpl<$Res>
    implements _$ProductFilterParamsCopyWith<$Res> {
  __$ProductFilterParamsCopyWithImpl(this._self, this._then);

  final _ProductFilterParams _self;
  final $Res Function(_ProductFilterParams) _then;

/// Create a copy of ProductFilterParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = freezed,Object? pageSize = freezed,Object? searchQuery = freezed,Object? categoryId = freezed,Object? sortBy = freezed,Object? sortOrder = freezed,Object? filters = freezed,Object? minPrice = freezed,Object? maxPrice = freezed,Object? attributes = freezed,Object? inStock = freezed,Object? brand = freezed,Object? tags = freezed,}) {
  return _then(_ProductFilterParams(
page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,pageSize: freezed == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int?,searchQuery: freezed == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as String?,filters: freezed == filters ? _self._filters : filters // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,minPrice: freezed == minPrice ? _self.minPrice : minPrice // ignore: cast_nullable_to_non_nullable
as double?,maxPrice: freezed == maxPrice ? _self.maxPrice : maxPrice // ignore: cast_nullable_to_non_nullable
as double?,attributes: freezed == attributes ? _self._attributes : attributes // ignore: cast_nullable_to_non_nullable
as List<String>?,inStock: freezed == inStock ? _self.inStock : inStock // ignore: cast_nullable_to_non_nullable
as bool?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}


/// @nodoc
mixin _$CustomAttribute {

 String get attributeCode; String get value; String? get label; String? get type; List<String>? get options;
/// Create a copy of CustomAttribute
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomAttributeCopyWith<CustomAttribute> get copyWith => _$CustomAttributeCopyWithImpl<CustomAttribute>(this as CustomAttribute, _$identity);

  /// Serializes this CustomAttribute to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomAttribute&&(identical(other.attributeCode, attributeCode) || other.attributeCode == attributeCode)&&(identical(other.value, value) || other.value == value)&&(identical(other.label, label) || other.label == label)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.options, options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,attributeCode,value,label,type,const DeepCollectionEquality().hash(options));

@override
String toString() {
  return 'CustomAttribute(attributeCode: $attributeCode, value: $value, label: $label, type: $type, options: $options)';
}


}

/// @nodoc
abstract mixin class $CustomAttributeCopyWith<$Res>  {
  factory $CustomAttributeCopyWith(CustomAttribute value, $Res Function(CustomAttribute) _then) = _$CustomAttributeCopyWithImpl;
@useResult
$Res call({
 String attributeCode, String value, String? label, String? type, List<String>? options
});




}
/// @nodoc
class _$CustomAttributeCopyWithImpl<$Res>
    implements $CustomAttributeCopyWith<$Res> {
  _$CustomAttributeCopyWithImpl(this._self, this._then);

  final CustomAttribute _self;
  final $Res Function(CustomAttribute) _then;

/// Create a copy of CustomAttribute
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? attributeCode = null,Object? value = null,Object? label = freezed,Object? type = freezed,Object? options = freezed,}) {
  return _then(_self.copyWith(
attributeCode: null == attributeCode ? _self.attributeCode : attributeCode // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomAttribute].
extension CustomAttributePatterns on CustomAttribute {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomAttribute value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomAttribute() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomAttribute value)  $default,){
final _that = this;
switch (_that) {
case _CustomAttribute():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomAttribute value)?  $default,){
final _that = this;
switch (_that) {
case _CustomAttribute() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String attributeCode,  String value,  String? label,  String? type,  List<String>? options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomAttribute() when $default != null:
return $default(_that.attributeCode,_that.value,_that.label,_that.type,_that.options);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String attributeCode,  String value,  String? label,  String? type,  List<String>? options)  $default,) {final _that = this;
switch (_that) {
case _CustomAttribute():
return $default(_that.attributeCode,_that.value,_that.label,_that.type,_that.options);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String attributeCode,  String value,  String? label,  String? type,  List<String>? options)?  $default,) {final _that = this;
switch (_that) {
case _CustomAttribute() when $default != null:
return $default(_that.attributeCode,_that.value,_that.label,_that.type,_that.options);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomAttribute implements CustomAttribute {
  const _CustomAttribute({required this.attributeCode, required this.value, this.label, this.type, final  List<String>? options}): _options = options;
  factory _CustomAttribute.fromJson(Map<String, dynamic> json) => _$CustomAttributeFromJson(json);

@override final  String attributeCode;
@override final  String value;
@override final  String? label;
@override final  String? type;
 final  List<String>? _options;
@override List<String>? get options {
  final value = _options;
  if (value == null) return null;
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of CustomAttribute
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomAttributeCopyWith<_CustomAttribute> get copyWith => __$CustomAttributeCopyWithImpl<_CustomAttribute>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomAttributeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomAttribute&&(identical(other.attributeCode, attributeCode) || other.attributeCode == attributeCode)&&(identical(other.value, value) || other.value == value)&&(identical(other.label, label) || other.label == label)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,attributeCode,value,label,type,const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'CustomAttribute(attributeCode: $attributeCode, value: $value, label: $label, type: $type, options: $options)';
}


}

/// @nodoc
abstract mixin class _$CustomAttributeCopyWith<$Res> implements $CustomAttributeCopyWith<$Res> {
  factory _$CustomAttributeCopyWith(_CustomAttribute value, $Res Function(_CustomAttribute) _then) = __$CustomAttributeCopyWithImpl;
@override @useResult
$Res call({
 String attributeCode, String value, String? label, String? type, List<String>? options
});




}
/// @nodoc
class __$CustomAttributeCopyWithImpl<$Res>
    implements _$CustomAttributeCopyWith<$Res> {
  __$CustomAttributeCopyWithImpl(this._self, this._then);

  final _CustomAttribute _self;
  final $Res Function(_CustomAttribute) _then;

/// Create a copy of CustomAttribute
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? attributeCode = null,Object? value = null,Object? label = freezed,Object? type = freezed,Object? options = freezed,}) {
  return _then(_CustomAttribute(
attributeCode: null == attributeCode ? _self.attributeCode : attributeCode // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,options: freezed == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}


/// @nodoc
mixin _$MediaGalleryEntry {

 int get id; String get mediaType; String get label; int get position; bool get disabled; List<String>? get types; String get file; String? get thumbnail; String? get smallImage; String? get baseImage;
/// Create a copy of MediaGalleryEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaGalleryEntryCopyWith<MediaGalleryEntry> get copyWith => _$MediaGalleryEntryCopyWithImpl<MediaGalleryEntry>(this as MediaGalleryEntry, _$identity);

  /// Serializes this MediaGalleryEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MediaGalleryEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.label, label) || other.label == label)&&(identical(other.position, position) || other.position == position)&&(identical(other.disabled, disabled) || other.disabled == disabled)&&const DeepCollectionEquality().equals(other.types, types)&&(identical(other.file, file) || other.file == file)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.smallImage, smallImage) || other.smallImage == smallImage)&&(identical(other.baseImage, baseImage) || other.baseImage == baseImage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,mediaType,label,position,disabled,const DeepCollectionEquality().hash(types),file,thumbnail,smallImage,baseImage);

@override
String toString() {
  return 'MediaGalleryEntry(id: $id, mediaType: $mediaType, label: $label, position: $position, disabled: $disabled, types: $types, file: $file, thumbnail: $thumbnail, smallImage: $smallImage, baseImage: $baseImage)';
}


}

/// @nodoc
abstract mixin class $MediaGalleryEntryCopyWith<$Res>  {
  factory $MediaGalleryEntryCopyWith(MediaGalleryEntry value, $Res Function(MediaGalleryEntry) _then) = _$MediaGalleryEntryCopyWithImpl;
@useResult
$Res call({
 int id, String mediaType, String label, int position, bool disabled, List<String>? types, String file, String? thumbnail, String? smallImage, String? baseImage
});




}
/// @nodoc
class _$MediaGalleryEntryCopyWithImpl<$Res>
    implements $MediaGalleryEntryCopyWith<$Res> {
  _$MediaGalleryEntryCopyWithImpl(this._self, this._then);

  final MediaGalleryEntry _self;
  final $Res Function(MediaGalleryEntry) _then;

/// Create a copy of MediaGalleryEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? mediaType = null,Object? label = null,Object? position = null,Object? disabled = null,Object? types = freezed,Object? file = null,Object? thumbnail = freezed,Object? smallImage = freezed,Object? baseImage = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,disabled: null == disabled ? _self.disabled : disabled // ignore: cast_nullable_to_non_nullable
as bool,types: freezed == types ? _self.types : types // ignore: cast_nullable_to_non_nullable
as List<String>?,file: null == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as String,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,smallImage: freezed == smallImage ? _self.smallImage : smallImage // ignore: cast_nullable_to_non_nullable
as String?,baseImage: freezed == baseImage ? _self.baseImage : baseImage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MediaGalleryEntry].
extension MediaGalleryEntryPatterns on MediaGalleryEntry {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MediaGalleryEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MediaGalleryEntry() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MediaGalleryEntry value)  $default,){
final _that = this;
switch (_that) {
case _MediaGalleryEntry():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MediaGalleryEntry value)?  $default,){
final _that = this;
switch (_that) {
case _MediaGalleryEntry() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String mediaType,  String label,  int position,  bool disabled,  List<String>? types,  String file,  String? thumbnail,  String? smallImage,  String? baseImage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MediaGalleryEntry() when $default != null:
return $default(_that.id,_that.mediaType,_that.label,_that.position,_that.disabled,_that.types,_that.file,_that.thumbnail,_that.smallImage,_that.baseImage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String mediaType,  String label,  int position,  bool disabled,  List<String>? types,  String file,  String? thumbnail,  String? smallImage,  String? baseImage)  $default,) {final _that = this;
switch (_that) {
case _MediaGalleryEntry():
return $default(_that.id,_that.mediaType,_that.label,_that.position,_that.disabled,_that.types,_that.file,_that.thumbnail,_that.smallImage,_that.baseImage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String mediaType,  String label,  int position,  bool disabled,  List<String>? types,  String file,  String? thumbnail,  String? smallImage,  String? baseImage)?  $default,) {final _that = this;
switch (_that) {
case _MediaGalleryEntry() when $default != null:
return $default(_that.id,_that.mediaType,_that.label,_that.position,_that.disabled,_that.types,_that.file,_that.thumbnail,_that.smallImage,_that.baseImage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MediaGalleryEntry implements MediaGalleryEntry {
  const _MediaGalleryEntry({required this.id, required this.mediaType, required this.label, required this.position, required this.disabled, final  List<String>? types, required this.file, this.thumbnail, this.smallImage, this.baseImage}): _types = types;
  factory _MediaGalleryEntry.fromJson(Map<String, dynamic> json) => _$MediaGalleryEntryFromJson(json);

@override final  int id;
@override final  String mediaType;
@override final  String label;
@override final  int position;
@override final  bool disabled;
 final  List<String>? _types;
@override List<String>? get types {
  final value = _types;
  if (value == null) return null;
  if (_types is EqualUnmodifiableListView) return _types;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String file;
@override final  String? thumbnail;
@override final  String? smallImage;
@override final  String? baseImage;

/// Create a copy of MediaGalleryEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MediaGalleryEntryCopyWith<_MediaGalleryEntry> get copyWith => __$MediaGalleryEntryCopyWithImpl<_MediaGalleryEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MediaGalleryEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MediaGalleryEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.label, label) || other.label == label)&&(identical(other.position, position) || other.position == position)&&(identical(other.disabled, disabled) || other.disabled == disabled)&&const DeepCollectionEquality().equals(other._types, _types)&&(identical(other.file, file) || other.file == file)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.smallImage, smallImage) || other.smallImage == smallImage)&&(identical(other.baseImage, baseImage) || other.baseImage == baseImage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,mediaType,label,position,disabled,const DeepCollectionEquality().hash(_types),file,thumbnail,smallImage,baseImage);

@override
String toString() {
  return 'MediaGalleryEntry(id: $id, mediaType: $mediaType, label: $label, position: $position, disabled: $disabled, types: $types, file: $file, thumbnail: $thumbnail, smallImage: $smallImage, baseImage: $baseImage)';
}


}

/// @nodoc
abstract mixin class _$MediaGalleryEntryCopyWith<$Res> implements $MediaGalleryEntryCopyWith<$Res> {
  factory _$MediaGalleryEntryCopyWith(_MediaGalleryEntry value, $Res Function(_MediaGalleryEntry) _then) = __$MediaGalleryEntryCopyWithImpl;
@override @useResult
$Res call({
 int id, String mediaType, String label, int position, bool disabled, List<String>? types, String file, String? thumbnail, String? smallImage, String? baseImage
});




}
/// @nodoc
class __$MediaGalleryEntryCopyWithImpl<$Res>
    implements _$MediaGalleryEntryCopyWith<$Res> {
  __$MediaGalleryEntryCopyWithImpl(this._self, this._then);

  final _MediaGalleryEntry _self;
  final $Res Function(_MediaGalleryEntry) _then;

/// Create a copy of MediaGalleryEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? mediaType = null,Object? label = null,Object? position = null,Object? disabled = null,Object? types = freezed,Object? file = null,Object? thumbnail = freezed,Object? smallImage = freezed,Object? baseImage = freezed,}) {
  return _then(_MediaGalleryEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,disabled: null == disabled ? _self.disabled : disabled // ignore: cast_nullable_to_non_nullable
as bool,types: freezed == types ? _self._types : types // ignore: cast_nullable_to_non_nullable
as List<String>?,file: null == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as String,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,smallImage: freezed == smallImage ? _self.smallImage : smallImage // ignore: cast_nullable_to_non_nullable
as String?,baseImage: freezed == baseImage ? _self.baseImage : baseImage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ProductOption {

 int get id; String get title; String get type; bool get required; List<ProductOptionValue>? get values; String? get defaultValue; int? get maxCharacters; String? get fileExtension; String? get imageSizeX; String? get imageSizeY;
/// Create a copy of ProductOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductOptionCopyWith<ProductOption> get copyWith => _$ProductOptionCopyWithImpl<ProductOption>(this as ProductOption, _$identity);

  /// Serializes this ProductOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductOption&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.type, type) || other.type == type)&&(identical(other.required, required) || other.required == required)&&const DeepCollectionEquality().equals(other.values, values)&&(identical(other.defaultValue, defaultValue) || other.defaultValue == defaultValue)&&(identical(other.maxCharacters, maxCharacters) || other.maxCharacters == maxCharacters)&&(identical(other.fileExtension, fileExtension) || other.fileExtension == fileExtension)&&(identical(other.imageSizeX, imageSizeX) || other.imageSizeX == imageSizeX)&&(identical(other.imageSizeY, imageSizeY) || other.imageSizeY == imageSizeY));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,type,required,const DeepCollectionEquality().hash(values),defaultValue,maxCharacters,fileExtension,imageSizeX,imageSizeY);

@override
String toString() {
  return 'ProductOption(id: $id, title: $title, type: $type, required: $required, values: $values, defaultValue: $defaultValue, maxCharacters: $maxCharacters, fileExtension: $fileExtension, imageSizeX: $imageSizeX, imageSizeY: $imageSizeY)';
}


}

/// @nodoc
abstract mixin class $ProductOptionCopyWith<$Res>  {
  factory $ProductOptionCopyWith(ProductOption value, $Res Function(ProductOption) _then) = _$ProductOptionCopyWithImpl;
@useResult
$Res call({
 int id, String title, String type, bool required, List<ProductOptionValue>? values, String? defaultValue, int? maxCharacters, String? fileExtension, String? imageSizeX, String? imageSizeY
});




}
/// @nodoc
class _$ProductOptionCopyWithImpl<$Res>
    implements $ProductOptionCopyWith<$Res> {
  _$ProductOptionCopyWithImpl(this._self, this._then);

  final ProductOption _self;
  final $Res Function(ProductOption) _then;

/// Create a copy of ProductOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? type = null,Object? required = null,Object? values = freezed,Object? defaultValue = freezed,Object? maxCharacters = freezed,Object? fileExtension = freezed,Object? imageSizeX = freezed,Object? imageSizeY = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,required: null == required ? _self.required : required // ignore: cast_nullable_to_non_nullable
as bool,values: freezed == values ? _self.values : values // ignore: cast_nullable_to_non_nullable
as List<ProductOptionValue>?,defaultValue: freezed == defaultValue ? _self.defaultValue : defaultValue // ignore: cast_nullable_to_non_nullable
as String?,maxCharacters: freezed == maxCharacters ? _self.maxCharacters : maxCharacters // ignore: cast_nullable_to_non_nullable
as int?,fileExtension: freezed == fileExtension ? _self.fileExtension : fileExtension // ignore: cast_nullable_to_non_nullable
as String?,imageSizeX: freezed == imageSizeX ? _self.imageSizeX : imageSizeX // ignore: cast_nullable_to_non_nullable
as String?,imageSizeY: freezed == imageSizeY ? _self.imageSizeY : imageSizeY // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductOption].
extension ProductOptionPatterns on ProductOption {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductOption() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductOption value)  $default,){
final _that = this;
switch (_that) {
case _ProductOption():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductOption value)?  $default,){
final _that = this;
switch (_that) {
case _ProductOption() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String type,  bool required,  List<ProductOptionValue>? values,  String? defaultValue,  int? maxCharacters,  String? fileExtension,  String? imageSizeX,  String? imageSizeY)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductOption() when $default != null:
return $default(_that.id,_that.title,_that.type,_that.required,_that.values,_that.defaultValue,_that.maxCharacters,_that.fileExtension,_that.imageSizeX,_that.imageSizeY);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String type,  bool required,  List<ProductOptionValue>? values,  String? defaultValue,  int? maxCharacters,  String? fileExtension,  String? imageSizeX,  String? imageSizeY)  $default,) {final _that = this;
switch (_that) {
case _ProductOption():
return $default(_that.id,_that.title,_that.type,_that.required,_that.values,_that.defaultValue,_that.maxCharacters,_that.fileExtension,_that.imageSizeX,_that.imageSizeY);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String type,  bool required,  List<ProductOptionValue>? values,  String? defaultValue,  int? maxCharacters,  String? fileExtension,  String? imageSizeX,  String? imageSizeY)?  $default,) {final _that = this;
switch (_that) {
case _ProductOption() when $default != null:
return $default(_that.id,_that.title,_that.type,_that.required,_that.values,_that.defaultValue,_that.maxCharacters,_that.fileExtension,_that.imageSizeX,_that.imageSizeY);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductOption implements ProductOption {
  const _ProductOption({required this.id, required this.title, required this.type, required this.required, final  List<ProductOptionValue>? values, this.defaultValue, this.maxCharacters, this.fileExtension, this.imageSizeX, this.imageSizeY}): _values = values;
  factory _ProductOption.fromJson(Map<String, dynamic> json) => _$ProductOptionFromJson(json);

@override final  int id;
@override final  String title;
@override final  String type;
@override final  bool required;
 final  List<ProductOptionValue>? _values;
@override List<ProductOptionValue>? get values {
  final value = _values;
  if (value == null) return null;
  if (_values is EqualUnmodifiableListView) return _values;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? defaultValue;
@override final  int? maxCharacters;
@override final  String? fileExtension;
@override final  String? imageSizeX;
@override final  String? imageSizeY;

/// Create a copy of ProductOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductOptionCopyWith<_ProductOption> get copyWith => __$ProductOptionCopyWithImpl<_ProductOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductOptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductOption&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.type, type) || other.type == type)&&(identical(other.required, required) || other.required == required)&&const DeepCollectionEquality().equals(other._values, _values)&&(identical(other.defaultValue, defaultValue) || other.defaultValue == defaultValue)&&(identical(other.maxCharacters, maxCharacters) || other.maxCharacters == maxCharacters)&&(identical(other.fileExtension, fileExtension) || other.fileExtension == fileExtension)&&(identical(other.imageSizeX, imageSizeX) || other.imageSizeX == imageSizeX)&&(identical(other.imageSizeY, imageSizeY) || other.imageSizeY == imageSizeY));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,type,required,const DeepCollectionEquality().hash(_values),defaultValue,maxCharacters,fileExtension,imageSizeX,imageSizeY);

@override
String toString() {
  return 'ProductOption(id: $id, title: $title, type: $type, required: $required, values: $values, defaultValue: $defaultValue, maxCharacters: $maxCharacters, fileExtension: $fileExtension, imageSizeX: $imageSizeX, imageSizeY: $imageSizeY)';
}


}

/// @nodoc
abstract mixin class _$ProductOptionCopyWith<$Res> implements $ProductOptionCopyWith<$Res> {
  factory _$ProductOptionCopyWith(_ProductOption value, $Res Function(_ProductOption) _then) = __$ProductOptionCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String type, bool required, List<ProductOptionValue>? values, String? defaultValue, int? maxCharacters, String? fileExtension, String? imageSizeX, String? imageSizeY
});




}
/// @nodoc
class __$ProductOptionCopyWithImpl<$Res>
    implements _$ProductOptionCopyWith<$Res> {
  __$ProductOptionCopyWithImpl(this._self, this._then);

  final _ProductOption _self;
  final $Res Function(_ProductOption) _then;

/// Create a copy of ProductOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? type = null,Object? required = null,Object? values = freezed,Object? defaultValue = freezed,Object? maxCharacters = freezed,Object? fileExtension = freezed,Object? imageSizeX = freezed,Object? imageSizeY = freezed,}) {
  return _then(_ProductOption(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,required: null == required ? _self.required : required // ignore: cast_nullable_to_non_nullable
as bool,values: freezed == values ? _self._values : values // ignore: cast_nullable_to_non_nullable
as List<ProductOptionValue>?,defaultValue: freezed == defaultValue ? _self.defaultValue : defaultValue // ignore: cast_nullable_to_non_nullable
as String?,maxCharacters: freezed == maxCharacters ? _self.maxCharacters : maxCharacters // ignore: cast_nullable_to_non_nullable
as int?,fileExtension: freezed == fileExtension ? _self.fileExtension : fileExtension // ignore: cast_nullable_to_non_nullable
as String?,imageSizeX: freezed == imageSizeX ? _self.imageSizeX : imageSizeX // ignore: cast_nullable_to_non_nullable
as String?,imageSizeY: freezed == imageSizeY ? _self.imageSizeY : imageSizeY // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ProductOptionValue {

 int get id; String get title; double? get price; String? get priceType; String? get sku; int? get sortOrder;
/// Create a copy of ProductOptionValue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductOptionValueCopyWith<ProductOptionValue> get copyWith => _$ProductOptionValueCopyWithImpl<ProductOptionValue>(this as ProductOptionValue, _$identity);

  /// Serializes this ProductOptionValue to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductOptionValue&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceType, priceType) || other.priceType == priceType)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,price,priceType,sku,sortOrder);

@override
String toString() {
  return 'ProductOptionValue(id: $id, title: $title, price: $price, priceType: $priceType, sku: $sku, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class $ProductOptionValueCopyWith<$Res>  {
  factory $ProductOptionValueCopyWith(ProductOptionValue value, $Res Function(ProductOptionValue) _then) = _$ProductOptionValueCopyWithImpl;
@useResult
$Res call({
 int id, String title, double? price, String? priceType, String? sku, int? sortOrder
});




}
/// @nodoc
class _$ProductOptionValueCopyWithImpl<$Res>
    implements $ProductOptionValueCopyWith<$Res> {
  _$ProductOptionValueCopyWithImpl(this._self, this._then);

  final ProductOptionValue _self;
  final $Res Function(ProductOptionValue) _then;

/// Create a copy of ProductOptionValue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? price = freezed,Object? priceType = freezed,Object? sku = freezed,Object? sortOrder = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,priceType: freezed == priceType ? _self.priceType : priceType // ignore: cast_nullable_to_non_nullable
as String?,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductOptionValue].
extension ProductOptionValuePatterns on ProductOptionValue {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductOptionValue value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductOptionValue() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductOptionValue value)  $default,){
final _that = this;
switch (_that) {
case _ProductOptionValue():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductOptionValue value)?  $default,){
final _that = this;
switch (_that) {
case _ProductOptionValue() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  double? price,  String? priceType,  String? sku,  int? sortOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductOptionValue() when $default != null:
return $default(_that.id,_that.title,_that.price,_that.priceType,_that.sku,_that.sortOrder);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  double? price,  String? priceType,  String? sku,  int? sortOrder)  $default,) {final _that = this;
switch (_that) {
case _ProductOptionValue():
return $default(_that.id,_that.title,_that.price,_that.priceType,_that.sku,_that.sortOrder);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  double? price,  String? priceType,  String? sku,  int? sortOrder)?  $default,) {final _that = this;
switch (_that) {
case _ProductOptionValue() when $default != null:
return $default(_that.id,_that.title,_that.price,_that.priceType,_that.sku,_that.sortOrder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductOptionValue implements ProductOptionValue {
  const _ProductOptionValue({required this.id, required this.title, this.price, this.priceType, this.sku, this.sortOrder});
  factory _ProductOptionValue.fromJson(Map<String, dynamic> json) => _$ProductOptionValueFromJson(json);

@override final  int id;
@override final  String title;
@override final  double? price;
@override final  String? priceType;
@override final  String? sku;
@override final  int? sortOrder;

/// Create a copy of ProductOptionValue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductOptionValueCopyWith<_ProductOptionValue> get copyWith => __$ProductOptionValueCopyWithImpl<_ProductOptionValue>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductOptionValueToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductOptionValue&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceType, priceType) || other.priceType == priceType)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,price,priceType,sku,sortOrder);

@override
String toString() {
  return 'ProductOptionValue(id: $id, title: $title, price: $price, priceType: $priceType, sku: $sku, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class _$ProductOptionValueCopyWith<$Res> implements $ProductOptionValueCopyWith<$Res> {
  factory _$ProductOptionValueCopyWith(_ProductOptionValue value, $Res Function(_ProductOptionValue) _then) = __$ProductOptionValueCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, double? price, String? priceType, String? sku, int? sortOrder
});




}
/// @nodoc
class __$ProductOptionValueCopyWithImpl<$Res>
    implements _$ProductOptionValueCopyWith<$Res> {
  __$ProductOptionValueCopyWithImpl(this._self, this._then);

  final _ProductOptionValue _self;
  final $Res Function(_ProductOptionValue) _then;

/// Create a copy of ProductOptionValue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? price = freezed,Object? priceType = freezed,Object? sku = freezed,Object? sortOrder = freezed,}) {
  return _then(_ProductOptionValue(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,priceType: freezed == priceType ? _self.priceType : priceType // ignore: cast_nullable_to_non_nullable
as String?,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$ProductLink {

 int get id; String get linkType; Product get linkedProduct; int? get position;
/// Create a copy of ProductLink
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductLinkCopyWith<ProductLink> get copyWith => _$ProductLinkCopyWithImpl<ProductLink>(this as ProductLink, _$identity);

  /// Serializes this ProductLink to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductLink&&(identical(other.id, id) || other.id == id)&&(identical(other.linkType, linkType) || other.linkType == linkType)&&(identical(other.linkedProduct, linkedProduct) || other.linkedProduct == linkedProduct)&&(identical(other.position, position) || other.position == position));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,linkType,linkedProduct,position);

@override
String toString() {
  return 'ProductLink(id: $id, linkType: $linkType, linkedProduct: $linkedProduct, position: $position)';
}


}

/// @nodoc
abstract mixin class $ProductLinkCopyWith<$Res>  {
  factory $ProductLinkCopyWith(ProductLink value, $Res Function(ProductLink) _then) = _$ProductLinkCopyWithImpl;
@useResult
$Res call({
 int id, String linkType, Product linkedProduct, int? position
});


$ProductCopyWith<$Res> get linkedProduct;

}
/// @nodoc
class _$ProductLinkCopyWithImpl<$Res>
    implements $ProductLinkCopyWith<$Res> {
  _$ProductLinkCopyWithImpl(this._self, this._then);

  final ProductLink _self;
  final $Res Function(ProductLink) _then;

/// Create a copy of ProductLink
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? linkType = null,Object? linkedProduct = null,Object? position = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,linkType: null == linkType ? _self.linkType : linkType // ignore: cast_nullable_to_non_nullable
as String,linkedProduct: null == linkedProduct ? _self.linkedProduct : linkedProduct // ignore: cast_nullable_to_non_nullable
as Product,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of ProductLink
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductCopyWith<$Res> get linkedProduct {
  
  return $ProductCopyWith<$Res>(_self.linkedProduct, (value) {
    return _then(_self.copyWith(linkedProduct: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductLink].
extension ProductLinkPatterns on ProductLink {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductLink value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductLink() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductLink value)  $default,){
final _that = this;
switch (_that) {
case _ProductLink():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductLink value)?  $default,){
final _that = this;
switch (_that) {
case _ProductLink() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String linkType,  Product linkedProduct,  int? position)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductLink() when $default != null:
return $default(_that.id,_that.linkType,_that.linkedProduct,_that.position);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String linkType,  Product linkedProduct,  int? position)  $default,) {final _that = this;
switch (_that) {
case _ProductLink():
return $default(_that.id,_that.linkType,_that.linkedProduct,_that.position);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String linkType,  Product linkedProduct,  int? position)?  $default,) {final _that = this;
switch (_that) {
case _ProductLink() when $default != null:
return $default(_that.id,_that.linkType,_that.linkedProduct,_that.position);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductLink implements ProductLink {
  const _ProductLink({required this.id, required this.linkType, required this.linkedProduct, this.position});
  factory _ProductLink.fromJson(Map<String, dynamic> json) => _$ProductLinkFromJson(json);

@override final  int id;
@override final  String linkType;
@override final  Product linkedProduct;
@override final  int? position;

/// Create a copy of ProductLink
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductLinkCopyWith<_ProductLink> get copyWith => __$ProductLinkCopyWithImpl<_ProductLink>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductLinkToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductLink&&(identical(other.id, id) || other.id == id)&&(identical(other.linkType, linkType) || other.linkType == linkType)&&(identical(other.linkedProduct, linkedProduct) || other.linkedProduct == linkedProduct)&&(identical(other.position, position) || other.position == position));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,linkType,linkedProduct,position);

@override
String toString() {
  return 'ProductLink(id: $id, linkType: $linkType, linkedProduct: $linkedProduct, position: $position)';
}


}

/// @nodoc
abstract mixin class _$ProductLinkCopyWith<$Res> implements $ProductLinkCopyWith<$Res> {
  factory _$ProductLinkCopyWith(_ProductLink value, $Res Function(_ProductLink) _then) = __$ProductLinkCopyWithImpl;
@override @useResult
$Res call({
 int id, String linkType, Product linkedProduct, int? position
});


@override $ProductCopyWith<$Res> get linkedProduct;

}
/// @nodoc
class __$ProductLinkCopyWithImpl<$Res>
    implements _$ProductLinkCopyWith<$Res> {
  __$ProductLinkCopyWithImpl(this._self, this._then);

  final _ProductLink _self;
  final $Res Function(_ProductLink) _then;

/// Create a copy of ProductLink
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? linkType = null,Object? linkedProduct = null,Object? position = freezed,}) {
  return _then(_ProductLink(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,linkType: null == linkType ? _self.linkType : linkType // ignore: cast_nullable_to_non_nullable
as String,linkedProduct: null == linkedProduct ? _self.linkedProduct : linkedProduct // ignore: cast_nullable_to_non_nullable
as Product,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of ProductLink
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductCopyWith<$Res> get linkedProduct {
  
  return $ProductCopyWith<$Res>(_self.linkedProduct, (value) {
    return _then(_self.copyWith(linkedProduct: value));
  });
}
}


/// @nodoc
mixin _$TierPrice {

 int get id; int get customerGroupId; double get price; int get qty; String? get websiteId;
/// Create a copy of TierPrice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TierPriceCopyWith<TierPrice> get copyWith => _$TierPriceCopyWithImpl<TierPrice>(this as TierPrice, _$identity);

  /// Serializes this TierPrice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TierPrice&&(identical(other.id, id) || other.id == id)&&(identical(other.customerGroupId, customerGroupId) || other.customerGroupId == customerGroupId)&&(identical(other.price, price) || other.price == price)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.websiteId, websiteId) || other.websiteId == websiteId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,customerGroupId,price,qty,websiteId);

@override
String toString() {
  return 'TierPrice(id: $id, customerGroupId: $customerGroupId, price: $price, qty: $qty, websiteId: $websiteId)';
}


}

/// @nodoc
abstract mixin class $TierPriceCopyWith<$Res>  {
  factory $TierPriceCopyWith(TierPrice value, $Res Function(TierPrice) _then) = _$TierPriceCopyWithImpl;
@useResult
$Res call({
 int id, int customerGroupId, double price, int qty, String? websiteId
});




}
/// @nodoc
class _$TierPriceCopyWithImpl<$Res>
    implements $TierPriceCopyWith<$Res> {
  _$TierPriceCopyWithImpl(this._self, this._then);

  final TierPrice _self;
  final $Res Function(TierPrice) _then;

/// Create a copy of TierPrice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? customerGroupId = null,Object? price = null,Object? qty = null,Object? websiteId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,customerGroupId: null == customerGroupId ? _self.customerGroupId : customerGroupId // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,websiteId: freezed == websiteId ? _self.websiteId : websiteId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TierPrice].
extension TierPricePatterns on TierPrice {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TierPrice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TierPrice() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TierPrice value)  $default,){
final _that = this;
switch (_that) {
case _TierPrice():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TierPrice value)?  $default,){
final _that = this;
switch (_that) {
case _TierPrice() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int customerGroupId,  double price,  int qty,  String? websiteId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TierPrice() when $default != null:
return $default(_that.id,_that.customerGroupId,_that.price,_that.qty,_that.websiteId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int customerGroupId,  double price,  int qty,  String? websiteId)  $default,) {final _that = this;
switch (_that) {
case _TierPrice():
return $default(_that.id,_that.customerGroupId,_that.price,_that.qty,_that.websiteId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int customerGroupId,  double price,  int qty,  String? websiteId)?  $default,) {final _that = this;
switch (_that) {
case _TierPrice() when $default != null:
return $default(_that.id,_that.customerGroupId,_that.price,_that.qty,_that.websiteId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TierPrice implements TierPrice {
  const _TierPrice({required this.id, required this.customerGroupId, required this.price, required this.qty, this.websiteId});
  factory _TierPrice.fromJson(Map<String, dynamic> json) => _$TierPriceFromJson(json);

@override final  int id;
@override final  int customerGroupId;
@override final  double price;
@override final  int qty;
@override final  String? websiteId;

/// Create a copy of TierPrice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TierPriceCopyWith<_TierPrice> get copyWith => __$TierPriceCopyWithImpl<_TierPrice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TierPriceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TierPrice&&(identical(other.id, id) || other.id == id)&&(identical(other.customerGroupId, customerGroupId) || other.customerGroupId == customerGroupId)&&(identical(other.price, price) || other.price == price)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.websiteId, websiteId) || other.websiteId == websiteId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,customerGroupId,price,qty,websiteId);

@override
String toString() {
  return 'TierPrice(id: $id, customerGroupId: $customerGroupId, price: $price, qty: $qty, websiteId: $websiteId)';
}


}

/// @nodoc
abstract mixin class _$TierPriceCopyWith<$Res> implements $TierPriceCopyWith<$Res> {
  factory _$TierPriceCopyWith(_TierPrice value, $Res Function(_TierPrice) _then) = __$TierPriceCopyWithImpl;
@override @useResult
$Res call({
 int id, int customerGroupId, double price, int qty, String? websiteId
});




}
/// @nodoc
class __$TierPriceCopyWithImpl<$Res>
    implements _$TierPriceCopyWith<$Res> {
  __$TierPriceCopyWithImpl(this._self, this._then);

  final _TierPrice _self;
  final $Res Function(_TierPrice) _then;

/// Create a copy of TierPrice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? customerGroupId = null,Object? price = null,Object? qty = null,Object? websiteId = freezed,}) {
  return _then(_TierPrice(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,customerGroupId: null == customerGroupId ? _self.customerGroupId : customerGroupId // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as int,websiteId: freezed == websiteId ? _self.websiteId : websiteId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Review {

 int get id; String get title; String get detail; String get nickname; int get customerId; double get rating; DateTime get createdAt; String? get status; List<ReviewRating>? get ratings;
/// Create a copy of Review
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewCopyWith<Review> get copyWith => _$ReviewCopyWithImpl<Review>(this as Review, _$identity);

  /// Serializes this Review to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Review&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.ratings, ratings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,detail,nickname,customerId,rating,createdAt,status,const DeepCollectionEquality().hash(ratings));

@override
String toString() {
  return 'Review(id: $id, title: $title, detail: $detail, nickname: $nickname, customerId: $customerId, rating: $rating, createdAt: $createdAt, status: $status, ratings: $ratings)';
}


}

/// @nodoc
abstract mixin class $ReviewCopyWith<$Res>  {
  factory $ReviewCopyWith(Review value, $Res Function(Review) _then) = _$ReviewCopyWithImpl;
@useResult
$Res call({
 int id, String title, String detail, String nickname, int customerId, double rating, DateTime createdAt, String? status, List<ReviewRating>? ratings
});




}
/// @nodoc
class _$ReviewCopyWithImpl<$Res>
    implements $ReviewCopyWith<$Res> {
  _$ReviewCopyWithImpl(this._self, this._then);

  final Review _self;
  final $Res Function(Review) _then;

/// Create a copy of Review
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? detail = null,Object? nickname = null,Object? customerId = null,Object? rating = null,Object? createdAt = null,Object? status = freezed,Object? ratings = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,ratings: freezed == ratings ? _self.ratings : ratings // ignore: cast_nullable_to_non_nullable
as List<ReviewRating>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Review].
extension ReviewPatterns on Review {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Review value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Review() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Review value)  $default,){
final _that = this;
switch (_that) {
case _Review():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Review value)?  $default,){
final _that = this;
switch (_that) {
case _Review() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String detail,  String nickname,  int customerId,  double rating,  DateTime createdAt,  String? status,  List<ReviewRating>? ratings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Review() when $default != null:
return $default(_that.id,_that.title,_that.detail,_that.nickname,_that.customerId,_that.rating,_that.createdAt,_that.status,_that.ratings);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String detail,  String nickname,  int customerId,  double rating,  DateTime createdAt,  String? status,  List<ReviewRating>? ratings)  $default,) {final _that = this;
switch (_that) {
case _Review():
return $default(_that.id,_that.title,_that.detail,_that.nickname,_that.customerId,_that.rating,_that.createdAt,_that.status,_that.ratings);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String detail,  String nickname,  int customerId,  double rating,  DateTime createdAt,  String? status,  List<ReviewRating>? ratings)?  $default,) {final _that = this;
switch (_that) {
case _Review() when $default != null:
return $default(_that.id,_that.title,_that.detail,_that.nickname,_that.customerId,_that.rating,_that.createdAt,_that.status,_that.ratings);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Review implements Review {
  const _Review({required this.id, required this.title, required this.detail, required this.nickname, required this.customerId, required this.rating, required this.createdAt, this.status, final  List<ReviewRating>? ratings}): _ratings = ratings;
  factory _Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

@override final  int id;
@override final  String title;
@override final  String detail;
@override final  String nickname;
@override final  int customerId;
@override final  double rating;
@override final  DateTime createdAt;
@override final  String? status;
 final  List<ReviewRating>? _ratings;
@override List<ReviewRating>? get ratings {
  final value = _ratings;
  if (value == null) return null;
  if (_ratings is EqualUnmodifiableListView) return _ratings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Review
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewCopyWith<_Review> get copyWith => __$ReviewCopyWithImpl<_Review>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReviewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Review&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._ratings, _ratings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,detail,nickname,customerId,rating,createdAt,status,const DeepCollectionEquality().hash(_ratings));

@override
String toString() {
  return 'Review(id: $id, title: $title, detail: $detail, nickname: $nickname, customerId: $customerId, rating: $rating, createdAt: $createdAt, status: $status, ratings: $ratings)';
}


}

/// @nodoc
abstract mixin class _$ReviewCopyWith<$Res> implements $ReviewCopyWith<$Res> {
  factory _$ReviewCopyWith(_Review value, $Res Function(_Review) _then) = __$ReviewCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String detail, String nickname, int customerId, double rating, DateTime createdAt, String? status, List<ReviewRating>? ratings
});




}
/// @nodoc
class __$ReviewCopyWithImpl<$Res>
    implements _$ReviewCopyWith<$Res> {
  __$ReviewCopyWithImpl(this._self, this._then);

  final _Review _self;
  final $Res Function(_Review) _then;

/// Create a copy of Review
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? detail = null,Object? nickname = null,Object? customerId = null,Object? rating = null,Object? createdAt = null,Object? status = freezed,Object? ratings = freezed,}) {
  return _then(_Review(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,ratings: freezed == ratings ? _self._ratings : ratings // ignore: cast_nullable_to_non_nullable
as List<ReviewRating>?,
  ));
}


}


/// @nodoc
mixin _$ReviewRating {

 int get id; String get ratingName; double get rating; int get ratingId;
/// Create a copy of ReviewRating
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewRatingCopyWith<ReviewRating> get copyWith => _$ReviewRatingCopyWithImpl<ReviewRating>(this as ReviewRating, _$identity);

  /// Serializes this ReviewRating to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewRating&&(identical(other.id, id) || other.id == id)&&(identical(other.ratingName, ratingName) || other.ratingName == ratingName)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.ratingId, ratingId) || other.ratingId == ratingId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ratingName,rating,ratingId);

@override
String toString() {
  return 'ReviewRating(id: $id, ratingName: $ratingName, rating: $rating, ratingId: $ratingId)';
}


}

/// @nodoc
abstract mixin class $ReviewRatingCopyWith<$Res>  {
  factory $ReviewRatingCopyWith(ReviewRating value, $Res Function(ReviewRating) _then) = _$ReviewRatingCopyWithImpl;
@useResult
$Res call({
 int id, String ratingName, double rating, int ratingId
});




}
/// @nodoc
class _$ReviewRatingCopyWithImpl<$Res>
    implements $ReviewRatingCopyWith<$Res> {
  _$ReviewRatingCopyWithImpl(this._self, this._then);

  final ReviewRating _self;
  final $Res Function(ReviewRating) _then;

/// Create a copy of ReviewRating
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ratingName = null,Object? rating = null,Object? ratingId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,ratingName: null == ratingName ? _self.ratingName : ratingName // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,ratingId: null == ratingId ? _self.ratingId : ratingId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ReviewRating].
extension ReviewRatingPatterns on ReviewRating {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReviewRating value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReviewRating() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReviewRating value)  $default,){
final _that = this;
switch (_that) {
case _ReviewRating():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReviewRating value)?  $default,){
final _that = this;
switch (_that) {
case _ReviewRating() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String ratingName,  double rating,  int ratingId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReviewRating() when $default != null:
return $default(_that.id,_that.ratingName,_that.rating,_that.ratingId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String ratingName,  double rating,  int ratingId)  $default,) {final _that = this;
switch (_that) {
case _ReviewRating():
return $default(_that.id,_that.ratingName,_that.rating,_that.ratingId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String ratingName,  double rating,  int ratingId)?  $default,) {final _that = this;
switch (_that) {
case _ReviewRating() when $default != null:
return $default(_that.id,_that.ratingName,_that.rating,_that.ratingId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReviewRating implements ReviewRating {
  const _ReviewRating({required this.id, required this.ratingName, required this.rating, required this.ratingId});
  factory _ReviewRating.fromJson(Map<String, dynamic> json) => _$ReviewRatingFromJson(json);

@override final  int id;
@override final  String ratingName;
@override final  double rating;
@override final  int ratingId;

/// Create a copy of ReviewRating
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewRatingCopyWith<_ReviewRating> get copyWith => __$ReviewRatingCopyWithImpl<_ReviewRating>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReviewRatingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewRating&&(identical(other.id, id) || other.id == id)&&(identical(other.ratingName, ratingName) || other.ratingName == ratingName)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.ratingId, ratingId) || other.ratingId == ratingId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ratingName,rating,ratingId);

@override
String toString() {
  return 'ReviewRating(id: $id, ratingName: $ratingName, rating: $rating, ratingId: $ratingId)';
}


}

/// @nodoc
abstract mixin class _$ReviewRatingCopyWith<$Res> implements $ReviewRatingCopyWith<$Res> {
  factory _$ReviewRatingCopyWith(_ReviewRating value, $Res Function(_ReviewRating) _then) = __$ReviewRatingCopyWithImpl;
@override @useResult
$Res call({
 int id, String ratingName, double rating, int ratingId
});




}
/// @nodoc
class __$ReviewRatingCopyWithImpl<$Res>
    implements _$ReviewRatingCopyWith<$Res> {
  __$ReviewRatingCopyWithImpl(this._self, this._then);

  final _ReviewRating _self;
  final $Res Function(_ReviewRating) _then;

/// Create a copy of ReviewRating
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ratingName = null,Object? rating = null,Object? ratingId = null,}) {
  return _then(_ReviewRating(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,ratingName: null == ratingName ? _self.ratingName : ratingName // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,ratingId: null == ratingId ? _self.ratingId : ratingId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Aggregation {

 String get attributeCode; String get label; List<AggregationOption> get options; int get count;
/// Create a copy of Aggregation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AggregationCopyWith<Aggregation> get copyWith => _$AggregationCopyWithImpl<Aggregation>(this as Aggregation, _$identity);

  /// Serializes this Aggregation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Aggregation&&(identical(other.attributeCode, attributeCode) || other.attributeCode == attributeCode)&&(identical(other.label, label) || other.label == label)&&const DeepCollectionEquality().equals(other.options, options)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,attributeCode,label,const DeepCollectionEquality().hash(options),count);

@override
String toString() {
  return 'Aggregation(attributeCode: $attributeCode, label: $label, options: $options, count: $count)';
}


}

/// @nodoc
abstract mixin class $AggregationCopyWith<$Res>  {
  factory $AggregationCopyWith(Aggregation value, $Res Function(Aggregation) _then) = _$AggregationCopyWithImpl;
@useResult
$Res call({
 String attributeCode, String label, List<AggregationOption> options, int count
});




}
/// @nodoc
class _$AggregationCopyWithImpl<$Res>
    implements $AggregationCopyWith<$Res> {
  _$AggregationCopyWithImpl(this._self, this._then);

  final Aggregation _self;
  final $Res Function(Aggregation) _then;

/// Create a copy of Aggregation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? attributeCode = null,Object? label = null,Object? options = null,Object? count = null,}) {
  return _then(_self.copyWith(
attributeCode: null == attributeCode ? _self.attributeCode : attributeCode // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<AggregationOption>,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Aggregation].
extension AggregationPatterns on Aggregation {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Aggregation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Aggregation() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Aggregation value)  $default,){
final _that = this;
switch (_that) {
case _Aggregation():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Aggregation value)?  $default,){
final _that = this;
switch (_that) {
case _Aggregation() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String attributeCode,  String label,  List<AggregationOption> options,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Aggregation() when $default != null:
return $default(_that.attributeCode,_that.label,_that.options,_that.count);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String attributeCode,  String label,  List<AggregationOption> options,  int count)  $default,) {final _that = this;
switch (_that) {
case _Aggregation():
return $default(_that.attributeCode,_that.label,_that.options,_that.count);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String attributeCode,  String label,  List<AggregationOption> options,  int count)?  $default,) {final _that = this;
switch (_that) {
case _Aggregation() when $default != null:
return $default(_that.attributeCode,_that.label,_that.options,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Aggregation implements Aggregation {
  const _Aggregation({required this.attributeCode, required this.label, required final  List<AggregationOption> options, required this.count}): _options = options;
  factory _Aggregation.fromJson(Map<String, dynamic> json) => _$AggregationFromJson(json);

@override final  String attributeCode;
@override final  String label;
 final  List<AggregationOption> _options;
@override List<AggregationOption> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

@override final  int count;

/// Create a copy of Aggregation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AggregationCopyWith<_Aggregation> get copyWith => __$AggregationCopyWithImpl<_Aggregation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AggregationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Aggregation&&(identical(other.attributeCode, attributeCode) || other.attributeCode == attributeCode)&&(identical(other.label, label) || other.label == label)&&const DeepCollectionEquality().equals(other._options, _options)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,attributeCode,label,const DeepCollectionEquality().hash(_options),count);

@override
String toString() {
  return 'Aggregation(attributeCode: $attributeCode, label: $label, options: $options, count: $count)';
}


}

/// @nodoc
abstract mixin class _$AggregationCopyWith<$Res> implements $AggregationCopyWith<$Res> {
  factory _$AggregationCopyWith(_Aggregation value, $Res Function(_Aggregation) _then) = __$AggregationCopyWithImpl;
@override @useResult
$Res call({
 String attributeCode, String label, List<AggregationOption> options, int count
});




}
/// @nodoc
class __$AggregationCopyWithImpl<$Res>
    implements _$AggregationCopyWith<$Res> {
  __$AggregationCopyWithImpl(this._self, this._then);

  final _Aggregation _self;
  final $Res Function(_Aggregation) _then;

/// Create a copy of Aggregation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? attributeCode = null,Object? label = null,Object? options = null,Object? count = null,}) {
  return _then(_Aggregation(
attributeCode: null == attributeCode ? _self.attributeCode : attributeCode // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<AggregationOption>,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$AggregationOption {

 String get value; String get label; int get count; bool? get isSelected;
/// Create a copy of AggregationOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AggregationOptionCopyWith<AggregationOption> get copyWith => _$AggregationOptionCopyWithImpl<AggregationOption>(this as AggregationOption, _$identity);

  /// Serializes this AggregationOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AggregationOption&&(identical(other.value, value) || other.value == value)&&(identical(other.label, label) || other.label == label)&&(identical(other.count, count) || other.count == count)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,label,count,isSelected);

@override
String toString() {
  return 'AggregationOption(value: $value, label: $label, count: $count, isSelected: $isSelected)';
}


}

/// @nodoc
abstract mixin class $AggregationOptionCopyWith<$Res>  {
  factory $AggregationOptionCopyWith(AggregationOption value, $Res Function(AggregationOption) _then) = _$AggregationOptionCopyWithImpl;
@useResult
$Res call({
 String value, String label, int count, bool? isSelected
});




}
/// @nodoc
class _$AggregationOptionCopyWithImpl<$Res>
    implements $AggregationOptionCopyWith<$Res> {
  _$AggregationOptionCopyWithImpl(this._self, this._then);

  final AggregationOption _self;
  final $Res Function(AggregationOption) _then;

/// Create a copy of AggregationOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? label = null,Object? count = null,Object? isSelected = freezed,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,isSelected: freezed == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [AggregationOption].
extension AggregationOptionPatterns on AggregationOption {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AggregationOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AggregationOption() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AggregationOption value)  $default,){
final _that = this;
switch (_that) {
case _AggregationOption():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AggregationOption value)?  $default,){
final _that = this;
switch (_that) {
case _AggregationOption() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String value,  String label,  int count,  bool? isSelected)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AggregationOption() when $default != null:
return $default(_that.value,_that.label,_that.count,_that.isSelected);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String value,  String label,  int count,  bool? isSelected)  $default,) {final _that = this;
switch (_that) {
case _AggregationOption():
return $default(_that.value,_that.label,_that.count,_that.isSelected);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String value,  String label,  int count,  bool? isSelected)?  $default,) {final _that = this;
switch (_that) {
case _AggregationOption() when $default != null:
return $default(_that.value,_that.label,_that.count,_that.isSelected);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AggregationOption implements AggregationOption {
  const _AggregationOption({required this.value, required this.label, required this.count, this.isSelected});
  factory _AggregationOption.fromJson(Map<String, dynamic> json) => _$AggregationOptionFromJson(json);

@override final  String value;
@override final  String label;
@override final  int count;
@override final  bool? isSelected;

/// Create a copy of AggregationOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AggregationOptionCopyWith<_AggregationOption> get copyWith => __$AggregationOptionCopyWithImpl<_AggregationOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AggregationOptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AggregationOption&&(identical(other.value, value) || other.value == value)&&(identical(other.label, label) || other.label == label)&&(identical(other.count, count) || other.count == count)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,label,count,isSelected);

@override
String toString() {
  return 'AggregationOption(value: $value, label: $label, count: $count, isSelected: $isSelected)';
}


}

/// @nodoc
abstract mixin class _$AggregationOptionCopyWith<$Res> implements $AggregationOptionCopyWith<$Res> {
  factory _$AggregationOptionCopyWith(_AggregationOption value, $Res Function(_AggregationOption) _then) = __$AggregationOptionCopyWithImpl;
@override @useResult
$Res call({
 String value, String label, int count, bool? isSelected
});




}
/// @nodoc
class __$AggregationOptionCopyWithImpl<$Res>
    implements _$AggregationOptionCopyWith<$Res> {
  __$AggregationOptionCopyWithImpl(this._self, this._then);

  final _AggregationOption _self;
  final $Res Function(_AggregationOption) _then;

/// Create a copy of AggregationOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? label = null,Object? count = null,Object? isSelected = freezed,}) {
  return _then(_AggregationOption(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,isSelected: freezed == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$SortOption {

 String get value; String get label; bool? get isSelected;
/// Create a copy of SortOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SortOptionCopyWith<SortOption> get copyWith => _$SortOptionCopyWithImpl<SortOption>(this as SortOption, _$identity);

  /// Serializes this SortOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SortOption&&(identical(other.value, value) || other.value == value)&&(identical(other.label, label) || other.label == label)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,label,isSelected);

@override
String toString() {
  return 'SortOption(value: $value, label: $label, isSelected: $isSelected)';
}


}

/// @nodoc
abstract mixin class $SortOptionCopyWith<$Res>  {
  factory $SortOptionCopyWith(SortOption value, $Res Function(SortOption) _then) = _$SortOptionCopyWithImpl;
@useResult
$Res call({
 String value, String label, bool? isSelected
});




}
/// @nodoc
class _$SortOptionCopyWithImpl<$Res>
    implements $SortOptionCopyWith<$Res> {
  _$SortOptionCopyWithImpl(this._self, this._then);

  final SortOption _self;
  final $Res Function(SortOption) _then;

/// Create a copy of SortOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? label = null,Object? isSelected = freezed,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,isSelected: freezed == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [SortOption].
extension SortOptionPatterns on SortOption {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SortOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SortOption() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SortOption value)  $default,){
final _that = this;
switch (_that) {
case _SortOption():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SortOption value)?  $default,){
final _that = this;
switch (_that) {
case _SortOption() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String value,  String label,  bool? isSelected)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SortOption() when $default != null:
return $default(_that.value,_that.label,_that.isSelected);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String value,  String label,  bool? isSelected)  $default,) {final _that = this;
switch (_that) {
case _SortOption():
return $default(_that.value,_that.label,_that.isSelected);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String value,  String label,  bool? isSelected)?  $default,) {final _that = this;
switch (_that) {
case _SortOption() when $default != null:
return $default(_that.value,_that.label,_that.isSelected);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SortOption implements SortOption {
  const _SortOption({required this.value, required this.label, this.isSelected});
  factory _SortOption.fromJson(Map<String, dynamic> json) => _$SortOptionFromJson(json);

@override final  String value;
@override final  String label;
@override final  bool? isSelected;

/// Create a copy of SortOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SortOptionCopyWith<_SortOption> get copyWith => __$SortOptionCopyWithImpl<_SortOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SortOptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SortOption&&(identical(other.value, value) || other.value == value)&&(identical(other.label, label) || other.label == label)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,label,isSelected);

@override
String toString() {
  return 'SortOption(value: $value, label: $label, isSelected: $isSelected)';
}


}

/// @nodoc
abstract mixin class _$SortOptionCopyWith<$Res> implements $SortOptionCopyWith<$Res> {
  factory _$SortOptionCopyWith(_SortOption value, $Res Function(_SortOption) _then) = __$SortOptionCopyWithImpl;
@override @useResult
$Res call({
 String value, String label, bool? isSelected
});




}
/// @nodoc
class __$SortOptionCopyWithImpl<$Res>
    implements _$SortOptionCopyWith<$Res> {
  __$SortOptionCopyWithImpl(this._self, this._then);

  final _SortOption _self;
  final $Res Function(_SortOption) _then;

/// Create a copy of SortOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? label = null,Object? isSelected = freezed,}) {
  return _then(_SortOption(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,isSelected: freezed == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$CategoryAttribute {

 String get attributeCode; String get value; String? get label;
/// Create a copy of CategoryAttribute
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryAttributeCopyWith<CategoryAttribute> get copyWith => _$CategoryAttributeCopyWithImpl<CategoryAttribute>(this as CategoryAttribute, _$identity);

  /// Serializes this CategoryAttribute to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryAttribute&&(identical(other.attributeCode, attributeCode) || other.attributeCode == attributeCode)&&(identical(other.value, value) || other.value == value)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,attributeCode,value,label);

@override
String toString() {
  return 'CategoryAttribute(attributeCode: $attributeCode, value: $value, label: $label)';
}


}

/// @nodoc
abstract mixin class $CategoryAttributeCopyWith<$Res>  {
  factory $CategoryAttributeCopyWith(CategoryAttribute value, $Res Function(CategoryAttribute) _then) = _$CategoryAttributeCopyWithImpl;
@useResult
$Res call({
 String attributeCode, String value, String? label
});




}
/// @nodoc
class _$CategoryAttributeCopyWithImpl<$Res>
    implements $CategoryAttributeCopyWith<$Res> {
  _$CategoryAttributeCopyWithImpl(this._self, this._then);

  final CategoryAttribute _self;
  final $Res Function(CategoryAttribute) _then;

/// Create a copy of CategoryAttribute
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? attributeCode = null,Object? value = null,Object? label = freezed,}) {
  return _then(_self.copyWith(
attributeCode: null == attributeCode ? _self.attributeCode : attributeCode // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryAttribute].
extension CategoryAttributePatterns on CategoryAttribute {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryAttribute value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryAttribute() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryAttribute value)  $default,){
final _that = this;
switch (_that) {
case _CategoryAttribute():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryAttribute value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryAttribute() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String attributeCode,  String value,  String? label)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryAttribute() when $default != null:
return $default(_that.attributeCode,_that.value,_that.label);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String attributeCode,  String value,  String? label)  $default,) {final _that = this;
switch (_that) {
case _CategoryAttribute():
return $default(_that.attributeCode,_that.value,_that.label);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String attributeCode,  String value,  String? label)?  $default,) {final _that = this;
switch (_that) {
case _CategoryAttribute() when $default != null:
return $default(_that.attributeCode,_that.value,_that.label);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryAttribute implements CategoryAttribute {
  const _CategoryAttribute({required this.attributeCode, required this.value, this.label});
  factory _CategoryAttribute.fromJson(Map<String, dynamic> json) => _$CategoryAttributeFromJson(json);

@override final  String attributeCode;
@override final  String value;
@override final  String? label;

/// Create a copy of CategoryAttribute
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryAttributeCopyWith<_CategoryAttribute> get copyWith => __$CategoryAttributeCopyWithImpl<_CategoryAttribute>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryAttributeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryAttribute&&(identical(other.attributeCode, attributeCode) || other.attributeCode == attributeCode)&&(identical(other.value, value) || other.value == value)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,attributeCode,value,label);

@override
String toString() {
  return 'CategoryAttribute(attributeCode: $attributeCode, value: $value, label: $label)';
}


}

/// @nodoc
abstract mixin class _$CategoryAttributeCopyWith<$Res> implements $CategoryAttributeCopyWith<$Res> {
  factory _$CategoryAttributeCopyWith(_CategoryAttribute value, $Res Function(_CategoryAttribute) _then) = __$CategoryAttributeCopyWithImpl;
@override @useResult
$Res call({
 String attributeCode, String value, String? label
});




}
/// @nodoc
class __$CategoryAttributeCopyWithImpl<$Res>
    implements _$CategoryAttributeCopyWith<$Res> {
  __$CategoryAttributeCopyWithImpl(this._self, this._then);

  final _CategoryAttribute _self;
  final $Res Function(_CategoryAttribute) _then;

/// Create a copy of CategoryAttribute
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? attributeCode = null,Object? value = null,Object? label = freezed,}) {
  return _then(_CategoryAttribute(
attributeCode: null == attributeCode ? _self.attributeCode : attributeCode // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
