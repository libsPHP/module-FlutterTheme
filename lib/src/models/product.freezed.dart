// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Product {

 int get id; String get sku; String get name; String get typeId; double get price; double? get specialPrice; String? get description; String? get shortDescription; List<String>? get images; String? get thumbnail; bool? get isInStock; int? get stockQuantity; String? get weight; List<String>? get categories; List<ProductAttribute>? get attributes; List<ProductOption>? get options; List<ProductVariation>? get variations; Map<String, dynamic>? get customAttributes; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductCopyWith<Product> get copyWith => _$ProductCopyWithImpl<Product>(this as Product, _$identity);

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Product&&(identical(other.id, id) || other.id == id)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.name, name) || other.name == name)&&(identical(other.typeId, typeId) || other.typeId == typeId)&&(identical(other.price, price) || other.price == price)&&(identical(other.specialPrice, specialPrice) || other.specialPrice == specialPrice)&&(identical(other.description, description) || other.description == description)&&(identical(other.shortDescription, shortDescription) || other.shortDescription == shortDescription)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.isInStock, isInStock) || other.isInStock == isInStock)&&(identical(other.stockQuantity, stockQuantity) || other.stockQuantity == stockQuantity)&&(identical(other.weight, weight) || other.weight == weight)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.attributes, attributes)&&const DeepCollectionEquality().equals(other.options, options)&&const DeepCollectionEquality().equals(other.variations, variations)&&const DeepCollectionEquality().equals(other.customAttributes, customAttributes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,sku,name,typeId,price,specialPrice,description,shortDescription,const DeepCollectionEquality().hash(images),thumbnail,isInStock,stockQuantity,weight,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(attributes),const DeepCollectionEquality().hash(options),const DeepCollectionEquality().hash(variations),const DeepCollectionEquality().hash(customAttributes),createdAt,updatedAt]);

@override
String toString() {
  return 'Product(id: $id, sku: $sku, name: $name, typeId: $typeId, price: $price, specialPrice: $specialPrice, description: $description, shortDescription: $shortDescription, images: $images, thumbnail: $thumbnail, isInStock: $isInStock, stockQuantity: $stockQuantity, weight: $weight, categories: $categories, attributes: $attributes, options: $options, variations: $variations, customAttributes: $customAttributes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ProductCopyWith<$Res>  {
  factory $ProductCopyWith(Product value, $Res Function(Product) _then) = _$ProductCopyWithImpl;
@useResult
$Res call({
 int id, String sku, String name, String typeId, double price, double? specialPrice, String? description, String? shortDescription, List<String>? images, String? thumbnail, bool? isInStock, int? stockQuantity, String? weight, List<String>? categories, List<ProductAttribute>? attributes, List<ProductOption>? options, List<ProductVariation>? variations, Map<String, dynamic>? customAttributes, DateTime? createdAt, DateTime? updatedAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sku = null,Object? name = null,Object? typeId = null,Object? price = null,Object? specialPrice = freezed,Object? description = freezed,Object? shortDescription = freezed,Object? images = freezed,Object? thumbnail = freezed,Object? isInStock = freezed,Object? stockQuantity = freezed,Object? weight = freezed,Object? categories = freezed,Object? attributes = freezed,Object? options = freezed,Object? variations = freezed,Object? customAttributes = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,typeId: null == typeId ? _self.typeId : typeId // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,specialPrice: freezed == specialPrice ? _self.specialPrice : specialPrice // ignore: cast_nullable_to_non_nullable
as double?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,shortDescription: freezed == shortDescription ? _self.shortDescription : shortDescription // ignore: cast_nullable_to_non_nullable
as String?,images: freezed == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>?,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,isInStock: freezed == isInStock ? _self.isInStock : isInStock // ignore: cast_nullable_to_non_nullable
as bool?,stockQuantity: freezed == stockQuantity ? _self.stockQuantity : stockQuantity // ignore: cast_nullable_to_non_nullable
as int?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as String?,categories: freezed == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>?,attributes: freezed == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as List<ProductAttribute>?,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<ProductOption>?,variations: freezed == variations ? _self.variations : variations // ignore: cast_nullable_to_non_nullable
as List<ProductVariation>?,customAttributes: freezed == customAttributes ? _self.customAttributes : customAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String sku,  String name,  String typeId,  double price,  double? specialPrice,  String? description,  String? shortDescription,  List<String>? images,  String? thumbnail,  bool? isInStock,  int? stockQuantity,  String? weight,  List<String>? categories,  List<ProductAttribute>? attributes,  List<ProductOption>? options,  List<ProductVariation>? variations,  Map<String, dynamic>? customAttributes,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.id,_that.sku,_that.name,_that.typeId,_that.price,_that.specialPrice,_that.description,_that.shortDescription,_that.images,_that.thumbnail,_that.isInStock,_that.stockQuantity,_that.weight,_that.categories,_that.attributes,_that.options,_that.variations,_that.customAttributes,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String sku,  String name,  String typeId,  double price,  double? specialPrice,  String? description,  String? shortDescription,  List<String>? images,  String? thumbnail,  bool? isInStock,  int? stockQuantity,  String? weight,  List<String>? categories,  List<ProductAttribute>? attributes,  List<ProductOption>? options,  List<ProductVariation>? variations,  Map<String, dynamic>? customAttributes,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Product():
return $default(_that.id,_that.sku,_that.name,_that.typeId,_that.price,_that.specialPrice,_that.description,_that.shortDescription,_that.images,_that.thumbnail,_that.isInStock,_that.stockQuantity,_that.weight,_that.categories,_that.attributes,_that.options,_that.variations,_that.customAttributes,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String sku,  String name,  String typeId,  double price,  double? specialPrice,  String? description,  String? shortDescription,  List<String>? images,  String? thumbnail,  bool? isInStock,  int? stockQuantity,  String? weight,  List<String>? categories,  List<ProductAttribute>? attributes,  List<ProductOption>? options,  List<ProductVariation>? variations,  Map<String, dynamic>? customAttributes,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.id,_that.sku,_that.name,_that.typeId,_that.price,_that.specialPrice,_that.description,_that.shortDescription,_that.images,_that.thumbnail,_that.isInStock,_that.stockQuantity,_that.weight,_that.categories,_that.attributes,_that.options,_that.variations,_that.customAttributes,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Product implements Product {
  const _Product({required this.id, required this.sku, required this.name, required this.typeId, required this.price, this.specialPrice, this.description, this.shortDescription, final  List<String>? images, this.thumbnail, this.isInStock, this.stockQuantity, this.weight, final  List<String>? categories, final  List<ProductAttribute>? attributes, final  List<ProductOption>? options, final  List<ProductVariation>? variations, final  Map<String, dynamic>? customAttributes, this.createdAt, this.updatedAt}): _images = images,_categories = categories,_attributes = attributes,_options = options,_variations = variations,_customAttributes = customAttributes;
  factory _Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

@override final  int id;
@override final  String sku;
@override final  String name;
@override final  String typeId;
@override final  double price;
@override final  double? specialPrice;
@override final  String? description;
@override final  String? shortDescription;
 final  List<String>? _images;
@override List<String>? get images {
  final value = _images;
  if (value == null) return null;
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? thumbnail;
@override final  bool? isInStock;
@override final  int? stockQuantity;
@override final  String? weight;
 final  List<String>? _categories;
@override List<String>? get categories {
  final value = _categories;
  if (value == null) return null;
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<ProductAttribute>? _attributes;
@override List<ProductAttribute>? get attributes {
  final value = _attributes;
  if (value == null) return null;
  if (_attributes is EqualUnmodifiableListView) return _attributes;
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

 final  List<ProductVariation>? _variations;
@override List<ProductVariation>? get variations {
  final value = _variations;
  if (value == null) return null;
  if (_variations is EqualUnmodifiableListView) return _variations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  Map<String, dynamic>? _customAttributes;
@override Map<String, dynamic>? get customAttributes {
  final value = _customAttributes;
  if (value == null) return null;
  if (_customAttributes is EqualUnmodifiableMapView) return _customAttributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Product&&(identical(other.id, id) || other.id == id)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.name, name) || other.name == name)&&(identical(other.typeId, typeId) || other.typeId == typeId)&&(identical(other.price, price) || other.price == price)&&(identical(other.specialPrice, specialPrice) || other.specialPrice == specialPrice)&&(identical(other.description, description) || other.description == description)&&(identical(other.shortDescription, shortDescription) || other.shortDescription == shortDescription)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.isInStock, isInStock) || other.isInStock == isInStock)&&(identical(other.stockQuantity, stockQuantity) || other.stockQuantity == stockQuantity)&&(identical(other.weight, weight) || other.weight == weight)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._attributes, _attributes)&&const DeepCollectionEquality().equals(other._options, _options)&&const DeepCollectionEquality().equals(other._variations, _variations)&&const DeepCollectionEquality().equals(other._customAttributes, _customAttributes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,sku,name,typeId,price,specialPrice,description,shortDescription,const DeepCollectionEquality().hash(_images),thumbnail,isInStock,stockQuantity,weight,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_attributes),const DeepCollectionEquality().hash(_options),const DeepCollectionEquality().hash(_variations),const DeepCollectionEquality().hash(_customAttributes),createdAt,updatedAt]);

@override
String toString() {
  return 'Product(id: $id, sku: $sku, name: $name, typeId: $typeId, price: $price, specialPrice: $specialPrice, description: $description, shortDescription: $shortDescription, images: $images, thumbnail: $thumbnail, isInStock: $isInStock, stockQuantity: $stockQuantity, weight: $weight, categories: $categories, attributes: $attributes, options: $options, variations: $variations, customAttributes: $customAttributes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) _then) = __$ProductCopyWithImpl;
@override @useResult
$Res call({
 int id, String sku, String name, String typeId, double price, double? specialPrice, String? description, String? shortDescription, List<String>? images, String? thumbnail, bool? isInStock, int? stockQuantity, String? weight, List<String>? categories, List<ProductAttribute>? attributes, List<ProductOption>? options, List<ProductVariation>? variations, Map<String, dynamic>? customAttributes, DateTime? createdAt, DateTime? updatedAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sku = null,Object? name = null,Object? typeId = null,Object? price = null,Object? specialPrice = freezed,Object? description = freezed,Object? shortDescription = freezed,Object? images = freezed,Object? thumbnail = freezed,Object? isInStock = freezed,Object? stockQuantity = freezed,Object? weight = freezed,Object? categories = freezed,Object? attributes = freezed,Object? options = freezed,Object? variations = freezed,Object? customAttributes = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Product(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,typeId: null == typeId ? _self.typeId : typeId // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,specialPrice: freezed == specialPrice ? _self.specialPrice : specialPrice // ignore: cast_nullable_to_non_nullable
as double?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,shortDescription: freezed == shortDescription ? _self.shortDescription : shortDescription // ignore: cast_nullable_to_non_nullable
as String?,images: freezed == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>?,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,isInStock: freezed == isInStock ? _self.isInStock : isInStock // ignore: cast_nullable_to_non_nullable
as bool?,stockQuantity: freezed == stockQuantity ? _self.stockQuantity : stockQuantity // ignore: cast_nullable_to_non_nullable
as int?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as String?,categories: freezed == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>?,attributes: freezed == attributes ? _self._attributes : attributes // ignore: cast_nullable_to_non_nullable
as List<ProductAttribute>?,options: freezed == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<ProductOption>?,variations: freezed == variations ? _self._variations : variations // ignore: cast_nullable_to_non_nullable
as List<ProductVariation>?,customAttributes: freezed == customAttributes ? _self._customAttributes : customAttributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$ProductAttribute {

 String get code; String get label; String get value; String? get type; bool? get isRequired; bool? get isVisible; List<String>? get options;
/// Create a copy of ProductAttribute
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductAttributeCopyWith<ProductAttribute> get copyWith => _$ProductAttributeCopyWithImpl<ProductAttribute>(this as ProductAttribute, _$identity);

  /// Serializes this ProductAttribute to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductAttribute&&(identical(other.code, code) || other.code == code)&&(identical(other.label, label) || other.label == label)&&(identical(other.value, value) || other.value == value)&&(identical(other.type, type) || other.type == type)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.isVisible, isVisible) || other.isVisible == isVisible)&&const DeepCollectionEquality().equals(other.options, options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,label,value,type,isRequired,isVisible,const DeepCollectionEquality().hash(options));

@override
String toString() {
  return 'ProductAttribute(code: $code, label: $label, value: $value, type: $type, isRequired: $isRequired, isVisible: $isVisible, options: $options)';
}


}

/// @nodoc
abstract mixin class $ProductAttributeCopyWith<$Res>  {
  factory $ProductAttributeCopyWith(ProductAttribute value, $Res Function(ProductAttribute) _then) = _$ProductAttributeCopyWithImpl;
@useResult
$Res call({
 String code, String label, String value, String? type, bool? isRequired, bool? isVisible, List<String>? options
});




}
/// @nodoc
class _$ProductAttributeCopyWithImpl<$Res>
    implements $ProductAttributeCopyWith<$Res> {
  _$ProductAttributeCopyWithImpl(this._self, this._then);

  final ProductAttribute _self;
  final $Res Function(ProductAttribute) _then;

/// Create a copy of ProductAttribute
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? label = null,Object? value = null,Object? type = freezed,Object? isRequired = freezed,Object? isVisible = freezed,Object? options = freezed,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,isRequired: freezed == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool?,isVisible: freezed == isVisible ? _self.isVisible : isVisible // ignore: cast_nullable_to_non_nullable
as bool?,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductAttribute].
extension ProductAttributePatterns on ProductAttribute {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductAttribute value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductAttribute() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductAttribute value)  $default,){
final _that = this;
switch (_that) {
case _ProductAttribute():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductAttribute value)?  $default,){
final _that = this;
switch (_that) {
case _ProductAttribute() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String label,  String value,  String? type,  bool? isRequired,  bool? isVisible,  List<String>? options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductAttribute() when $default != null:
return $default(_that.code,_that.label,_that.value,_that.type,_that.isRequired,_that.isVisible,_that.options);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String label,  String value,  String? type,  bool? isRequired,  bool? isVisible,  List<String>? options)  $default,) {final _that = this;
switch (_that) {
case _ProductAttribute():
return $default(_that.code,_that.label,_that.value,_that.type,_that.isRequired,_that.isVisible,_that.options);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String label,  String value,  String? type,  bool? isRequired,  bool? isVisible,  List<String>? options)?  $default,) {final _that = this;
switch (_that) {
case _ProductAttribute() when $default != null:
return $default(_that.code,_that.label,_that.value,_that.type,_that.isRequired,_that.isVisible,_that.options);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductAttribute implements ProductAttribute {
  const _ProductAttribute({required this.code, required this.label, required this.value, this.type, this.isRequired, this.isVisible, final  List<String>? options}): _options = options;
  factory _ProductAttribute.fromJson(Map<String, dynamic> json) => _$ProductAttributeFromJson(json);

@override final  String code;
@override final  String label;
@override final  String value;
@override final  String? type;
@override final  bool? isRequired;
@override final  bool? isVisible;
 final  List<String>? _options;
@override List<String>? get options {
  final value = _options;
  if (value == null) return null;
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ProductAttribute
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductAttributeCopyWith<_ProductAttribute> get copyWith => __$ProductAttributeCopyWithImpl<_ProductAttribute>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductAttributeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductAttribute&&(identical(other.code, code) || other.code == code)&&(identical(other.label, label) || other.label == label)&&(identical(other.value, value) || other.value == value)&&(identical(other.type, type) || other.type == type)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.isVisible, isVisible) || other.isVisible == isVisible)&&const DeepCollectionEquality().equals(other._options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,label,value,type,isRequired,isVisible,const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'ProductAttribute(code: $code, label: $label, value: $value, type: $type, isRequired: $isRequired, isVisible: $isVisible, options: $options)';
}


}

/// @nodoc
abstract mixin class _$ProductAttributeCopyWith<$Res> implements $ProductAttributeCopyWith<$Res> {
  factory _$ProductAttributeCopyWith(_ProductAttribute value, $Res Function(_ProductAttribute) _then) = __$ProductAttributeCopyWithImpl;
@override @useResult
$Res call({
 String code, String label, String value, String? type, bool? isRequired, bool? isVisible, List<String>? options
});




}
/// @nodoc
class __$ProductAttributeCopyWithImpl<$Res>
    implements _$ProductAttributeCopyWith<$Res> {
  __$ProductAttributeCopyWithImpl(this._self, this._then);

  final _ProductAttribute _self;
  final $Res Function(_ProductAttribute) _then;

/// Create a copy of ProductAttribute
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? label = null,Object? value = null,Object? type = freezed,Object? isRequired = freezed,Object? isVisible = freezed,Object? options = freezed,}) {
  return _then(_ProductAttribute(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,isRequired: freezed == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool?,isVisible: freezed == isVisible ? _self.isVisible : isVisible // ignore: cast_nullable_to_non_nullable
as bool?,options: freezed == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}


/// @nodoc
mixin _$ProductOption {

 int get id; String get label; String get type; bool? get isRequired; double? get price; String? get priceType; List<String>? get values; int? get sortOrder;
/// Create a copy of ProductOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductOptionCopyWith<ProductOption> get copyWith => _$ProductOptionCopyWithImpl<ProductOption>(this as ProductOption, _$identity);

  /// Serializes this ProductOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductOption&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.type, type) || other.type == type)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceType, priceType) || other.priceType == priceType)&&const DeepCollectionEquality().equals(other.values, values)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,type,isRequired,price,priceType,const DeepCollectionEquality().hash(values),sortOrder);

@override
String toString() {
  return 'ProductOption(id: $id, label: $label, type: $type, isRequired: $isRequired, price: $price, priceType: $priceType, values: $values, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class $ProductOptionCopyWith<$Res>  {
  factory $ProductOptionCopyWith(ProductOption value, $Res Function(ProductOption) _then) = _$ProductOptionCopyWithImpl;
@useResult
$Res call({
 int id, String label, String type, bool? isRequired, double? price, String? priceType, List<String>? values, int? sortOrder
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,Object? type = null,Object? isRequired = freezed,Object? price = freezed,Object? priceType = freezed,Object? values = freezed,Object? sortOrder = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isRequired: freezed == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,priceType: freezed == priceType ? _self.priceType : priceType // ignore: cast_nullable_to_non_nullable
as String?,values: freezed == values ? _self.values : values // ignore: cast_nullable_to_non_nullable
as List<String>?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String label,  String type,  bool? isRequired,  double? price,  String? priceType,  List<String>? values,  int? sortOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductOption() when $default != null:
return $default(_that.id,_that.label,_that.type,_that.isRequired,_that.price,_that.priceType,_that.values,_that.sortOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String label,  String type,  bool? isRequired,  double? price,  String? priceType,  List<String>? values,  int? sortOrder)  $default,) {final _that = this;
switch (_that) {
case _ProductOption():
return $default(_that.id,_that.label,_that.type,_that.isRequired,_that.price,_that.priceType,_that.values,_that.sortOrder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String label,  String type,  bool? isRequired,  double? price,  String? priceType,  List<String>? values,  int? sortOrder)?  $default,) {final _that = this;
switch (_that) {
case _ProductOption() when $default != null:
return $default(_that.id,_that.label,_that.type,_that.isRequired,_that.price,_that.priceType,_that.values,_that.sortOrder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductOption implements ProductOption {
  const _ProductOption({required this.id, required this.label, required this.type, this.isRequired, this.price, this.priceType, final  List<String>? values, this.sortOrder}): _values = values;
  factory _ProductOption.fromJson(Map<String, dynamic> json) => _$ProductOptionFromJson(json);

@override final  int id;
@override final  String label;
@override final  String type;
@override final  bool? isRequired;
@override final  double? price;
@override final  String? priceType;
 final  List<String>? _values;
@override List<String>? get values {
  final value = _values;
  if (value == null) return null;
  if (_values is EqualUnmodifiableListView) return _values;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? sortOrder;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductOption&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.type, type) || other.type == type)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceType, priceType) || other.priceType == priceType)&&const DeepCollectionEquality().equals(other._values, _values)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,type,isRequired,price,priceType,const DeepCollectionEquality().hash(_values),sortOrder);

@override
String toString() {
  return 'ProductOption(id: $id, label: $label, type: $type, isRequired: $isRequired, price: $price, priceType: $priceType, values: $values, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class _$ProductOptionCopyWith<$Res> implements $ProductOptionCopyWith<$Res> {
  factory _$ProductOptionCopyWith(_ProductOption value, $Res Function(_ProductOption) _then) = __$ProductOptionCopyWithImpl;
@override @useResult
$Res call({
 int id, String label, String type, bool? isRequired, double? price, String? priceType, List<String>? values, int? sortOrder
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? type = null,Object? isRequired = freezed,Object? price = freezed,Object? priceType = freezed,Object? values = freezed,Object? sortOrder = freezed,}) {
  return _then(_ProductOption(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isRequired: freezed == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,priceType: freezed == priceType ? _self.priceType : priceType // ignore: cast_nullable_to_non_nullable
as String?,values: freezed == values ? _self._values : values // ignore: cast_nullable_to_non_nullable
as List<String>?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$ProductVariation {

 int get id; String get sku; double get price; List<String>? get images; Map<String, String>? get attributes; bool? get isInStock; int? get stockQuantity;
/// Create a copy of ProductVariation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductVariationCopyWith<ProductVariation> get copyWith => _$ProductVariationCopyWithImpl<ProductVariation>(this as ProductVariation, _$identity);

  /// Serializes this ProductVariation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductVariation&&(identical(other.id, id) || other.id == id)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.price, price) || other.price == price)&&const DeepCollectionEquality().equals(other.images, images)&&const DeepCollectionEquality().equals(other.attributes, attributes)&&(identical(other.isInStock, isInStock) || other.isInStock == isInStock)&&(identical(other.stockQuantity, stockQuantity) || other.stockQuantity == stockQuantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sku,price,const DeepCollectionEquality().hash(images),const DeepCollectionEquality().hash(attributes),isInStock,stockQuantity);

@override
String toString() {
  return 'ProductVariation(id: $id, sku: $sku, price: $price, images: $images, attributes: $attributes, isInStock: $isInStock, stockQuantity: $stockQuantity)';
}


}

/// @nodoc
abstract mixin class $ProductVariationCopyWith<$Res>  {
  factory $ProductVariationCopyWith(ProductVariation value, $Res Function(ProductVariation) _then) = _$ProductVariationCopyWithImpl;
@useResult
$Res call({
 int id, String sku, double price, List<String>? images, Map<String, String>? attributes, bool? isInStock, int? stockQuantity
});




}
/// @nodoc
class _$ProductVariationCopyWithImpl<$Res>
    implements $ProductVariationCopyWith<$Res> {
  _$ProductVariationCopyWithImpl(this._self, this._then);

  final ProductVariation _self;
  final $Res Function(ProductVariation) _then;

/// Create a copy of ProductVariation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sku = null,Object? price = null,Object? images = freezed,Object? attributes = freezed,Object? isInStock = freezed,Object? stockQuantity = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,images: freezed == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>?,attributes: freezed == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,isInStock: freezed == isInStock ? _self.isInStock : isInStock // ignore: cast_nullable_to_non_nullable
as bool?,stockQuantity: freezed == stockQuantity ? _self.stockQuantity : stockQuantity // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductVariation].
extension ProductVariationPatterns on ProductVariation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductVariation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductVariation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductVariation value)  $default,){
final _that = this;
switch (_that) {
case _ProductVariation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductVariation value)?  $default,){
final _that = this;
switch (_that) {
case _ProductVariation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String sku,  double price,  List<String>? images,  Map<String, String>? attributes,  bool? isInStock,  int? stockQuantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductVariation() when $default != null:
return $default(_that.id,_that.sku,_that.price,_that.images,_that.attributes,_that.isInStock,_that.stockQuantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String sku,  double price,  List<String>? images,  Map<String, String>? attributes,  bool? isInStock,  int? stockQuantity)  $default,) {final _that = this;
switch (_that) {
case _ProductVariation():
return $default(_that.id,_that.sku,_that.price,_that.images,_that.attributes,_that.isInStock,_that.stockQuantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String sku,  double price,  List<String>? images,  Map<String, String>? attributes,  bool? isInStock,  int? stockQuantity)?  $default,) {final _that = this;
switch (_that) {
case _ProductVariation() when $default != null:
return $default(_that.id,_that.sku,_that.price,_that.images,_that.attributes,_that.isInStock,_that.stockQuantity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductVariation implements ProductVariation {
  const _ProductVariation({required this.id, required this.sku, required this.price, final  List<String>? images, final  Map<String, String>? attributes, this.isInStock, this.stockQuantity}): _images = images,_attributes = attributes;
  factory _ProductVariation.fromJson(Map<String, dynamic> json) => _$ProductVariationFromJson(json);

@override final  int id;
@override final  String sku;
@override final  double price;
 final  List<String>? _images;
@override List<String>? get images {
  final value = _images;
  if (value == null) return null;
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  Map<String, String>? _attributes;
@override Map<String, String>? get attributes {
  final value = _attributes;
  if (value == null) return null;
  if (_attributes is EqualUnmodifiableMapView) return _attributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  bool? isInStock;
@override final  int? stockQuantity;

/// Create a copy of ProductVariation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductVariationCopyWith<_ProductVariation> get copyWith => __$ProductVariationCopyWithImpl<_ProductVariation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductVariationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductVariation&&(identical(other.id, id) || other.id == id)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.price, price) || other.price == price)&&const DeepCollectionEquality().equals(other._images, _images)&&const DeepCollectionEquality().equals(other._attributes, _attributes)&&(identical(other.isInStock, isInStock) || other.isInStock == isInStock)&&(identical(other.stockQuantity, stockQuantity) || other.stockQuantity == stockQuantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sku,price,const DeepCollectionEquality().hash(_images),const DeepCollectionEquality().hash(_attributes),isInStock,stockQuantity);

@override
String toString() {
  return 'ProductVariation(id: $id, sku: $sku, price: $price, images: $images, attributes: $attributes, isInStock: $isInStock, stockQuantity: $stockQuantity)';
}


}

/// @nodoc
abstract mixin class _$ProductVariationCopyWith<$Res> implements $ProductVariationCopyWith<$Res> {
  factory _$ProductVariationCopyWith(_ProductVariation value, $Res Function(_ProductVariation) _then) = __$ProductVariationCopyWithImpl;
@override @useResult
$Res call({
 int id, String sku, double price, List<String>? images, Map<String, String>? attributes, bool? isInStock, int? stockQuantity
});




}
/// @nodoc
class __$ProductVariationCopyWithImpl<$Res>
    implements _$ProductVariationCopyWith<$Res> {
  __$ProductVariationCopyWithImpl(this._self, this._then);

  final _ProductVariation _self;
  final $Res Function(_ProductVariation) _then;

/// Create a copy of ProductVariation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sku = null,Object? price = null,Object? images = freezed,Object? attributes = freezed,Object? isInStock = freezed,Object? stockQuantity = freezed,}) {
  return _then(_ProductVariation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,images: freezed == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>?,attributes: freezed == attributes ? _self._attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,isInStock: freezed == isInStock ? _self.isInStock : isInStock // ignore: cast_nullable_to_non_nullable
as bool?,stockQuantity: freezed == stockQuantity ? _self.stockQuantity : stockQuantity // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
