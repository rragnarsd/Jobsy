// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workplace_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkplaceModel {

 String get id; String get name; String get description; String get location;@GeoPointConverter() GeoPoint get locationGeoPoint; String? get websiteUrl; String get size; String get motto; List<String>? get jobIds; String get imageUrl; String get logoUrl; List<String>? get awards; List<PerkModel>? get perks;
/// Create a copy of WorkplaceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkplaceModelCopyWith<WorkplaceModel> get copyWith => _$WorkplaceModelCopyWithImpl<WorkplaceModel>(this as WorkplaceModel, _$identity);

  /// Serializes this WorkplaceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkplaceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.location, location) || other.location == location)&&(identical(other.locationGeoPoint, locationGeoPoint) || other.locationGeoPoint == locationGeoPoint)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&(identical(other.size, size) || other.size == size)&&(identical(other.motto, motto) || other.motto == motto)&&const DeepCollectionEquality().equals(other.jobIds, jobIds)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&const DeepCollectionEquality().equals(other.awards, awards)&&const DeepCollectionEquality().equals(other.perks, perks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,location,locationGeoPoint,websiteUrl,size,motto,const DeepCollectionEquality().hash(jobIds),imageUrl,logoUrl,const DeepCollectionEquality().hash(awards),const DeepCollectionEquality().hash(perks));

@override
String toString() {
  return 'WorkplaceModel(id: $id, name: $name, description: $description, location: $location, locationGeoPoint: $locationGeoPoint, websiteUrl: $websiteUrl, size: $size, motto: $motto, jobIds: $jobIds, imageUrl: $imageUrl, logoUrl: $logoUrl, awards: $awards, perks: $perks)';
}


}

/// @nodoc
abstract mixin class $WorkplaceModelCopyWith<$Res>  {
  factory $WorkplaceModelCopyWith(WorkplaceModel value, $Res Function(WorkplaceModel) _then) = _$WorkplaceModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, String location,@GeoPointConverter() GeoPoint locationGeoPoint, String? websiteUrl, String size, String motto, List<String>? jobIds, String imageUrl, String logoUrl, List<String>? awards, List<PerkModel>? perks
});




}
/// @nodoc
class _$WorkplaceModelCopyWithImpl<$Res>
    implements $WorkplaceModelCopyWith<$Res> {
  _$WorkplaceModelCopyWithImpl(this._self, this._then);

  final WorkplaceModel _self;
  final $Res Function(WorkplaceModel) _then;

/// Create a copy of WorkplaceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? location = null,Object? locationGeoPoint = null,Object? websiteUrl = freezed,Object? size = null,Object? motto = null,Object? jobIds = freezed,Object? imageUrl = null,Object? logoUrl = null,Object? awards = freezed,Object? perks = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,locationGeoPoint: null == locationGeoPoint ? _self.locationGeoPoint : locationGeoPoint // ignore: cast_nullable_to_non_nullable
as GeoPoint,websiteUrl: freezed == websiteUrl ? _self.websiteUrl : websiteUrl // ignore: cast_nullable_to_non_nullable
as String?,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String,motto: null == motto ? _self.motto : motto // ignore: cast_nullable_to_non_nullable
as String,jobIds: freezed == jobIds ? _self.jobIds : jobIds // ignore: cast_nullable_to_non_nullable
as List<String>?,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,logoUrl: null == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String,awards: freezed == awards ? _self.awards : awards // ignore: cast_nullable_to_non_nullable
as List<String>?,perks: freezed == perks ? _self.perks : perks // ignore: cast_nullable_to_non_nullable
as List<PerkModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkplaceModel].
extension WorkplaceModelPatterns on WorkplaceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkplaceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkplaceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkplaceModel value)  $default,){
final _that = this;
switch (_that) {
case _WorkplaceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkplaceModel value)?  $default,){
final _that = this;
switch (_that) {
case _WorkplaceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String location, @GeoPointConverter()  GeoPoint locationGeoPoint,  String? websiteUrl,  String size,  String motto,  List<String>? jobIds,  String imageUrl,  String logoUrl,  List<String>? awards,  List<PerkModel>? perks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkplaceModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.location,_that.locationGeoPoint,_that.websiteUrl,_that.size,_that.motto,_that.jobIds,_that.imageUrl,_that.logoUrl,_that.awards,_that.perks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  String location, @GeoPointConverter()  GeoPoint locationGeoPoint,  String? websiteUrl,  String size,  String motto,  List<String>? jobIds,  String imageUrl,  String logoUrl,  List<String>? awards,  List<PerkModel>? perks)  $default,) {final _that = this;
switch (_that) {
case _WorkplaceModel():
return $default(_that.id,_that.name,_that.description,_that.location,_that.locationGeoPoint,_that.websiteUrl,_that.size,_that.motto,_that.jobIds,_that.imageUrl,_that.logoUrl,_that.awards,_that.perks);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  String location, @GeoPointConverter()  GeoPoint locationGeoPoint,  String? websiteUrl,  String size,  String motto,  List<String>? jobIds,  String imageUrl,  String logoUrl,  List<String>? awards,  List<PerkModel>? perks)?  $default,) {final _that = this;
switch (_that) {
case _WorkplaceModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.location,_that.locationGeoPoint,_that.websiteUrl,_that.size,_that.motto,_that.jobIds,_that.imageUrl,_that.logoUrl,_that.awards,_that.perks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkplaceModel implements WorkplaceModel {
  const _WorkplaceModel({required this.id, required this.name, required this.description, required this.location, @GeoPointConverter() required this.locationGeoPoint, this.websiteUrl, required this.size, required this.motto, required final  List<String>? jobIds, required this.imageUrl, required this.logoUrl, final  List<String>? awards, final  List<PerkModel>? perks}): _jobIds = jobIds,_awards = awards,_perks = perks;
  factory _WorkplaceModel.fromJson(Map<String, dynamic> json) => _$WorkplaceModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String description;
@override final  String location;
@override@GeoPointConverter() final  GeoPoint locationGeoPoint;
@override final  String? websiteUrl;
@override final  String size;
@override final  String motto;
 final  List<String>? _jobIds;
@override List<String>? get jobIds {
  final value = _jobIds;
  if (value == null) return null;
  if (_jobIds is EqualUnmodifiableListView) return _jobIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String imageUrl;
@override final  String logoUrl;
 final  List<String>? _awards;
@override List<String>? get awards {
  final value = _awards;
  if (value == null) return null;
  if (_awards is EqualUnmodifiableListView) return _awards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<PerkModel>? _perks;
@override List<PerkModel>? get perks {
  final value = _perks;
  if (value == null) return null;
  if (_perks is EqualUnmodifiableListView) return _perks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of WorkplaceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkplaceModelCopyWith<_WorkplaceModel> get copyWith => __$WorkplaceModelCopyWithImpl<_WorkplaceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkplaceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkplaceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.location, location) || other.location == location)&&(identical(other.locationGeoPoint, locationGeoPoint) || other.locationGeoPoint == locationGeoPoint)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&(identical(other.size, size) || other.size == size)&&(identical(other.motto, motto) || other.motto == motto)&&const DeepCollectionEquality().equals(other._jobIds, _jobIds)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&const DeepCollectionEquality().equals(other._awards, _awards)&&const DeepCollectionEquality().equals(other._perks, _perks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,location,locationGeoPoint,websiteUrl,size,motto,const DeepCollectionEquality().hash(_jobIds),imageUrl,logoUrl,const DeepCollectionEquality().hash(_awards),const DeepCollectionEquality().hash(_perks));

@override
String toString() {
  return 'WorkplaceModel(id: $id, name: $name, description: $description, location: $location, locationGeoPoint: $locationGeoPoint, websiteUrl: $websiteUrl, size: $size, motto: $motto, jobIds: $jobIds, imageUrl: $imageUrl, logoUrl: $logoUrl, awards: $awards, perks: $perks)';
}


}

/// @nodoc
abstract mixin class _$WorkplaceModelCopyWith<$Res> implements $WorkplaceModelCopyWith<$Res> {
  factory _$WorkplaceModelCopyWith(_WorkplaceModel value, $Res Function(_WorkplaceModel) _then) = __$WorkplaceModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, String location,@GeoPointConverter() GeoPoint locationGeoPoint, String? websiteUrl, String size, String motto, List<String>? jobIds, String imageUrl, String logoUrl, List<String>? awards, List<PerkModel>? perks
});




}
/// @nodoc
class __$WorkplaceModelCopyWithImpl<$Res>
    implements _$WorkplaceModelCopyWith<$Res> {
  __$WorkplaceModelCopyWithImpl(this._self, this._then);

  final _WorkplaceModel _self;
  final $Res Function(_WorkplaceModel) _then;

/// Create a copy of WorkplaceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? location = null,Object? locationGeoPoint = null,Object? websiteUrl = freezed,Object? size = null,Object? motto = null,Object? jobIds = freezed,Object? imageUrl = null,Object? logoUrl = null,Object? awards = freezed,Object? perks = freezed,}) {
  return _then(_WorkplaceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,locationGeoPoint: null == locationGeoPoint ? _self.locationGeoPoint : locationGeoPoint // ignore: cast_nullable_to_non_nullable
as GeoPoint,websiteUrl: freezed == websiteUrl ? _self.websiteUrl : websiteUrl // ignore: cast_nullable_to_non_nullable
as String?,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as String,motto: null == motto ? _self.motto : motto // ignore: cast_nullable_to_non_nullable
as String,jobIds: freezed == jobIds ? _self._jobIds : jobIds // ignore: cast_nullable_to_non_nullable
as List<String>?,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,logoUrl: null == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String,awards: freezed == awards ? _self._awards : awards // ignore: cast_nullable_to_non_nullable
as List<String>?,perks: freezed == perks ? _self._perks : perks // ignore: cast_nullable_to_non_nullable
as List<PerkModel>?,
  ));
}


}


/// @nodoc
mixin _$PerkModel {

 String get title; String get description; String get iconUrl;
/// Create a copy of PerkModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PerkModelCopyWith<PerkModel> get copyWith => _$PerkModelCopyWithImpl<PerkModel>(this as PerkModel, _$identity);

  /// Serializes this PerkModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PerkModel&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,iconUrl);

@override
String toString() {
  return 'PerkModel(title: $title, description: $description, iconUrl: $iconUrl)';
}


}

/// @nodoc
abstract mixin class $PerkModelCopyWith<$Res>  {
  factory $PerkModelCopyWith(PerkModel value, $Res Function(PerkModel) _then) = _$PerkModelCopyWithImpl;
@useResult
$Res call({
 String title, String description, String iconUrl
});




}
/// @nodoc
class _$PerkModelCopyWithImpl<$Res>
    implements $PerkModelCopyWith<$Res> {
  _$PerkModelCopyWithImpl(this._self, this._then);

  final PerkModel _self;
  final $Res Function(PerkModel) _then;

/// Create a copy of PerkModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = null,Object? iconUrl = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PerkModel].
extension PerkModelPatterns on PerkModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PerkModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PerkModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PerkModel value)  $default,){
final _that = this;
switch (_that) {
case _PerkModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PerkModel value)?  $default,){
final _that = this;
switch (_that) {
case _PerkModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String description,  String iconUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PerkModel() when $default != null:
return $default(_that.title,_that.description,_that.iconUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String description,  String iconUrl)  $default,) {final _that = this;
switch (_that) {
case _PerkModel():
return $default(_that.title,_that.description,_that.iconUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String description,  String iconUrl)?  $default,) {final _that = this;
switch (_that) {
case _PerkModel() when $default != null:
return $default(_that.title,_that.description,_that.iconUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PerkModel implements PerkModel {
  const _PerkModel({required this.title, required this.description, required this.iconUrl});
  factory _PerkModel.fromJson(Map<String, dynamic> json) => _$PerkModelFromJson(json);

@override final  String title;
@override final  String description;
@override final  String iconUrl;

/// Create a copy of PerkModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PerkModelCopyWith<_PerkModel> get copyWith => __$PerkModelCopyWithImpl<_PerkModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PerkModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PerkModel&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,iconUrl);

@override
String toString() {
  return 'PerkModel(title: $title, description: $description, iconUrl: $iconUrl)';
}


}

/// @nodoc
abstract mixin class _$PerkModelCopyWith<$Res> implements $PerkModelCopyWith<$Res> {
  factory _$PerkModelCopyWith(_PerkModel value, $Res Function(_PerkModel) _then) = __$PerkModelCopyWithImpl;
@override @useResult
$Res call({
 String title, String description, String iconUrl
});




}
/// @nodoc
class __$PerkModelCopyWithImpl<$Res>
    implements _$PerkModelCopyWith<$Res> {
  __$PerkModelCopyWithImpl(this._self, this._then);

  final _PerkModel _self;
  final $Res Function(_PerkModel) _then;

/// Create a copy of PerkModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,Object? iconUrl = null,}) {
  return _then(_PerkModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
