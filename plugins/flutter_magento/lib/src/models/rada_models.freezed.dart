// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rada_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RadaManifest {

 String get version; String get format; DateTime get createdAt; String get createdBy; RadaSource get source; RadaStats get stats; RadaChecksums get checksums;
/// Create a copy of RadaManifest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RadaManifestCopyWith<RadaManifest> get copyWith => _$RadaManifestCopyWithImpl<RadaManifest>(this as RadaManifest, _$identity);

  /// Serializes this RadaManifest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RadaManifest&&(identical(other.version, version) || other.version == version)&&(identical(other.format, format) || other.format == format)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.source, source) || other.source == source)&&(identical(other.stats, stats) || other.stats == stats)&&(identical(other.checksums, checksums) || other.checksums == checksums));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version,format,createdAt,createdBy,source,stats,checksums);

@override
String toString() {
  return 'RadaManifest(version: $version, format: $format, createdAt: $createdAt, createdBy: $createdBy, source: $source, stats: $stats, checksums: $checksums)';
}


}

/// @nodoc
abstract mixin class $RadaManifestCopyWith<$Res>  {
  factory $RadaManifestCopyWith(RadaManifest value, $Res Function(RadaManifest) _then) = _$RadaManifestCopyWithImpl;
@useResult
$Res call({
 String version, String format, DateTime createdAt, String createdBy, RadaSource source, RadaStats stats, RadaChecksums checksums
});


$RadaSourceCopyWith<$Res> get source;$RadaStatsCopyWith<$Res> get stats;$RadaChecksumsCopyWith<$Res> get checksums;

}
/// @nodoc
class _$RadaManifestCopyWithImpl<$Res>
    implements $RadaManifestCopyWith<$Res> {
  _$RadaManifestCopyWithImpl(this._self, this._then);

  final RadaManifest _self;
  final $Res Function(RadaManifest) _then;

/// Create a copy of RadaManifest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? version = null,Object? format = null,Object? createdAt = null,Object? createdBy = null,Object? source = null,Object? stats = null,Object? checksums = null,}) {
  return _then(_self.copyWith(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as RadaSource,stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as RadaStats,checksums: null == checksums ? _self.checksums : checksums // ignore: cast_nullable_to_non_nullable
as RadaChecksums,
  ));
}
/// Create a copy of RadaManifest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RadaSourceCopyWith<$Res> get source {
  
  return $RadaSourceCopyWith<$Res>(_self.source, (value) {
    return _then(_self.copyWith(source: value));
  });
}/// Create a copy of RadaManifest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RadaStatsCopyWith<$Res> get stats {
  
  return $RadaStatsCopyWith<$Res>(_self.stats, (value) {
    return _then(_self.copyWith(stats: value));
  });
}/// Create a copy of RadaManifest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RadaChecksumsCopyWith<$Res> get checksums {
  
  return $RadaChecksumsCopyWith<$Res>(_self.checksums, (value) {
    return _then(_self.copyWith(checksums: value));
  });
}
}


/// Adds pattern-matching-related methods to [RadaManifest].
extension RadaManifestPatterns on RadaManifest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RadaManifest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RadaManifest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RadaManifest value)  $default,){
final _that = this;
switch (_that) {
case _RadaManifest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RadaManifest value)?  $default,){
final _that = this;
switch (_that) {
case _RadaManifest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String version,  String format,  DateTime createdAt,  String createdBy,  RadaSource source,  RadaStats stats,  RadaChecksums checksums)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RadaManifest() when $default != null:
return $default(_that.version,_that.format,_that.createdAt,_that.createdBy,_that.source,_that.stats,_that.checksums);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String version,  String format,  DateTime createdAt,  String createdBy,  RadaSource source,  RadaStats stats,  RadaChecksums checksums)  $default,) {final _that = this;
switch (_that) {
case _RadaManifest():
return $default(_that.version,_that.format,_that.createdAt,_that.createdBy,_that.source,_that.stats,_that.checksums);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String version,  String format,  DateTime createdAt,  String createdBy,  RadaSource source,  RadaStats stats,  RadaChecksums checksums)?  $default,) {final _that = this;
switch (_that) {
case _RadaManifest() when $default != null:
return $default(_that.version,_that.format,_that.createdAt,_that.createdBy,_that.source,_that.stats,_that.checksums);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RadaManifest implements RadaManifest {
  const _RadaManifest({required this.version, required this.format, required this.createdAt, required this.createdBy, required this.source, required this.stats, required this.checksums});
  factory _RadaManifest.fromJson(Map<String, dynamic> json) => _$RadaManifestFromJson(json);

@override final  String version;
@override final  String format;
@override final  DateTime createdAt;
@override final  String createdBy;
@override final  RadaSource source;
@override final  RadaStats stats;
@override final  RadaChecksums checksums;

/// Create a copy of RadaManifest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RadaManifestCopyWith<_RadaManifest> get copyWith => __$RadaManifestCopyWithImpl<_RadaManifest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RadaManifestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RadaManifest&&(identical(other.version, version) || other.version == version)&&(identical(other.format, format) || other.format == format)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.source, source) || other.source == source)&&(identical(other.stats, stats) || other.stats == stats)&&(identical(other.checksums, checksums) || other.checksums == checksums));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version,format,createdAt,createdBy,source,stats,checksums);

@override
String toString() {
  return 'RadaManifest(version: $version, format: $format, createdAt: $createdAt, createdBy: $createdBy, source: $source, stats: $stats, checksums: $checksums)';
}


}

/// @nodoc
abstract mixin class _$RadaManifestCopyWith<$Res> implements $RadaManifestCopyWith<$Res> {
  factory _$RadaManifestCopyWith(_RadaManifest value, $Res Function(_RadaManifest) _then) = __$RadaManifestCopyWithImpl;
@override @useResult
$Res call({
 String version, String format, DateTime createdAt, String createdBy, RadaSource source, RadaStats stats, RadaChecksums checksums
});


@override $RadaSourceCopyWith<$Res> get source;@override $RadaStatsCopyWith<$Res> get stats;@override $RadaChecksumsCopyWith<$Res> get checksums;

}
/// @nodoc
class __$RadaManifestCopyWithImpl<$Res>
    implements _$RadaManifestCopyWith<$Res> {
  __$RadaManifestCopyWithImpl(this._self, this._then);

  final _RadaManifest _self;
  final $Res Function(_RadaManifest) _then;

/// Create a copy of RadaManifest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? version = null,Object? format = null,Object? createdAt = null,Object? createdBy = null,Object? source = null,Object? stats = null,Object? checksums = null,}) {
  return _then(_RadaManifest(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as RadaSource,stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as RadaStats,checksums: null == checksums ? _self.checksums : checksums // ignore: cast_nullable_to_non_nullable
as RadaChecksums,
  ));
}

/// Create a copy of RadaManifest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RadaSourceCopyWith<$Res> get source {
  
  return $RadaSourceCopyWith<$Res>(_self.source, (value) {
    return _then(_self.copyWith(source: value));
  });
}/// Create a copy of RadaManifest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RadaStatsCopyWith<$Res> get stats {
  
  return $RadaStatsCopyWith<$Res>(_self.stats, (value) {
    return _then(_self.copyWith(stats: value));
  });
}/// Create a copy of RadaManifest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RadaChecksumsCopyWith<$Res> get checksums {
  
  return $RadaChecksumsCopyWith<$Res>(_self.checksums, (value) {
    return _then(_self.copyWith(checksums: value));
  });
}
}


/// @nodoc
mixin _$RadaSource {

 String get storeUrl; int get categoryId; String get categoryName; String? get storeCode; String? get storeView;
/// Create a copy of RadaSource
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RadaSourceCopyWith<RadaSource> get copyWith => _$RadaSourceCopyWithImpl<RadaSource>(this as RadaSource, _$identity);

  /// Serializes this RadaSource to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RadaSource&&(identical(other.storeUrl, storeUrl) || other.storeUrl == storeUrl)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.storeCode, storeCode) || other.storeCode == storeCode)&&(identical(other.storeView, storeView) || other.storeView == storeView));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,storeUrl,categoryId,categoryName,storeCode,storeView);

@override
String toString() {
  return 'RadaSource(storeUrl: $storeUrl, categoryId: $categoryId, categoryName: $categoryName, storeCode: $storeCode, storeView: $storeView)';
}


}

/// @nodoc
abstract mixin class $RadaSourceCopyWith<$Res>  {
  factory $RadaSourceCopyWith(RadaSource value, $Res Function(RadaSource) _then) = _$RadaSourceCopyWithImpl;
@useResult
$Res call({
 String storeUrl, int categoryId, String categoryName, String? storeCode, String? storeView
});




}
/// @nodoc
class _$RadaSourceCopyWithImpl<$Res>
    implements $RadaSourceCopyWith<$Res> {
  _$RadaSourceCopyWithImpl(this._self, this._then);

  final RadaSource _self;
  final $Res Function(RadaSource) _then;

/// Create a copy of RadaSource
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? storeUrl = null,Object? categoryId = null,Object? categoryName = null,Object? storeCode = freezed,Object? storeView = freezed,}) {
  return _then(_self.copyWith(
storeUrl: null == storeUrl ? _self.storeUrl : storeUrl // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,storeCode: freezed == storeCode ? _self.storeCode : storeCode // ignore: cast_nullable_to_non_nullable
as String?,storeView: freezed == storeView ? _self.storeView : storeView // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RadaSource].
extension RadaSourcePatterns on RadaSource {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RadaSource value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RadaSource() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RadaSource value)  $default,){
final _that = this;
switch (_that) {
case _RadaSource():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RadaSource value)?  $default,){
final _that = this;
switch (_that) {
case _RadaSource() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String storeUrl,  int categoryId,  String categoryName,  String? storeCode,  String? storeView)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RadaSource() when $default != null:
return $default(_that.storeUrl,_that.categoryId,_that.categoryName,_that.storeCode,_that.storeView);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String storeUrl,  int categoryId,  String categoryName,  String? storeCode,  String? storeView)  $default,) {final _that = this;
switch (_that) {
case _RadaSource():
return $default(_that.storeUrl,_that.categoryId,_that.categoryName,_that.storeCode,_that.storeView);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String storeUrl,  int categoryId,  String categoryName,  String? storeCode,  String? storeView)?  $default,) {final _that = this;
switch (_that) {
case _RadaSource() when $default != null:
return $default(_that.storeUrl,_that.categoryId,_that.categoryName,_that.storeCode,_that.storeView);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RadaSource implements RadaSource {
  const _RadaSource({required this.storeUrl, required this.categoryId, required this.categoryName, this.storeCode, this.storeView});
  factory _RadaSource.fromJson(Map<String, dynamic> json) => _$RadaSourceFromJson(json);

@override final  String storeUrl;
@override final  int categoryId;
@override final  String categoryName;
@override final  String? storeCode;
@override final  String? storeView;

/// Create a copy of RadaSource
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RadaSourceCopyWith<_RadaSource> get copyWith => __$RadaSourceCopyWithImpl<_RadaSource>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RadaSourceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RadaSource&&(identical(other.storeUrl, storeUrl) || other.storeUrl == storeUrl)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.storeCode, storeCode) || other.storeCode == storeCode)&&(identical(other.storeView, storeView) || other.storeView == storeView));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,storeUrl,categoryId,categoryName,storeCode,storeView);

@override
String toString() {
  return 'RadaSource(storeUrl: $storeUrl, categoryId: $categoryId, categoryName: $categoryName, storeCode: $storeCode, storeView: $storeView)';
}


}

/// @nodoc
abstract mixin class _$RadaSourceCopyWith<$Res> implements $RadaSourceCopyWith<$Res> {
  factory _$RadaSourceCopyWith(_RadaSource value, $Res Function(_RadaSource) _then) = __$RadaSourceCopyWithImpl;
@override @useResult
$Res call({
 String storeUrl, int categoryId, String categoryName, String? storeCode, String? storeView
});




}
/// @nodoc
class __$RadaSourceCopyWithImpl<$Res>
    implements _$RadaSourceCopyWith<$Res> {
  __$RadaSourceCopyWithImpl(this._self, this._then);

  final _RadaSource _self;
  final $Res Function(_RadaSource) _then;

/// Create a copy of RadaSource
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? storeUrl = null,Object? categoryId = null,Object? categoryName = null,Object? storeCode = freezed,Object? storeView = freezed,}) {
  return _then(_RadaSource(
storeUrl: null == storeUrl ? _self.storeUrl : storeUrl // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,storeCode: freezed == storeCode ? _self.storeCode : storeCode // ignore: cast_nullable_to_non_nullable
as String?,storeView: freezed == storeView ? _self.storeView : storeView // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$RadaStats {

 int get categoriesCount; int get productsCount; int get imagesCount; int get reviewsCount; int get localesCount; int? get totalSize;
/// Create a copy of RadaStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RadaStatsCopyWith<RadaStats> get copyWith => _$RadaStatsCopyWithImpl<RadaStats>(this as RadaStats, _$identity);

  /// Serializes this RadaStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RadaStats&&(identical(other.categoriesCount, categoriesCount) || other.categoriesCount == categoriesCount)&&(identical(other.productsCount, productsCount) || other.productsCount == productsCount)&&(identical(other.imagesCount, imagesCount) || other.imagesCount == imagesCount)&&(identical(other.reviewsCount, reviewsCount) || other.reviewsCount == reviewsCount)&&(identical(other.localesCount, localesCount) || other.localesCount == localesCount)&&(identical(other.totalSize, totalSize) || other.totalSize == totalSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoriesCount,productsCount,imagesCount,reviewsCount,localesCount,totalSize);

@override
String toString() {
  return 'RadaStats(categoriesCount: $categoriesCount, productsCount: $productsCount, imagesCount: $imagesCount, reviewsCount: $reviewsCount, localesCount: $localesCount, totalSize: $totalSize)';
}


}

/// @nodoc
abstract mixin class $RadaStatsCopyWith<$Res>  {
  factory $RadaStatsCopyWith(RadaStats value, $Res Function(RadaStats) _then) = _$RadaStatsCopyWithImpl;
@useResult
$Res call({
 int categoriesCount, int productsCount, int imagesCount, int reviewsCount, int localesCount, int? totalSize
});




}
/// @nodoc
class _$RadaStatsCopyWithImpl<$Res>
    implements $RadaStatsCopyWith<$Res> {
  _$RadaStatsCopyWithImpl(this._self, this._then);

  final RadaStats _self;
  final $Res Function(RadaStats) _then;

/// Create a copy of RadaStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categoriesCount = null,Object? productsCount = null,Object? imagesCount = null,Object? reviewsCount = null,Object? localesCount = null,Object? totalSize = freezed,}) {
  return _then(_self.copyWith(
categoriesCount: null == categoriesCount ? _self.categoriesCount : categoriesCount // ignore: cast_nullable_to_non_nullable
as int,productsCount: null == productsCount ? _self.productsCount : productsCount // ignore: cast_nullable_to_non_nullable
as int,imagesCount: null == imagesCount ? _self.imagesCount : imagesCount // ignore: cast_nullable_to_non_nullable
as int,reviewsCount: null == reviewsCount ? _self.reviewsCount : reviewsCount // ignore: cast_nullable_to_non_nullable
as int,localesCount: null == localesCount ? _self.localesCount : localesCount // ignore: cast_nullable_to_non_nullable
as int,totalSize: freezed == totalSize ? _self.totalSize : totalSize // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [RadaStats].
extension RadaStatsPatterns on RadaStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RadaStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RadaStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RadaStats value)  $default,){
final _that = this;
switch (_that) {
case _RadaStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RadaStats value)?  $default,){
final _that = this;
switch (_that) {
case _RadaStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int categoriesCount,  int productsCount,  int imagesCount,  int reviewsCount,  int localesCount,  int? totalSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RadaStats() when $default != null:
return $default(_that.categoriesCount,_that.productsCount,_that.imagesCount,_that.reviewsCount,_that.localesCount,_that.totalSize);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int categoriesCount,  int productsCount,  int imagesCount,  int reviewsCount,  int localesCount,  int? totalSize)  $default,) {final _that = this;
switch (_that) {
case _RadaStats():
return $default(_that.categoriesCount,_that.productsCount,_that.imagesCount,_that.reviewsCount,_that.localesCount,_that.totalSize);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int categoriesCount,  int productsCount,  int imagesCount,  int reviewsCount,  int localesCount,  int? totalSize)?  $default,) {final _that = this;
switch (_that) {
case _RadaStats() when $default != null:
return $default(_that.categoriesCount,_that.productsCount,_that.imagesCount,_that.reviewsCount,_that.localesCount,_that.totalSize);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RadaStats implements RadaStats {
  const _RadaStats({required this.categoriesCount, required this.productsCount, required this.imagesCount, required this.reviewsCount, required this.localesCount, this.totalSize});
  factory _RadaStats.fromJson(Map<String, dynamic> json) => _$RadaStatsFromJson(json);

@override final  int categoriesCount;
@override final  int productsCount;
@override final  int imagesCount;
@override final  int reviewsCount;
@override final  int localesCount;
@override final  int? totalSize;

/// Create a copy of RadaStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RadaStatsCopyWith<_RadaStats> get copyWith => __$RadaStatsCopyWithImpl<_RadaStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RadaStatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RadaStats&&(identical(other.categoriesCount, categoriesCount) || other.categoriesCount == categoriesCount)&&(identical(other.productsCount, productsCount) || other.productsCount == productsCount)&&(identical(other.imagesCount, imagesCount) || other.imagesCount == imagesCount)&&(identical(other.reviewsCount, reviewsCount) || other.reviewsCount == reviewsCount)&&(identical(other.localesCount, localesCount) || other.localesCount == localesCount)&&(identical(other.totalSize, totalSize) || other.totalSize == totalSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoriesCount,productsCount,imagesCount,reviewsCount,localesCount,totalSize);

@override
String toString() {
  return 'RadaStats(categoriesCount: $categoriesCount, productsCount: $productsCount, imagesCount: $imagesCount, reviewsCount: $reviewsCount, localesCount: $localesCount, totalSize: $totalSize)';
}


}

/// @nodoc
abstract mixin class _$RadaStatsCopyWith<$Res> implements $RadaStatsCopyWith<$Res> {
  factory _$RadaStatsCopyWith(_RadaStats value, $Res Function(_RadaStats) _then) = __$RadaStatsCopyWithImpl;
@override @useResult
$Res call({
 int categoriesCount, int productsCount, int imagesCount, int reviewsCount, int localesCount, int? totalSize
});




}
/// @nodoc
class __$RadaStatsCopyWithImpl<$Res>
    implements _$RadaStatsCopyWith<$Res> {
  __$RadaStatsCopyWithImpl(this._self, this._then);

  final _RadaStats _self;
  final $Res Function(_RadaStats) _then;

/// Create a copy of RadaStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categoriesCount = null,Object? productsCount = null,Object? imagesCount = null,Object? reviewsCount = null,Object? localesCount = null,Object? totalSize = freezed,}) {
  return _then(_RadaStats(
categoriesCount: null == categoriesCount ? _self.categoriesCount : categoriesCount // ignore: cast_nullable_to_non_nullable
as int,productsCount: null == productsCount ? _self.productsCount : productsCount // ignore: cast_nullable_to_non_nullable
as int,imagesCount: null == imagesCount ? _self.imagesCount : imagesCount // ignore: cast_nullable_to_non_nullable
as int,reviewsCount: null == reviewsCount ? _self.reviewsCount : reviewsCount // ignore: cast_nullable_to_non_nullable
as int,localesCount: null == localesCount ? _self.localesCount : localesCount // ignore: cast_nullable_to_non_nullable
as int,totalSize: freezed == totalSize ? _self.totalSize : totalSize // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$RadaChecksums {

 String get main; String get assets; String get l10n;
/// Create a copy of RadaChecksums
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RadaChecksumsCopyWith<RadaChecksums> get copyWith => _$RadaChecksumsCopyWithImpl<RadaChecksums>(this as RadaChecksums, _$identity);

  /// Serializes this RadaChecksums to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RadaChecksums&&(identical(other.main, main) || other.main == main)&&(identical(other.assets, assets) || other.assets == assets)&&(identical(other.l10n, l10n) || other.l10n == l10n));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,main,assets,l10n);

@override
String toString() {
  return 'RadaChecksums(main: $main, assets: $assets, l10n: $l10n)';
}


}

/// @nodoc
abstract mixin class $RadaChecksumsCopyWith<$Res>  {
  factory $RadaChecksumsCopyWith(RadaChecksums value, $Res Function(RadaChecksums) _then) = _$RadaChecksumsCopyWithImpl;
@useResult
$Res call({
 String main, String assets, String l10n
});




}
/// @nodoc
class _$RadaChecksumsCopyWithImpl<$Res>
    implements $RadaChecksumsCopyWith<$Res> {
  _$RadaChecksumsCopyWithImpl(this._self, this._then);

  final RadaChecksums _self;
  final $Res Function(RadaChecksums) _then;

/// Create a copy of RadaChecksums
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? main = null,Object? assets = null,Object? l10n = null,}) {
  return _then(_self.copyWith(
main: null == main ? _self.main : main // ignore: cast_nullable_to_non_nullable
as String,assets: null == assets ? _self.assets : assets // ignore: cast_nullable_to_non_nullable
as String,l10n: null == l10n ? _self.l10n : l10n // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RadaChecksums].
extension RadaChecksumsPatterns on RadaChecksums {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RadaChecksums value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RadaChecksums() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RadaChecksums value)  $default,){
final _that = this;
switch (_that) {
case _RadaChecksums():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RadaChecksums value)?  $default,){
final _that = this;
switch (_that) {
case _RadaChecksums() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String main,  String assets,  String l10n)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RadaChecksums() when $default != null:
return $default(_that.main,_that.assets,_that.l10n);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String main,  String assets,  String l10n)  $default,) {final _that = this;
switch (_that) {
case _RadaChecksums():
return $default(_that.main,_that.assets,_that.l10n);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String main,  String assets,  String l10n)?  $default,) {final _that = this;
switch (_that) {
case _RadaChecksums() when $default != null:
return $default(_that.main,_that.assets,_that.l10n);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RadaChecksums implements RadaChecksums {
  const _RadaChecksums({required this.main, required this.assets, required this.l10n});
  factory _RadaChecksums.fromJson(Map<String, dynamic> json) => _$RadaChecksumsFromJson(json);

@override final  String main;
@override final  String assets;
@override final  String l10n;

/// Create a copy of RadaChecksums
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RadaChecksumsCopyWith<_RadaChecksums> get copyWith => __$RadaChecksumsCopyWithImpl<_RadaChecksums>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RadaChecksumsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RadaChecksums&&(identical(other.main, main) || other.main == main)&&(identical(other.assets, assets) || other.assets == assets)&&(identical(other.l10n, l10n) || other.l10n == l10n));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,main,assets,l10n);

@override
String toString() {
  return 'RadaChecksums(main: $main, assets: $assets, l10n: $l10n)';
}


}

/// @nodoc
abstract mixin class _$RadaChecksumsCopyWith<$Res> implements $RadaChecksumsCopyWith<$Res> {
  factory _$RadaChecksumsCopyWith(_RadaChecksums value, $Res Function(_RadaChecksums) _then) = __$RadaChecksumsCopyWithImpl;
@override @useResult
$Res call({
 String main, String assets, String l10n
});




}
/// @nodoc
class __$RadaChecksumsCopyWithImpl<$Res>
    implements _$RadaChecksumsCopyWith<$Res> {
  __$RadaChecksumsCopyWithImpl(this._self, this._then);

  final _RadaChecksums _self;
  final $Res Function(_RadaChecksums) _then;

/// Create a copy of RadaChecksums
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? main = null,Object? assets = null,Object? l10n = null,}) {
  return _then(_RadaChecksums(
main: null == main ? _self.main : main // ignore: cast_nullable_to_non_nullable
as String,assets: null == assets ? _self.assets : assets // ignore: cast_nullable_to_non_nullable
as String,l10n: null == l10n ? _self.l10n : l10n // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RadaData {

 Category get rootCategory; List<Category> get categories; List<Product> get products; List<Review> get reviews; Map<String, dynamic>? get metadata;
/// Create a copy of RadaData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RadaDataCopyWith<RadaData> get copyWith => _$RadaDataCopyWithImpl<RadaData>(this as RadaData, _$identity);

  /// Serializes this RadaData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RadaData&&(identical(other.rootCategory, rootCategory) || other.rootCategory == rootCategory)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.products, products)&&const DeepCollectionEquality().equals(other.reviews, reviews)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rootCategory,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(products),const DeepCollectionEquality().hash(reviews),const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'RadaData(rootCategory: $rootCategory, categories: $categories, products: $products, reviews: $reviews, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $RadaDataCopyWith<$Res>  {
  factory $RadaDataCopyWith(RadaData value, $Res Function(RadaData) _then) = _$RadaDataCopyWithImpl;
@useResult
$Res call({
 Category rootCategory, List<Category> categories, List<Product> products, List<Review> reviews, Map<String, dynamic>? metadata
});


$CategoryCopyWith<$Res> get rootCategory;

}
/// @nodoc
class _$RadaDataCopyWithImpl<$Res>
    implements $RadaDataCopyWith<$Res> {
  _$RadaDataCopyWithImpl(this._self, this._then);

  final RadaData _self;
  final $Res Function(RadaData) _then;

/// Create a copy of RadaData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rootCategory = null,Object? categories = null,Object? products = null,Object? reviews = null,Object? metadata = freezed,}) {
  return _then(_self.copyWith(
rootCategory: null == rootCategory ? _self.rootCategory : rootCategory // ignore: cast_nullable_to_non_nullable
as Category,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<Category>,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<Product>,reviews: null == reviews ? _self.reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<Review>,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}
/// Create a copy of RadaData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryCopyWith<$Res> get rootCategory {
  
  return $CategoryCopyWith<$Res>(_self.rootCategory, (value) {
    return _then(_self.copyWith(rootCategory: value));
  });
}
}


/// Adds pattern-matching-related methods to [RadaData].
extension RadaDataPatterns on RadaData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RadaData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RadaData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RadaData value)  $default,){
final _that = this;
switch (_that) {
case _RadaData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RadaData value)?  $default,){
final _that = this;
switch (_that) {
case _RadaData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Category rootCategory,  List<Category> categories,  List<Product> products,  List<Review> reviews,  Map<String, dynamic>? metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RadaData() when $default != null:
return $default(_that.rootCategory,_that.categories,_that.products,_that.reviews,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Category rootCategory,  List<Category> categories,  List<Product> products,  List<Review> reviews,  Map<String, dynamic>? metadata)  $default,) {final _that = this;
switch (_that) {
case _RadaData():
return $default(_that.rootCategory,_that.categories,_that.products,_that.reviews,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Category rootCategory,  List<Category> categories,  List<Product> products,  List<Review> reviews,  Map<String, dynamic>? metadata)?  $default,) {final _that = this;
switch (_that) {
case _RadaData() when $default != null:
return $default(_that.rootCategory,_that.categories,_that.products,_that.reviews,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RadaData implements RadaData {
  const _RadaData({required this.rootCategory, required final  List<Category> categories, required final  List<Product> products, required final  List<Review> reviews, final  Map<String, dynamic>? metadata}): _categories = categories,_products = products,_reviews = reviews,_metadata = metadata;
  factory _RadaData.fromJson(Map<String, dynamic> json) => _$RadaDataFromJson(json);

@override final  Category rootCategory;
 final  List<Category> _categories;
@override List<Category> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<Product> _products;
@override List<Product> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

 final  List<Review> _reviews;
@override List<Review> get reviews {
  if (_reviews is EqualUnmodifiableListView) return _reviews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reviews);
}

 final  Map<String, dynamic>? _metadata;
@override Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of RadaData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RadaDataCopyWith<_RadaData> get copyWith => __$RadaDataCopyWithImpl<_RadaData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RadaDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RadaData&&(identical(other.rootCategory, rootCategory) || other.rootCategory == rootCategory)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._products, _products)&&const DeepCollectionEquality().equals(other._reviews, _reviews)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rootCategory,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_products),const DeepCollectionEquality().hash(_reviews),const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'RadaData(rootCategory: $rootCategory, categories: $categories, products: $products, reviews: $reviews, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$RadaDataCopyWith<$Res> implements $RadaDataCopyWith<$Res> {
  factory _$RadaDataCopyWith(_RadaData value, $Res Function(_RadaData) _then) = __$RadaDataCopyWithImpl;
@override @useResult
$Res call({
 Category rootCategory, List<Category> categories, List<Product> products, List<Review> reviews, Map<String, dynamic>? metadata
});


@override $CategoryCopyWith<$Res> get rootCategory;

}
/// @nodoc
class __$RadaDataCopyWithImpl<$Res>
    implements _$RadaDataCopyWith<$Res> {
  __$RadaDataCopyWithImpl(this._self, this._then);

  final _RadaData _self;
  final $Res Function(_RadaData) _then;

/// Create a copy of RadaData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rootCategory = null,Object? categories = null,Object? products = null,Object? reviews = null,Object? metadata = freezed,}) {
  return _then(_RadaData(
rootCategory: null == rootCategory ? _self.rootCategory : rootCategory // ignore: cast_nullable_to_non_nullable
as Category,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<Category>,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<Product>,reviews: null == reviews ? _self._reviews : reviews // ignore: cast_nullable_to_non_nullable
as List<Review>,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

/// Create a copy of RadaData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryCopyWith<$Res> get rootCategory {
  
  return $CategoryCopyWith<$Res>(_self.rootCategory, (value) {
    return _then(_self.copyWith(rootCategory: value));
  });
}
}


/// @nodoc
mixin _$RadaLocalization {

 String get locale; Map<String, RadaCategoryTranslation> get categories; Map<String, RadaProductTranslation> get products; Map<String, String> get attributes;
/// Create a copy of RadaLocalization
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RadaLocalizationCopyWith<RadaLocalization> get copyWith => _$RadaLocalizationCopyWithImpl<RadaLocalization>(this as RadaLocalization, _$identity);

  /// Serializes this RadaLocalization to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RadaLocalization&&(identical(other.locale, locale) || other.locale == locale)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.products, products)&&const DeepCollectionEquality().equals(other.attributes, attributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,locale,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(products),const DeepCollectionEquality().hash(attributes));

@override
String toString() {
  return 'RadaLocalization(locale: $locale, categories: $categories, products: $products, attributes: $attributes)';
}


}

/// @nodoc
abstract mixin class $RadaLocalizationCopyWith<$Res>  {
  factory $RadaLocalizationCopyWith(RadaLocalization value, $Res Function(RadaLocalization) _then) = _$RadaLocalizationCopyWithImpl;
@useResult
$Res call({
 String locale, Map<String, RadaCategoryTranslation> categories, Map<String, RadaProductTranslation> products, Map<String, String> attributes
});




}
/// @nodoc
class _$RadaLocalizationCopyWithImpl<$Res>
    implements $RadaLocalizationCopyWith<$Res> {
  _$RadaLocalizationCopyWithImpl(this._self, this._then);

  final RadaLocalization _self;
  final $Res Function(RadaLocalization) _then;

/// Create a copy of RadaLocalization
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? locale = null,Object? categories = null,Object? products = null,Object? attributes = null,}) {
  return _then(_self.copyWith(
locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as Map<String, RadaCategoryTranslation>,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as Map<String, RadaProductTranslation>,attributes: null == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}

}


/// Adds pattern-matching-related methods to [RadaLocalization].
extension RadaLocalizationPatterns on RadaLocalization {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RadaLocalization value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RadaLocalization() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RadaLocalization value)  $default,){
final _that = this;
switch (_that) {
case _RadaLocalization():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RadaLocalization value)?  $default,){
final _that = this;
switch (_that) {
case _RadaLocalization() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String locale,  Map<String, RadaCategoryTranslation> categories,  Map<String, RadaProductTranslation> products,  Map<String, String> attributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RadaLocalization() when $default != null:
return $default(_that.locale,_that.categories,_that.products,_that.attributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String locale,  Map<String, RadaCategoryTranslation> categories,  Map<String, RadaProductTranslation> products,  Map<String, String> attributes)  $default,) {final _that = this;
switch (_that) {
case _RadaLocalization():
return $default(_that.locale,_that.categories,_that.products,_that.attributes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String locale,  Map<String, RadaCategoryTranslation> categories,  Map<String, RadaProductTranslation> products,  Map<String, String> attributes)?  $default,) {final _that = this;
switch (_that) {
case _RadaLocalization() when $default != null:
return $default(_that.locale,_that.categories,_that.products,_that.attributes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RadaLocalization implements RadaLocalization {
  const _RadaLocalization({required this.locale, required final  Map<String, RadaCategoryTranslation> categories, required final  Map<String, RadaProductTranslation> products, required final  Map<String, String> attributes}): _categories = categories,_products = products,_attributes = attributes;
  factory _RadaLocalization.fromJson(Map<String, dynamic> json) => _$RadaLocalizationFromJson(json);

@override final  String locale;
 final  Map<String, RadaCategoryTranslation> _categories;
@override Map<String, RadaCategoryTranslation> get categories {
  if (_categories is EqualUnmodifiableMapView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_categories);
}

 final  Map<String, RadaProductTranslation> _products;
@override Map<String, RadaProductTranslation> get products {
  if (_products is EqualUnmodifiableMapView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_products);
}

 final  Map<String, String> _attributes;
@override Map<String, String> get attributes {
  if (_attributes is EqualUnmodifiableMapView) return _attributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_attributes);
}


/// Create a copy of RadaLocalization
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RadaLocalizationCopyWith<_RadaLocalization> get copyWith => __$RadaLocalizationCopyWithImpl<_RadaLocalization>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RadaLocalizationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RadaLocalization&&(identical(other.locale, locale) || other.locale == locale)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._products, _products)&&const DeepCollectionEquality().equals(other._attributes, _attributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,locale,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_products),const DeepCollectionEquality().hash(_attributes));

@override
String toString() {
  return 'RadaLocalization(locale: $locale, categories: $categories, products: $products, attributes: $attributes)';
}


}

/// @nodoc
abstract mixin class _$RadaLocalizationCopyWith<$Res> implements $RadaLocalizationCopyWith<$Res> {
  factory _$RadaLocalizationCopyWith(_RadaLocalization value, $Res Function(_RadaLocalization) _then) = __$RadaLocalizationCopyWithImpl;
@override @useResult
$Res call({
 String locale, Map<String, RadaCategoryTranslation> categories, Map<String, RadaProductTranslation> products, Map<String, String> attributes
});




}
/// @nodoc
class __$RadaLocalizationCopyWithImpl<$Res>
    implements _$RadaLocalizationCopyWith<$Res> {
  __$RadaLocalizationCopyWithImpl(this._self, this._then);

  final _RadaLocalization _self;
  final $Res Function(_RadaLocalization) _then;

/// Create a copy of RadaLocalization
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? locale = null,Object? categories = null,Object? products = null,Object? attributes = null,}) {
  return _then(_RadaLocalization(
locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as Map<String, RadaCategoryTranslation>,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as Map<String, RadaProductTranslation>,attributes: null == attributes ? _self._attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}


}


/// @nodoc
mixin _$RadaCategoryTranslation {

 String get name; String? get description; String? get metaTitle; String? get metaDescription;
/// Create a copy of RadaCategoryTranslation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RadaCategoryTranslationCopyWith<RadaCategoryTranslation> get copyWith => _$RadaCategoryTranslationCopyWithImpl<RadaCategoryTranslation>(this as RadaCategoryTranslation, _$identity);

  /// Serializes this RadaCategoryTranslation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RadaCategoryTranslation&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.metaTitle, metaTitle) || other.metaTitle == metaTitle)&&(identical(other.metaDescription, metaDescription) || other.metaDescription == metaDescription));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,metaTitle,metaDescription);

@override
String toString() {
  return 'RadaCategoryTranslation(name: $name, description: $description, metaTitle: $metaTitle, metaDescription: $metaDescription)';
}


}

/// @nodoc
abstract mixin class $RadaCategoryTranslationCopyWith<$Res>  {
  factory $RadaCategoryTranslationCopyWith(RadaCategoryTranslation value, $Res Function(RadaCategoryTranslation) _then) = _$RadaCategoryTranslationCopyWithImpl;
@useResult
$Res call({
 String name, String? description, String? metaTitle, String? metaDescription
});




}
/// @nodoc
class _$RadaCategoryTranslationCopyWithImpl<$Res>
    implements $RadaCategoryTranslationCopyWith<$Res> {
  _$RadaCategoryTranslationCopyWithImpl(this._self, this._then);

  final RadaCategoryTranslation _self;
  final $Res Function(RadaCategoryTranslation) _then;

/// Create a copy of RadaCategoryTranslation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = freezed,Object? metaTitle = freezed,Object? metaDescription = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,metaTitle: freezed == metaTitle ? _self.metaTitle : metaTitle // ignore: cast_nullable_to_non_nullable
as String?,metaDescription: freezed == metaDescription ? _self.metaDescription : metaDescription // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RadaCategoryTranslation].
extension RadaCategoryTranslationPatterns on RadaCategoryTranslation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RadaCategoryTranslation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RadaCategoryTranslation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RadaCategoryTranslation value)  $default,){
final _that = this;
switch (_that) {
case _RadaCategoryTranslation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RadaCategoryTranslation value)?  $default,){
final _that = this;
switch (_that) {
case _RadaCategoryTranslation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? description,  String? metaTitle,  String? metaDescription)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RadaCategoryTranslation() when $default != null:
return $default(_that.name,_that.description,_that.metaTitle,_that.metaDescription);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? description,  String? metaTitle,  String? metaDescription)  $default,) {final _that = this;
switch (_that) {
case _RadaCategoryTranslation():
return $default(_that.name,_that.description,_that.metaTitle,_that.metaDescription);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? description,  String? metaTitle,  String? metaDescription)?  $default,) {final _that = this;
switch (_that) {
case _RadaCategoryTranslation() when $default != null:
return $default(_that.name,_that.description,_that.metaTitle,_that.metaDescription);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RadaCategoryTranslation implements RadaCategoryTranslation {
  const _RadaCategoryTranslation({required this.name, this.description, this.metaTitle, this.metaDescription});
  factory _RadaCategoryTranslation.fromJson(Map<String, dynamic> json) => _$RadaCategoryTranslationFromJson(json);

@override final  String name;
@override final  String? description;
@override final  String? metaTitle;
@override final  String? metaDescription;

/// Create a copy of RadaCategoryTranslation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RadaCategoryTranslationCopyWith<_RadaCategoryTranslation> get copyWith => __$RadaCategoryTranslationCopyWithImpl<_RadaCategoryTranslation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RadaCategoryTranslationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RadaCategoryTranslation&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.metaTitle, metaTitle) || other.metaTitle == metaTitle)&&(identical(other.metaDescription, metaDescription) || other.metaDescription == metaDescription));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,metaTitle,metaDescription);

@override
String toString() {
  return 'RadaCategoryTranslation(name: $name, description: $description, metaTitle: $metaTitle, metaDescription: $metaDescription)';
}


}

/// @nodoc
abstract mixin class _$RadaCategoryTranslationCopyWith<$Res> implements $RadaCategoryTranslationCopyWith<$Res> {
  factory _$RadaCategoryTranslationCopyWith(_RadaCategoryTranslation value, $Res Function(_RadaCategoryTranslation) _then) = __$RadaCategoryTranslationCopyWithImpl;
@override @useResult
$Res call({
 String name, String? description, String? metaTitle, String? metaDescription
});




}
/// @nodoc
class __$RadaCategoryTranslationCopyWithImpl<$Res>
    implements _$RadaCategoryTranslationCopyWith<$Res> {
  __$RadaCategoryTranslationCopyWithImpl(this._self, this._then);

  final _RadaCategoryTranslation _self;
  final $Res Function(_RadaCategoryTranslation) _then;

/// Create a copy of RadaCategoryTranslation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = freezed,Object? metaTitle = freezed,Object? metaDescription = freezed,}) {
  return _then(_RadaCategoryTranslation(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,metaTitle: freezed == metaTitle ? _self.metaTitle : metaTitle // ignore: cast_nullable_to_non_nullable
as String?,metaDescription: freezed == metaDescription ? _self.metaDescription : metaDescription // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$RadaProductTranslation {

 String get name; String? get description; String? get shortDescription; String? get metaTitle; String? get metaDescription;
/// Create a copy of RadaProductTranslation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RadaProductTranslationCopyWith<RadaProductTranslation> get copyWith => _$RadaProductTranslationCopyWithImpl<RadaProductTranslation>(this as RadaProductTranslation, _$identity);

  /// Serializes this RadaProductTranslation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RadaProductTranslation&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.shortDescription, shortDescription) || other.shortDescription == shortDescription)&&(identical(other.metaTitle, metaTitle) || other.metaTitle == metaTitle)&&(identical(other.metaDescription, metaDescription) || other.metaDescription == metaDescription));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,shortDescription,metaTitle,metaDescription);

@override
String toString() {
  return 'RadaProductTranslation(name: $name, description: $description, shortDescription: $shortDescription, metaTitle: $metaTitle, metaDescription: $metaDescription)';
}


}

/// @nodoc
abstract mixin class $RadaProductTranslationCopyWith<$Res>  {
  factory $RadaProductTranslationCopyWith(RadaProductTranslation value, $Res Function(RadaProductTranslation) _then) = _$RadaProductTranslationCopyWithImpl;
@useResult
$Res call({
 String name, String? description, String? shortDescription, String? metaTitle, String? metaDescription
});




}
/// @nodoc
class _$RadaProductTranslationCopyWithImpl<$Res>
    implements $RadaProductTranslationCopyWith<$Res> {
  _$RadaProductTranslationCopyWithImpl(this._self, this._then);

  final RadaProductTranslation _self;
  final $Res Function(RadaProductTranslation) _then;

/// Create a copy of RadaProductTranslation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = freezed,Object? shortDescription = freezed,Object? metaTitle = freezed,Object? metaDescription = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,shortDescription: freezed == shortDescription ? _self.shortDescription : shortDescription // ignore: cast_nullable_to_non_nullable
as String?,metaTitle: freezed == metaTitle ? _self.metaTitle : metaTitle // ignore: cast_nullable_to_non_nullable
as String?,metaDescription: freezed == metaDescription ? _self.metaDescription : metaDescription // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RadaProductTranslation].
extension RadaProductTranslationPatterns on RadaProductTranslation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RadaProductTranslation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RadaProductTranslation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RadaProductTranslation value)  $default,){
final _that = this;
switch (_that) {
case _RadaProductTranslation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RadaProductTranslation value)?  $default,){
final _that = this;
switch (_that) {
case _RadaProductTranslation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? description,  String? shortDescription,  String? metaTitle,  String? metaDescription)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RadaProductTranslation() when $default != null:
return $default(_that.name,_that.description,_that.shortDescription,_that.metaTitle,_that.metaDescription);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? description,  String? shortDescription,  String? metaTitle,  String? metaDescription)  $default,) {final _that = this;
switch (_that) {
case _RadaProductTranslation():
return $default(_that.name,_that.description,_that.shortDescription,_that.metaTitle,_that.metaDescription);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? description,  String? shortDescription,  String? metaTitle,  String? metaDescription)?  $default,) {final _that = this;
switch (_that) {
case _RadaProductTranslation() when $default != null:
return $default(_that.name,_that.description,_that.shortDescription,_that.metaTitle,_that.metaDescription);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RadaProductTranslation implements RadaProductTranslation {
  const _RadaProductTranslation({required this.name, this.description, this.shortDescription, this.metaTitle, this.metaDescription});
  factory _RadaProductTranslation.fromJson(Map<String, dynamic> json) => _$RadaProductTranslationFromJson(json);

@override final  String name;
@override final  String? description;
@override final  String? shortDescription;
@override final  String? metaTitle;
@override final  String? metaDescription;

/// Create a copy of RadaProductTranslation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RadaProductTranslationCopyWith<_RadaProductTranslation> get copyWith => __$RadaProductTranslationCopyWithImpl<_RadaProductTranslation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RadaProductTranslationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RadaProductTranslation&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.shortDescription, shortDescription) || other.shortDescription == shortDescription)&&(identical(other.metaTitle, metaTitle) || other.metaTitle == metaTitle)&&(identical(other.metaDescription, metaDescription) || other.metaDescription == metaDescription));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,shortDescription,metaTitle,metaDescription);

@override
String toString() {
  return 'RadaProductTranslation(name: $name, description: $description, shortDescription: $shortDescription, metaTitle: $metaTitle, metaDescription: $metaDescription)';
}


}

/// @nodoc
abstract mixin class _$RadaProductTranslationCopyWith<$Res> implements $RadaProductTranslationCopyWith<$Res> {
  factory _$RadaProductTranslationCopyWith(_RadaProductTranslation value, $Res Function(_RadaProductTranslation) _then) = __$RadaProductTranslationCopyWithImpl;
@override @useResult
$Res call({
 String name, String? description, String? shortDescription, String? metaTitle, String? metaDescription
});




}
/// @nodoc
class __$RadaProductTranslationCopyWithImpl<$Res>
    implements _$RadaProductTranslationCopyWith<$Res> {
  __$RadaProductTranslationCopyWithImpl(this._self, this._then);

  final _RadaProductTranslation _self;
  final $Res Function(_RadaProductTranslation) _then;

/// Create a copy of RadaProductTranslation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = freezed,Object? shortDescription = freezed,Object? metaTitle = freezed,Object? metaDescription = freezed,}) {
  return _then(_RadaProductTranslation(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,shortDescription: freezed == shortDescription ? _self.shortDescription : shortDescription // ignore: cast_nullable_to_non_nullable
as String?,metaTitle: freezed == metaTitle ? _self.metaTitle : metaTitle // ignore: cast_nullable_to_non_nullable
as String?,metaDescription: freezed == metaDescription ? _self.metaDescription : metaDescription // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$RadaPackage {

 RadaManifest get manifest; RadaData get data; Map<String, RadaLocalization> get localizations; Map<String, List<int>> get images;
/// Create a copy of RadaPackage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RadaPackageCopyWith<RadaPackage> get copyWith => _$RadaPackageCopyWithImpl<RadaPackage>(this as RadaPackage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RadaPackage&&(identical(other.manifest, manifest) || other.manifest == manifest)&&(identical(other.data, data) || other.data == data)&&const DeepCollectionEquality().equals(other.localizations, localizations)&&const DeepCollectionEquality().equals(other.images, images));
}


@override
int get hashCode => Object.hash(runtimeType,manifest,data,const DeepCollectionEquality().hash(localizations),const DeepCollectionEquality().hash(images));

@override
String toString() {
  return 'RadaPackage(manifest: $manifest, data: $data, localizations: $localizations, images: $images)';
}


}

/// @nodoc
abstract mixin class $RadaPackageCopyWith<$Res>  {
  factory $RadaPackageCopyWith(RadaPackage value, $Res Function(RadaPackage) _then) = _$RadaPackageCopyWithImpl;
@useResult
$Res call({
 RadaManifest manifest, RadaData data, Map<String, RadaLocalization> localizations, Map<String, List<int>> images
});


$RadaManifestCopyWith<$Res> get manifest;$RadaDataCopyWith<$Res> get data;

}
/// @nodoc
class _$RadaPackageCopyWithImpl<$Res>
    implements $RadaPackageCopyWith<$Res> {
  _$RadaPackageCopyWithImpl(this._self, this._then);

  final RadaPackage _self;
  final $Res Function(RadaPackage) _then;

/// Create a copy of RadaPackage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? manifest = null,Object? data = null,Object? localizations = null,Object? images = null,}) {
  return _then(_self.copyWith(
manifest: null == manifest ? _self.manifest : manifest // ignore: cast_nullable_to_non_nullable
as RadaManifest,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as RadaData,localizations: null == localizations ? _self.localizations : localizations // ignore: cast_nullable_to_non_nullable
as Map<String, RadaLocalization>,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as Map<String, List<int>>,
  ));
}
/// Create a copy of RadaPackage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RadaManifestCopyWith<$Res> get manifest {
  
  return $RadaManifestCopyWith<$Res>(_self.manifest, (value) {
    return _then(_self.copyWith(manifest: value));
  });
}/// Create a copy of RadaPackage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RadaDataCopyWith<$Res> get data {
  
  return $RadaDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [RadaPackage].
extension RadaPackagePatterns on RadaPackage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RadaPackage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RadaPackage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RadaPackage value)  $default,){
final _that = this;
switch (_that) {
case _RadaPackage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RadaPackage value)?  $default,){
final _that = this;
switch (_that) {
case _RadaPackage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RadaManifest manifest,  RadaData data,  Map<String, RadaLocalization> localizations,  Map<String, List<int>> images)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RadaPackage() when $default != null:
return $default(_that.manifest,_that.data,_that.localizations,_that.images);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RadaManifest manifest,  RadaData data,  Map<String, RadaLocalization> localizations,  Map<String, List<int>> images)  $default,) {final _that = this;
switch (_that) {
case _RadaPackage():
return $default(_that.manifest,_that.data,_that.localizations,_that.images);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RadaManifest manifest,  RadaData data,  Map<String, RadaLocalization> localizations,  Map<String, List<int>> images)?  $default,) {final _that = this;
switch (_that) {
case _RadaPackage() when $default != null:
return $default(_that.manifest,_that.data,_that.localizations,_that.images);case _:
  return null;

}
}

}

/// @nodoc


class _RadaPackage extends RadaPackage {
  const _RadaPackage({required this.manifest, required this.data, required final  Map<String, RadaLocalization> localizations, required final  Map<String, List<int>> images}): _localizations = localizations,_images = images,super._();
  

@override final  RadaManifest manifest;
@override final  RadaData data;
 final  Map<String, RadaLocalization> _localizations;
@override Map<String, RadaLocalization> get localizations {
  if (_localizations is EqualUnmodifiableMapView) return _localizations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_localizations);
}

 final  Map<String, List<int>> _images;
@override Map<String, List<int>> get images {
  if (_images is EqualUnmodifiableMapView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_images);
}


/// Create a copy of RadaPackage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RadaPackageCopyWith<_RadaPackage> get copyWith => __$RadaPackageCopyWithImpl<_RadaPackage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RadaPackage&&(identical(other.manifest, manifest) || other.manifest == manifest)&&(identical(other.data, data) || other.data == data)&&const DeepCollectionEquality().equals(other._localizations, _localizations)&&const DeepCollectionEquality().equals(other._images, _images));
}


@override
int get hashCode => Object.hash(runtimeType,manifest,data,const DeepCollectionEquality().hash(_localizations),const DeepCollectionEquality().hash(_images));

@override
String toString() {
  return 'RadaPackage(manifest: $manifest, data: $data, localizations: $localizations, images: $images)';
}


}

/// @nodoc
abstract mixin class _$RadaPackageCopyWith<$Res> implements $RadaPackageCopyWith<$Res> {
  factory _$RadaPackageCopyWith(_RadaPackage value, $Res Function(_RadaPackage) _then) = __$RadaPackageCopyWithImpl;
@override @useResult
$Res call({
 RadaManifest manifest, RadaData data, Map<String, RadaLocalization> localizations, Map<String, List<int>> images
});


@override $RadaManifestCopyWith<$Res> get manifest;@override $RadaDataCopyWith<$Res> get data;

}
/// @nodoc
class __$RadaPackageCopyWithImpl<$Res>
    implements _$RadaPackageCopyWith<$Res> {
  __$RadaPackageCopyWithImpl(this._self, this._then);

  final _RadaPackage _self;
  final $Res Function(_RadaPackage) _then;

/// Create a copy of RadaPackage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? manifest = null,Object? data = null,Object? localizations = null,Object? images = null,}) {
  return _then(_RadaPackage(
manifest: null == manifest ? _self.manifest : manifest // ignore: cast_nullable_to_non_nullable
as RadaManifest,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as RadaData,localizations: null == localizations ? _self._localizations : localizations // ignore: cast_nullable_to_non_nullable
as Map<String, RadaLocalization>,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as Map<String, List<int>>,
  ));
}

/// Create a copy of RadaPackage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RadaManifestCopyWith<$Res> get manifest {
  
  return $RadaManifestCopyWith<$Res>(_self.manifest, (value) {
    return _then(_self.copyWith(manifest: value));
  });
}/// Create a copy of RadaPackage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RadaDataCopyWith<$Res> get data {
  
  return $RadaDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$RadaExportOptions {

 int get categoryId; bool get includeSubcategories; bool get includeProducts; bool get includeReviews; bool get includeImages; List<String> get locales; int get maxImageWidth; int get maxImageHeight; int get imageQuality; int? get maxProducts; int? get maxDepth;
/// Create a copy of RadaExportOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RadaExportOptionsCopyWith<RadaExportOptions> get copyWith => _$RadaExportOptionsCopyWithImpl<RadaExportOptions>(this as RadaExportOptions, _$identity);

  /// Serializes this RadaExportOptions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RadaExportOptions&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.includeSubcategories, includeSubcategories) || other.includeSubcategories == includeSubcategories)&&(identical(other.includeProducts, includeProducts) || other.includeProducts == includeProducts)&&(identical(other.includeReviews, includeReviews) || other.includeReviews == includeReviews)&&(identical(other.includeImages, includeImages) || other.includeImages == includeImages)&&const DeepCollectionEquality().equals(other.locales, locales)&&(identical(other.maxImageWidth, maxImageWidth) || other.maxImageWidth == maxImageWidth)&&(identical(other.maxImageHeight, maxImageHeight) || other.maxImageHeight == maxImageHeight)&&(identical(other.imageQuality, imageQuality) || other.imageQuality == imageQuality)&&(identical(other.maxProducts, maxProducts) || other.maxProducts == maxProducts)&&(identical(other.maxDepth, maxDepth) || other.maxDepth == maxDepth));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryId,includeSubcategories,includeProducts,includeReviews,includeImages,const DeepCollectionEquality().hash(locales),maxImageWidth,maxImageHeight,imageQuality,maxProducts,maxDepth);

@override
String toString() {
  return 'RadaExportOptions(categoryId: $categoryId, includeSubcategories: $includeSubcategories, includeProducts: $includeProducts, includeReviews: $includeReviews, includeImages: $includeImages, locales: $locales, maxImageWidth: $maxImageWidth, maxImageHeight: $maxImageHeight, imageQuality: $imageQuality, maxProducts: $maxProducts, maxDepth: $maxDepth)';
}


}

/// @nodoc
abstract mixin class $RadaExportOptionsCopyWith<$Res>  {
  factory $RadaExportOptionsCopyWith(RadaExportOptions value, $Res Function(RadaExportOptions) _then) = _$RadaExportOptionsCopyWithImpl;
@useResult
$Res call({
 int categoryId, bool includeSubcategories, bool includeProducts, bool includeReviews, bool includeImages, List<String> locales, int maxImageWidth, int maxImageHeight, int imageQuality, int? maxProducts, int? maxDepth
});




}
/// @nodoc
class _$RadaExportOptionsCopyWithImpl<$Res>
    implements $RadaExportOptionsCopyWith<$Res> {
  _$RadaExportOptionsCopyWithImpl(this._self, this._then);

  final RadaExportOptions _self;
  final $Res Function(RadaExportOptions) _then;

/// Create a copy of RadaExportOptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categoryId = null,Object? includeSubcategories = null,Object? includeProducts = null,Object? includeReviews = null,Object? includeImages = null,Object? locales = null,Object? maxImageWidth = null,Object? maxImageHeight = null,Object? imageQuality = null,Object? maxProducts = freezed,Object? maxDepth = freezed,}) {
  return _then(_self.copyWith(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,includeSubcategories: null == includeSubcategories ? _self.includeSubcategories : includeSubcategories // ignore: cast_nullable_to_non_nullable
as bool,includeProducts: null == includeProducts ? _self.includeProducts : includeProducts // ignore: cast_nullable_to_non_nullable
as bool,includeReviews: null == includeReviews ? _self.includeReviews : includeReviews // ignore: cast_nullable_to_non_nullable
as bool,includeImages: null == includeImages ? _self.includeImages : includeImages // ignore: cast_nullable_to_non_nullable
as bool,locales: null == locales ? _self.locales : locales // ignore: cast_nullable_to_non_nullable
as List<String>,maxImageWidth: null == maxImageWidth ? _self.maxImageWidth : maxImageWidth // ignore: cast_nullable_to_non_nullable
as int,maxImageHeight: null == maxImageHeight ? _self.maxImageHeight : maxImageHeight // ignore: cast_nullable_to_non_nullable
as int,imageQuality: null == imageQuality ? _self.imageQuality : imageQuality // ignore: cast_nullable_to_non_nullable
as int,maxProducts: freezed == maxProducts ? _self.maxProducts : maxProducts // ignore: cast_nullable_to_non_nullable
as int?,maxDepth: freezed == maxDepth ? _self.maxDepth : maxDepth // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [RadaExportOptions].
extension RadaExportOptionsPatterns on RadaExportOptions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RadaExportOptions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RadaExportOptions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RadaExportOptions value)  $default,){
final _that = this;
switch (_that) {
case _RadaExportOptions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RadaExportOptions value)?  $default,){
final _that = this;
switch (_that) {
case _RadaExportOptions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int categoryId,  bool includeSubcategories,  bool includeProducts,  bool includeReviews,  bool includeImages,  List<String> locales,  int maxImageWidth,  int maxImageHeight,  int imageQuality,  int? maxProducts,  int? maxDepth)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RadaExportOptions() when $default != null:
return $default(_that.categoryId,_that.includeSubcategories,_that.includeProducts,_that.includeReviews,_that.includeImages,_that.locales,_that.maxImageWidth,_that.maxImageHeight,_that.imageQuality,_that.maxProducts,_that.maxDepth);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int categoryId,  bool includeSubcategories,  bool includeProducts,  bool includeReviews,  bool includeImages,  List<String> locales,  int maxImageWidth,  int maxImageHeight,  int imageQuality,  int? maxProducts,  int? maxDepth)  $default,) {final _that = this;
switch (_that) {
case _RadaExportOptions():
return $default(_that.categoryId,_that.includeSubcategories,_that.includeProducts,_that.includeReviews,_that.includeImages,_that.locales,_that.maxImageWidth,_that.maxImageHeight,_that.imageQuality,_that.maxProducts,_that.maxDepth);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int categoryId,  bool includeSubcategories,  bool includeProducts,  bool includeReviews,  bool includeImages,  List<String> locales,  int maxImageWidth,  int maxImageHeight,  int imageQuality,  int? maxProducts,  int? maxDepth)?  $default,) {final _that = this;
switch (_that) {
case _RadaExportOptions() when $default != null:
return $default(_that.categoryId,_that.includeSubcategories,_that.includeProducts,_that.includeReviews,_that.includeImages,_that.locales,_that.maxImageWidth,_that.maxImageHeight,_that.imageQuality,_that.maxProducts,_that.maxDepth);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RadaExportOptions implements RadaExportOptions {
  const _RadaExportOptions({required this.categoryId, this.includeSubcategories = true, this.includeProducts = true, this.includeReviews = true, this.includeImages = true, final  List<String> locales = const ['en'], this.maxImageWidth = 1024, this.maxImageHeight = 1024, this.imageQuality = 80, this.maxProducts, this.maxDepth}): _locales = locales;
  factory _RadaExportOptions.fromJson(Map<String, dynamic> json) => _$RadaExportOptionsFromJson(json);

@override final  int categoryId;
@override@JsonKey() final  bool includeSubcategories;
@override@JsonKey() final  bool includeProducts;
@override@JsonKey() final  bool includeReviews;
@override@JsonKey() final  bool includeImages;
 final  List<String> _locales;
@override@JsonKey() List<String> get locales {
  if (_locales is EqualUnmodifiableListView) return _locales;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_locales);
}

@override@JsonKey() final  int maxImageWidth;
@override@JsonKey() final  int maxImageHeight;
@override@JsonKey() final  int imageQuality;
@override final  int? maxProducts;
@override final  int? maxDepth;

/// Create a copy of RadaExportOptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RadaExportOptionsCopyWith<_RadaExportOptions> get copyWith => __$RadaExportOptionsCopyWithImpl<_RadaExportOptions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RadaExportOptionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RadaExportOptions&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.includeSubcategories, includeSubcategories) || other.includeSubcategories == includeSubcategories)&&(identical(other.includeProducts, includeProducts) || other.includeProducts == includeProducts)&&(identical(other.includeReviews, includeReviews) || other.includeReviews == includeReviews)&&(identical(other.includeImages, includeImages) || other.includeImages == includeImages)&&const DeepCollectionEquality().equals(other._locales, _locales)&&(identical(other.maxImageWidth, maxImageWidth) || other.maxImageWidth == maxImageWidth)&&(identical(other.maxImageHeight, maxImageHeight) || other.maxImageHeight == maxImageHeight)&&(identical(other.imageQuality, imageQuality) || other.imageQuality == imageQuality)&&(identical(other.maxProducts, maxProducts) || other.maxProducts == maxProducts)&&(identical(other.maxDepth, maxDepth) || other.maxDepth == maxDepth));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryId,includeSubcategories,includeProducts,includeReviews,includeImages,const DeepCollectionEquality().hash(_locales),maxImageWidth,maxImageHeight,imageQuality,maxProducts,maxDepth);

@override
String toString() {
  return 'RadaExportOptions(categoryId: $categoryId, includeSubcategories: $includeSubcategories, includeProducts: $includeProducts, includeReviews: $includeReviews, includeImages: $includeImages, locales: $locales, maxImageWidth: $maxImageWidth, maxImageHeight: $maxImageHeight, imageQuality: $imageQuality, maxProducts: $maxProducts, maxDepth: $maxDepth)';
}


}

/// @nodoc
abstract mixin class _$RadaExportOptionsCopyWith<$Res> implements $RadaExportOptionsCopyWith<$Res> {
  factory _$RadaExportOptionsCopyWith(_RadaExportOptions value, $Res Function(_RadaExportOptions) _then) = __$RadaExportOptionsCopyWithImpl;
@override @useResult
$Res call({
 int categoryId, bool includeSubcategories, bool includeProducts, bool includeReviews, bool includeImages, List<String> locales, int maxImageWidth, int maxImageHeight, int imageQuality, int? maxProducts, int? maxDepth
});




}
/// @nodoc
class __$RadaExportOptionsCopyWithImpl<$Res>
    implements _$RadaExportOptionsCopyWith<$Res> {
  __$RadaExportOptionsCopyWithImpl(this._self, this._then);

  final _RadaExportOptions _self;
  final $Res Function(_RadaExportOptions) _then;

/// Create a copy of RadaExportOptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categoryId = null,Object? includeSubcategories = null,Object? includeProducts = null,Object? includeReviews = null,Object? includeImages = null,Object? locales = null,Object? maxImageWidth = null,Object? maxImageHeight = null,Object? imageQuality = null,Object? maxProducts = freezed,Object? maxDepth = freezed,}) {
  return _then(_RadaExportOptions(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,includeSubcategories: null == includeSubcategories ? _self.includeSubcategories : includeSubcategories // ignore: cast_nullable_to_non_nullable
as bool,includeProducts: null == includeProducts ? _self.includeProducts : includeProducts // ignore: cast_nullable_to_non_nullable
as bool,includeReviews: null == includeReviews ? _self.includeReviews : includeReviews // ignore: cast_nullable_to_non_nullable
as bool,includeImages: null == includeImages ? _self.includeImages : includeImages // ignore: cast_nullable_to_non_nullable
as bool,locales: null == locales ? _self._locales : locales // ignore: cast_nullable_to_non_nullable
as List<String>,maxImageWidth: null == maxImageWidth ? _self.maxImageWidth : maxImageWidth // ignore: cast_nullable_to_non_nullable
as int,maxImageHeight: null == maxImageHeight ? _self.maxImageHeight : maxImageHeight // ignore: cast_nullable_to_non_nullable
as int,imageQuality: null == imageQuality ? _self.imageQuality : imageQuality // ignore: cast_nullable_to_non_nullable
as int,maxProducts: freezed == maxProducts ? _self.maxProducts : maxProducts // ignore: cast_nullable_to_non_nullable
as int?,maxDepth: freezed == maxDepth ? _self.maxDepth : maxDepth // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc
mixin _$RadaImportResult {

 bool get success; RadaPackage? get package; String? get error; int get categoriesImported; int get productsImported; int get imagesImported; int get reviewsImported; DateTime get importedAt;
/// Create a copy of RadaImportResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RadaImportResultCopyWith<RadaImportResult> get copyWith => _$RadaImportResultCopyWithImpl<RadaImportResult>(this as RadaImportResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RadaImportResult&&(identical(other.success, success) || other.success == success)&&(identical(other.package, package) || other.package == package)&&(identical(other.error, error) || other.error == error)&&(identical(other.categoriesImported, categoriesImported) || other.categoriesImported == categoriesImported)&&(identical(other.productsImported, productsImported) || other.productsImported == productsImported)&&(identical(other.imagesImported, imagesImported) || other.imagesImported == imagesImported)&&(identical(other.reviewsImported, reviewsImported) || other.reviewsImported == reviewsImported)&&(identical(other.importedAt, importedAt) || other.importedAt == importedAt));
}


@override
int get hashCode => Object.hash(runtimeType,success,package,error,categoriesImported,productsImported,imagesImported,reviewsImported,importedAt);

@override
String toString() {
  return 'RadaImportResult(success: $success, package: $package, error: $error, categoriesImported: $categoriesImported, productsImported: $productsImported, imagesImported: $imagesImported, reviewsImported: $reviewsImported, importedAt: $importedAt)';
}


}

/// @nodoc
abstract mixin class $RadaImportResultCopyWith<$Res>  {
  factory $RadaImportResultCopyWith(RadaImportResult value, $Res Function(RadaImportResult) _then) = _$RadaImportResultCopyWithImpl;
@useResult
$Res call({
 bool success, RadaPackage? package, String? error, int categoriesImported, int productsImported, int imagesImported, int reviewsImported, DateTime importedAt
});


$RadaPackageCopyWith<$Res>? get package;

}
/// @nodoc
class _$RadaImportResultCopyWithImpl<$Res>
    implements $RadaImportResultCopyWith<$Res> {
  _$RadaImportResultCopyWithImpl(this._self, this._then);

  final RadaImportResult _self;
  final $Res Function(RadaImportResult) _then;

/// Create a copy of RadaImportResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? package = freezed,Object? error = freezed,Object? categoriesImported = null,Object? productsImported = null,Object? imagesImported = null,Object? reviewsImported = null,Object? importedAt = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,package: freezed == package ? _self.package : package // ignore: cast_nullable_to_non_nullable
as RadaPackage?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,categoriesImported: null == categoriesImported ? _self.categoriesImported : categoriesImported // ignore: cast_nullable_to_non_nullable
as int,productsImported: null == productsImported ? _self.productsImported : productsImported // ignore: cast_nullable_to_non_nullable
as int,imagesImported: null == imagesImported ? _self.imagesImported : imagesImported // ignore: cast_nullable_to_non_nullable
as int,reviewsImported: null == reviewsImported ? _self.reviewsImported : reviewsImported // ignore: cast_nullable_to_non_nullable
as int,importedAt: null == importedAt ? _self.importedAt : importedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of RadaImportResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RadaPackageCopyWith<$Res>? get package {
    if (_self.package == null) {
    return null;
  }

  return $RadaPackageCopyWith<$Res>(_self.package!, (value) {
    return _then(_self.copyWith(package: value));
  });
}
}


/// Adds pattern-matching-related methods to [RadaImportResult].
extension RadaImportResultPatterns on RadaImportResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RadaImportResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RadaImportResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RadaImportResult value)  $default,){
final _that = this;
switch (_that) {
case _RadaImportResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RadaImportResult value)?  $default,){
final _that = this;
switch (_that) {
case _RadaImportResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  RadaPackage? package,  String? error,  int categoriesImported,  int productsImported,  int imagesImported,  int reviewsImported,  DateTime importedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RadaImportResult() when $default != null:
return $default(_that.success,_that.package,_that.error,_that.categoriesImported,_that.productsImported,_that.imagesImported,_that.reviewsImported,_that.importedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  RadaPackage? package,  String? error,  int categoriesImported,  int productsImported,  int imagesImported,  int reviewsImported,  DateTime importedAt)  $default,) {final _that = this;
switch (_that) {
case _RadaImportResult():
return $default(_that.success,_that.package,_that.error,_that.categoriesImported,_that.productsImported,_that.imagesImported,_that.reviewsImported,_that.importedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  RadaPackage? package,  String? error,  int categoriesImported,  int productsImported,  int imagesImported,  int reviewsImported,  DateTime importedAt)?  $default,) {final _that = this;
switch (_that) {
case _RadaImportResult() when $default != null:
return $default(_that.success,_that.package,_that.error,_that.categoriesImported,_that.productsImported,_that.imagesImported,_that.reviewsImported,_that.importedAt);case _:
  return null;

}
}

}

/// @nodoc


class _RadaImportResult extends RadaImportResult {
  const _RadaImportResult({required this.success, required this.package, this.error, required this.categoriesImported, required this.productsImported, required this.imagesImported, required this.reviewsImported, required this.importedAt}): super._();
  

@override final  bool success;
@override final  RadaPackage? package;
@override final  String? error;
@override final  int categoriesImported;
@override final  int productsImported;
@override final  int imagesImported;
@override final  int reviewsImported;
@override final  DateTime importedAt;

/// Create a copy of RadaImportResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RadaImportResultCopyWith<_RadaImportResult> get copyWith => __$RadaImportResultCopyWithImpl<_RadaImportResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RadaImportResult&&(identical(other.success, success) || other.success == success)&&(identical(other.package, package) || other.package == package)&&(identical(other.error, error) || other.error == error)&&(identical(other.categoriesImported, categoriesImported) || other.categoriesImported == categoriesImported)&&(identical(other.productsImported, productsImported) || other.productsImported == productsImported)&&(identical(other.imagesImported, imagesImported) || other.imagesImported == imagesImported)&&(identical(other.reviewsImported, reviewsImported) || other.reviewsImported == reviewsImported)&&(identical(other.importedAt, importedAt) || other.importedAt == importedAt));
}


@override
int get hashCode => Object.hash(runtimeType,success,package,error,categoriesImported,productsImported,imagesImported,reviewsImported,importedAt);

@override
String toString() {
  return 'RadaImportResult(success: $success, package: $package, error: $error, categoriesImported: $categoriesImported, productsImported: $productsImported, imagesImported: $imagesImported, reviewsImported: $reviewsImported, importedAt: $importedAt)';
}


}

/// @nodoc
abstract mixin class _$RadaImportResultCopyWith<$Res> implements $RadaImportResultCopyWith<$Res> {
  factory _$RadaImportResultCopyWith(_RadaImportResult value, $Res Function(_RadaImportResult) _then) = __$RadaImportResultCopyWithImpl;
@override @useResult
$Res call({
 bool success, RadaPackage? package, String? error, int categoriesImported, int productsImported, int imagesImported, int reviewsImported, DateTime importedAt
});


@override $RadaPackageCopyWith<$Res>? get package;

}
/// @nodoc
class __$RadaImportResultCopyWithImpl<$Res>
    implements _$RadaImportResultCopyWith<$Res> {
  __$RadaImportResultCopyWithImpl(this._self, this._then);

  final _RadaImportResult _self;
  final $Res Function(_RadaImportResult) _then;

/// Create a copy of RadaImportResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? package = freezed,Object? error = freezed,Object? categoriesImported = null,Object? productsImported = null,Object? imagesImported = null,Object? reviewsImported = null,Object? importedAt = null,}) {
  return _then(_RadaImportResult(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,package: freezed == package ? _self.package : package // ignore: cast_nullable_to_non_nullable
as RadaPackage?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,categoriesImported: null == categoriesImported ? _self.categoriesImported : categoriesImported // ignore: cast_nullable_to_non_nullable
as int,productsImported: null == productsImported ? _self.productsImported : productsImported // ignore: cast_nullable_to_non_nullable
as int,imagesImported: null == imagesImported ? _self.imagesImported : imagesImported // ignore: cast_nullable_to_non_nullable
as int,reviewsImported: null == reviewsImported ? _self.reviewsImported : reviewsImported // ignore: cast_nullable_to_non_nullable
as int,importedAt: null == importedAt ? _self.importedAt : importedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of RadaImportResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RadaPackageCopyWith<$Res>? get package {
    if (_self.package == null) {
    return null;
  }

  return $RadaPackageCopyWith<$Res>(_self.package!, (value) {
    return _then(_self.copyWith(package: value));
  });
}
}

// dart format on
