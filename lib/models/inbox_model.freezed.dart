// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inbox_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InboxModel {

 String get id; String get title; String get workplace; String get logoUrl; String get message; String get deadline;@JobStatusConverter() JobStatus get jobStatus;
/// Create a copy of InboxModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InboxModelCopyWith<InboxModel> get copyWith => _$InboxModelCopyWithImpl<InboxModel>(this as InboxModel, _$identity);

  /// Serializes this InboxModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InboxModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.workplace, workplace) || other.workplace == workplace)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.message, message) || other.message == message)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.jobStatus, jobStatus) || other.jobStatus == jobStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,workplace,logoUrl,message,deadline,jobStatus);

@override
String toString() {
  return 'InboxModel(id: $id, title: $title, workplace: $workplace, logoUrl: $logoUrl, message: $message, deadline: $deadline, jobStatus: $jobStatus)';
}


}

/// @nodoc
abstract mixin class $InboxModelCopyWith<$Res>  {
  factory $InboxModelCopyWith(InboxModel value, $Res Function(InboxModel) _then) = _$InboxModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String workplace, String logoUrl, String message, String deadline,@JobStatusConverter() JobStatus jobStatus
});




}
/// @nodoc
class _$InboxModelCopyWithImpl<$Res>
    implements $InboxModelCopyWith<$Res> {
  _$InboxModelCopyWithImpl(this._self, this._then);

  final InboxModel _self;
  final $Res Function(InboxModel) _then;

/// Create a copy of InboxModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? workplace = null,Object? logoUrl = null,Object? message = null,Object? deadline = null,Object? jobStatus = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,workplace: null == workplace ? _self.workplace : workplace // ignore: cast_nullable_to_non_nullable
as String,logoUrl: null == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,deadline: null == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as String,jobStatus: null == jobStatus ? _self.jobStatus : jobStatus // ignore: cast_nullable_to_non_nullable
as JobStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [InboxModel].
extension InboxModelPatterns on InboxModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InboxModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InboxModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InboxModel value)  $default,){
final _that = this;
switch (_that) {
case _InboxModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InboxModel value)?  $default,){
final _that = this;
switch (_that) {
case _InboxModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String workplace,  String logoUrl,  String message,  String deadline, @JobStatusConverter()  JobStatus jobStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InboxModel() when $default != null:
return $default(_that.id,_that.title,_that.workplace,_that.logoUrl,_that.message,_that.deadline,_that.jobStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String workplace,  String logoUrl,  String message,  String deadline, @JobStatusConverter()  JobStatus jobStatus)  $default,) {final _that = this;
switch (_that) {
case _InboxModel():
return $default(_that.id,_that.title,_that.workplace,_that.logoUrl,_that.message,_that.deadline,_that.jobStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String workplace,  String logoUrl,  String message,  String deadline, @JobStatusConverter()  JobStatus jobStatus)?  $default,) {final _that = this;
switch (_that) {
case _InboxModel() when $default != null:
return $default(_that.id,_that.title,_that.workplace,_that.logoUrl,_that.message,_that.deadline,_that.jobStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InboxModel implements InboxModel {
  const _InboxModel({required this.id, required this.title, required this.workplace, required this.logoUrl, required this.message, required this.deadline, @JobStatusConverter() required this.jobStatus});
  factory _InboxModel.fromJson(Map<String, dynamic> json) => _$InboxModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String workplace;
@override final  String logoUrl;
@override final  String message;
@override final  String deadline;
@override@JobStatusConverter() final  JobStatus jobStatus;

/// Create a copy of InboxModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InboxModelCopyWith<_InboxModel> get copyWith => __$InboxModelCopyWithImpl<_InboxModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InboxModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InboxModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.workplace, workplace) || other.workplace == workplace)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.message, message) || other.message == message)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.jobStatus, jobStatus) || other.jobStatus == jobStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,workplace,logoUrl,message,deadline,jobStatus);

@override
String toString() {
  return 'InboxModel(id: $id, title: $title, workplace: $workplace, logoUrl: $logoUrl, message: $message, deadline: $deadline, jobStatus: $jobStatus)';
}


}

/// @nodoc
abstract mixin class _$InboxModelCopyWith<$Res> implements $InboxModelCopyWith<$Res> {
  factory _$InboxModelCopyWith(_InboxModel value, $Res Function(_InboxModel) _then) = __$InboxModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String workplace, String logoUrl, String message, String deadline,@JobStatusConverter() JobStatus jobStatus
});




}
/// @nodoc
class __$InboxModelCopyWithImpl<$Res>
    implements _$InboxModelCopyWith<$Res> {
  __$InboxModelCopyWithImpl(this._self, this._then);

  final _InboxModel _self;
  final $Res Function(_InboxModel) _then;

/// Create a copy of InboxModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? workplace = null,Object? logoUrl = null,Object? message = null,Object? deadline = null,Object? jobStatus = null,}) {
  return _then(_InboxModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,workplace: null == workplace ? _self.workplace : workplace // ignore: cast_nullable_to_non_nullable
as String,logoUrl: null == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,deadline: null == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as String,jobStatus: null == jobStatus ? _self.jobStatus : jobStatus // ignore: cast_nullable_to_non_nullable
as JobStatus,
  ));
}


}

// dart format on
