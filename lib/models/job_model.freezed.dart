// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JobModel {

 String get id; String get title; String get description; List<String> get responsibilities; List<String> get qualifications; List<LanguageSkill> get languageSkills;@JobTypeConverter() JobType get jobType; List<String> get professions;@TimestampConverter() DateTime? get publishedDate;@TimestampConverter() DateTime? get deadline; String get workplaceId; double? get salary; bool get isRemote; String? get location;
/// Create a copy of JobModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobModelCopyWith<JobModel> get copyWith => _$JobModelCopyWithImpl<JobModel>(this as JobModel, _$identity);

  /// Serializes this JobModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.responsibilities, responsibilities)&&const DeepCollectionEquality().equals(other.qualifications, qualifications)&&const DeepCollectionEquality().equals(other.languageSkills, languageSkills)&&(identical(other.jobType, jobType) || other.jobType == jobType)&&const DeepCollectionEquality().equals(other.professions, professions)&&(identical(other.publishedDate, publishedDate) || other.publishedDate == publishedDate)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.workplaceId, workplaceId) || other.workplaceId == workplaceId)&&(identical(other.salary, salary) || other.salary == salary)&&(identical(other.isRemote, isRemote) || other.isRemote == isRemote)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,const DeepCollectionEquality().hash(responsibilities),const DeepCollectionEquality().hash(qualifications),const DeepCollectionEquality().hash(languageSkills),jobType,const DeepCollectionEquality().hash(professions),publishedDate,deadline,workplaceId,salary,isRemote,location);

@override
String toString() {
  return 'JobModel(id: $id, title: $title, description: $description, responsibilities: $responsibilities, qualifications: $qualifications, languageSkills: $languageSkills, jobType: $jobType, professions: $professions, publishedDate: $publishedDate, deadline: $deadline, workplaceId: $workplaceId, salary: $salary, isRemote: $isRemote, location: $location)';
}


}

/// @nodoc
abstract mixin class $JobModelCopyWith<$Res>  {
  factory $JobModelCopyWith(JobModel value, $Res Function(JobModel) _then) = _$JobModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, List<String> responsibilities, List<String> qualifications, List<LanguageSkill> languageSkills,@JobTypeConverter() JobType jobType, List<String> professions,@TimestampConverter() DateTime? publishedDate,@TimestampConverter() DateTime? deadline, String workplaceId, double? salary, bool isRemote, String? location
});




}
/// @nodoc
class _$JobModelCopyWithImpl<$Res>
    implements $JobModelCopyWith<$Res> {
  _$JobModelCopyWithImpl(this._self, this._then);

  final JobModel _self;
  final $Res Function(JobModel) _then;

/// Create a copy of JobModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? responsibilities = null,Object? qualifications = null,Object? languageSkills = null,Object? jobType = null,Object? professions = null,Object? publishedDate = freezed,Object? deadline = freezed,Object? workplaceId = null,Object? salary = freezed,Object? isRemote = null,Object? location = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,responsibilities: null == responsibilities ? _self.responsibilities : responsibilities // ignore: cast_nullable_to_non_nullable
as List<String>,qualifications: null == qualifications ? _self.qualifications : qualifications // ignore: cast_nullable_to_non_nullable
as List<String>,languageSkills: null == languageSkills ? _self.languageSkills : languageSkills // ignore: cast_nullable_to_non_nullable
as List<LanguageSkill>,jobType: null == jobType ? _self.jobType : jobType // ignore: cast_nullable_to_non_nullable
as JobType,professions: null == professions ? _self.professions : professions // ignore: cast_nullable_to_non_nullable
as List<String>,publishedDate: freezed == publishedDate ? _self.publishedDate : publishedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,deadline: freezed == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as DateTime?,workplaceId: null == workplaceId ? _self.workplaceId : workplaceId // ignore: cast_nullable_to_non_nullable
as String,salary: freezed == salary ? _self.salary : salary // ignore: cast_nullable_to_non_nullable
as double?,isRemote: null == isRemote ? _self.isRemote : isRemote // ignore: cast_nullable_to_non_nullable
as bool,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [JobModel].
extension JobModelPatterns on JobModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobModel value)  $default,){
final _that = this;
switch (_that) {
case _JobModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobModel value)?  $default,){
final _that = this;
switch (_that) {
case _JobModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description,  List<String> responsibilities,  List<String> qualifications,  List<LanguageSkill> languageSkills, @JobTypeConverter()  JobType jobType,  List<String> professions, @TimestampConverter()  DateTime? publishedDate, @TimestampConverter()  DateTime? deadline,  String workplaceId,  double? salary,  bool isRemote,  String? location)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.responsibilities,_that.qualifications,_that.languageSkills,_that.jobType,_that.professions,_that.publishedDate,_that.deadline,_that.workplaceId,_that.salary,_that.isRemote,_that.location);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description,  List<String> responsibilities,  List<String> qualifications,  List<LanguageSkill> languageSkills, @JobTypeConverter()  JobType jobType,  List<String> professions, @TimestampConverter()  DateTime? publishedDate, @TimestampConverter()  DateTime? deadline,  String workplaceId,  double? salary,  bool isRemote,  String? location)  $default,) {final _that = this;
switch (_that) {
case _JobModel():
return $default(_that.id,_that.title,_that.description,_that.responsibilities,_that.qualifications,_that.languageSkills,_that.jobType,_that.professions,_that.publishedDate,_that.deadline,_that.workplaceId,_that.salary,_that.isRemote,_that.location);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description,  List<String> responsibilities,  List<String> qualifications,  List<LanguageSkill> languageSkills, @JobTypeConverter()  JobType jobType,  List<String> professions, @TimestampConverter()  DateTime? publishedDate, @TimestampConverter()  DateTime? deadline,  String workplaceId,  double? salary,  bool isRemote,  String? location)?  $default,) {final _that = this;
switch (_that) {
case _JobModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.responsibilities,_that.qualifications,_that.languageSkills,_that.jobType,_that.professions,_that.publishedDate,_that.deadline,_that.workplaceId,_that.salary,_that.isRemote,_that.location);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobModel implements JobModel {
  const _JobModel({required this.id, required this.title, required this.description, required final  List<String> responsibilities, required final  List<String> qualifications, required final  List<LanguageSkill> languageSkills, @JobTypeConverter() required this.jobType, required final  List<String> professions, @TimestampConverter() this.publishedDate, @TimestampConverter() this.deadline, required this.workplaceId, this.salary, this.isRemote = false, this.location}): _responsibilities = responsibilities,_qualifications = qualifications,_languageSkills = languageSkills,_professions = professions;
  factory _JobModel.fromJson(Map<String, dynamic> json) => _$JobModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String description;
 final  List<String> _responsibilities;
@override List<String> get responsibilities {
  if (_responsibilities is EqualUnmodifiableListView) return _responsibilities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_responsibilities);
}

 final  List<String> _qualifications;
@override List<String> get qualifications {
  if (_qualifications is EqualUnmodifiableListView) return _qualifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_qualifications);
}

 final  List<LanguageSkill> _languageSkills;
@override List<LanguageSkill> get languageSkills {
  if (_languageSkills is EqualUnmodifiableListView) return _languageSkills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_languageSkills);
}

@override@JobTypeConverter() final  JobType jobType;
 final  List<String> _professions;
@override List<String> get professions {
  if (_professions is EqualUnmodifiableListView) return _professions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_professions);
}

@override@TimestampConverter() final  DateTime? publishedDate;
@override@TimestampConverter() final  DateTime? deadline;
@override final  String workplaceId;
@override final  double? salary;
@override@JsonKey() final  bool isRemote;
@override final  String? location;

/// Create a copy of JobModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobModelCopyWith<_JobModel> get copyWith => __$JobModelCopyWithImpl<_JobModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._responsibilities, _responsibilities)&&const DeepCollectionEquality().equals(other._qualifications, _qualifications)&&const DeepCollectionEquality().equals(other._languageSkills, _languageSkills)&&(identical(other.jobType, jobType) || other.jobType == jobType)&&const DeepCollectionEquality().equals(other._professions, _professions)&&(identical(other.publishedDate, publishedDate) || other.publishedDate == publishedDate)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.workplaceId, workplaceId) || other.workplaceId == workplaceId)&&(identical(other.salary, salary) || other.salary == salary)&&(identical(other.isRemote, isRemote) || other.isRemote == isRemote)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,const DeepCollectionEquality().hash(_responsibilities),const DeepCollectionEquality().hash(_qualifications),const DeepCollectionEquality().hash(_languageSkills),jobType,const DeepCollectionEquality().hash(_professions),publishedDate,deadline,workplaceId,salary,isRemote,location);

@override
String toString() {
  return 'JobModel(id: $id, title: $title, description: $description, responsibilities: $responsibilities, qualifications: $qualifications, languageSkills: $languageSkills, jobType: $jobType, professions: $professions, publishedDate: $publishedDate, deadline: $deadline, workplaceId: $workplaceId, salary: $salary, isRemote: $isRemote, location: $location)';
}


}

/// @nodoc
abstract mixin class _$JobModelCopyWith<$Res> implements $JobModelCopyWith<$Res> {
  factory _$JobModelCopyWith(_JobModel value, $Res Function(_JobModel) _then) = __$JobModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, List<String> responsibilities, List<String> qualifications, List<LanguageSkill> languageSkills,@JobTypeConverter() JobType jobType, List<String> professions,@TimestampConverter() DateTime? publishedDate,@TimestampConverter() DateTime? deadline, String workplaceId, double? salary, bool isRemote, String? location
});




}
/// @nodoc
class __$JobModelCopyWithImpl<$Res>
    implements _$JobModelCopyWith<$Res> {
  __$JobModelCopyWithImpl(this._self, this._then);

  final _JobModel _self;
  final $Res Function(_JobModel) _then;

/// Create a copy of JobModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? responsibilities = null,Object? qualifications = null,Object? languageSkills = null,Object? jobType = null,Object? professions = null,Object? publishedDate = freezed,Object? deadline = freezed,Object? workplaceId = null,Object? salary = freezed,Object? isRemote = null,Object? location = freezed,}) {
  return _then(_JobModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,responsibilities: null == responsibilities ? _self._responsibilities : responsibilities // ignore: cast_nullable_to_non_nullable
as List<String>,qualifications: null == qualifications ? _self._qualifications : qualifications // ignore: cast_nullable_to_non_nullable
as List<String>,languageSkills: null == languageSkills ? _self._languageSkills : languageSkills // ignore: cast_nullable_to_non_nullable
as List<LanguageSkill>,jobType: null == jobType ? _self.jobType : jobType // ignore: cast_nullable_to_non_nullable
as JobType,professions: null == professions ? _self._professions : professions // ignore: cast_nullable_to_non_nullable
as List<String>,publishedDate: freezed == publishedDate ? _self.publishedDate : publishedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,deadline: freezed == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as DateTime?,workplaceId: null == workplaceId ? _self.workplaceId : workplaceId // ignore: cast_nullable_to_non_nullable
as String,salary: freezed == salary ? _self.salary : salary // ignore: cast_nullable_to_non_nullable
as double?,isRemote: null == isRemote ? _self.isRemote : isRemote // ignore: cast_nullable_to_non_nullable
as bool,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$LanguageSkill {

 String get title; String get flagUrl;
/// Create a copy of LanguageSkill
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LanguageSkillCopyWith<LanguageSkill> get copyWith => _$LanguageSkillCopyWithImpl<LanguageSkill>(this as LanguageSkill, _$identity);

  /// Serializes this LanguageSkill to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LanguageSkill&&(identical(other.title, title) || other.title == title)&&(identical(other.flagUrl, flagUrl) || other.flagUrl == flagUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,flagUrl);

@override
String toString() {
  return 'LanguageSkill(title: $title, flagUrl: $flagUrl)';
}


}

/// @nodoc
abstract mixin class $LanguageSkillCopyWith<$Res>  {
  factory $LanguageSkillCopyWith(LanguageSkill value, $Res Function(LanguageSkill) _then) = _$LanguageSkillCopyWithImpl;
@useResult
$Res call({
 String title, String flagUrl
});




}
/// @nodoc
class _$LanguageSkillCopyWithImpl<$Res>
    implements $LanguageSkillCopyWith<$Res> {
  _$LanguageSkillCopyWithImpl(this._self, this._then);

  final LanguageSkill _self;
  final $Res Function(LanguageSkill) _then;

/// Create a copy of LanguageSkill
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? flagUrl = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,flagUrl: null == flagUrl ? _self.flagUrl : flagUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LanguageSkill].
extension LanguageSkillPatterns on LanguageSkill {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LanguageSkill value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LanguageSkill() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LanguageSkill value)  $default,){
final _that = this;
switch (_that) {
case _LanguageSkill():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LanguageSkill value)?  $default,){
final _that = this;
switch (_that) {
case _LanguageSkill() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String flagUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LanguageSkill() when $default != null:
return $default(_that.title,_that.flagUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String flagUrl)  $default,) {final _that = this;
switch (_that) {
case _LanguageSkill():
return $default(_that.title,_that.flagUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String flagUrl)?  $default,) {final _that = this;
switch (_that) {
case _LanguageSkill() when $default != null:
return $default(_that.title,_that.flagUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LanguageSkill implements LanguageSkill {
  const _LanguageSkill({required this.title, required this.flagUrl});
  factory _LanguageSkill.fromJson(Map<String, dynamic> json) => _$LanguageSkillFromJson(json);

@override final  String title;
@override final  String flagUrl;

/// Create a copy of LanguageSkill
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LanguageSkillCopyWith<_LanguageSkill> get copyWith => __$LanguageSkillCopyWithImpl<_LanguageSkill>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LanguageSkillToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LanguageSkill&&(identical(other.title, title) || other.title == title)&&(identical(other.flagUrl, flagUrl) || other.flagUrl == flagUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,flagUrl);

@override
String toString() {
  return 'LanguageSkill(title: $title, flagUrl: $flagUrl)';
}


}

/// @nodoc
abstract mixin class _$LanguageSkillCopyWith<$Res> implements $LanguageSkillCopyWith<$Res> {
  factory _$LanguageSkillCopyWith(_LanguageSkill value, $Res Function(_LanguageSkill) _then) = __$LanguageSkillCopyWithImpl;
@override @useResult
$Res call({
 String title, String flagUrl
});




}
/// @nodoc
class __$LanguageSkillCopyWithImpl<$Res>
    implements _$LanguageSkillCopyWith<$Res> {
  __$LanguageSkillCopyWithImpl(this._self, this._then);

  final _LanguageSkill _self;
  final $Res Function(_LanguageSkill) _then;

/// Create a copy of LanguageSkill
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? flagUrl = null,}) {
  return _then(_LanguageSkill(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,flagUrl: null == flagUrl ? _self.flagUrl : flagUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
