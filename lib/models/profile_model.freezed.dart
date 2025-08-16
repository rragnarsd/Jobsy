// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileModel {

 String get id; String get name; String get phoneNumber;@TimestampConverter() DateTime get dateOfBirth; String get aboutYou; String get idNumber; List<JobExperienceModel> get jobExperience; List<EducationModel> get education; List<SkillsModel> get skills; List<LanguageModel> get languages; List<ReferenceModel> get references; List<LinkModel> get links; List<Favorites> get favorites; List<ApplicationModel> get applications;
/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileModelCopyWith<ProfileModel> get copyWith => _$ProfileModelCopyWithImpl<ProfileModel>(this as ProfileModel, _$identity);

  /// Serializes this ProfileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.aboutYou, aboutYou) || other.aboutYou == aboutYou)&&(identical(other.idNumber, idNumber) || other.idNumber == idNumber)&&const DeepCollectionEquality().equals(other.jobExperience, jobExperience)&&const DeepCollectionEquality().equals(other.education, education)&&const DeepCollectionEquality().equals(other.skills, skills)&&const DeepCollectionEquality().equals(other.languages, languages)&&const DeepCollectionEquality().equals(other.references, references)&&const DeepCollectionEquality().equals(other.links, links)&&const DeepCollectionEquality().equals(other.favorites, favorites)&&const DeepCollectionEquality().equals(other.applications, applications));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,phoneNumber,dateOfBirth,aboutYou,idNumber,const DeepCollectionEquality().hash(jobExperience),const DeepCollectionEquality().hash(education),const DeepCollectionEquality().hash(skills),const DeepCollectionEquality().hash(languages),const DeepCollectionEquality().hash(references),const DeepCollectionEquality().hash(links),const DeepCollectionEquality().hash(favorites),const DeepCollectionEquality().hash(applications));

@override
String toString() {
  return 'ProfileModel(id: $id, name: $name, phoneNumber: $phoneNumber, dateOfBirth: $dateOfBirth, aboutYou: $aboutYou, idNumber: $idNumber, jobExperience: $jobExperience, education: $education, skills: $skills, languages: $languages, references: $references, links: $links, favorites: $favorites, applications: $applications)';
}


}

/// @nodoc
abstract mixin class $ProfileModelCopyWith<$Res>  {
  factory $ProfileModelCopyWith(ProfileModel value, $Res Function(ProfileModel) _then) = _$ProfileModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String phoneNumber,@TimestampConverter() DateTime dateOfBirth, String aboutYou, String idNumber, List<JobExperienceModel> jobExperience, List<EducationModel> education, List<SkillsModel> skills, List<LanguageModel> languages, List<ReferenceModel> references, List<LinkModel> links, List<Favorites> favorites, List<ApplicationModel> applications
});




}
/// @nodoc
class _$ProfileModelCopyWithImpl<$Res>
    implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._self, this._then);

  final ProfileModel _self;
  final $Res Function(ProfileModel) _then;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? phoneNumber = null,Object? dateOfBirth = null,Object? aboutYou = null,Object? idNumber = null,Object? jobExperience = null,Object? education = null,Object? skills = null,Object? languages = null,Object? references = null,Object? links = null,Object? favorites = null,Object? applications = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,aboutYou: null == aboutYou ? _self.aboutYou : aboutYou // ignore: cast_nullable_to_non_nullable
as String,idNumber: null == idNumber ? _self.idNumber : idNumber // ignore: cast_nullable_to_non_nullable
as String,jobExperience: null == jobExperience ? _self.jobExperience : jobExperience // ignore: cast_nullable_to_non_nullable
as List<JobExperienceModel>,education: null == education ? _self.education : education // ignore: cast_nullable_to_non_nullable
as List<EducationModel>,skills: null == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as List<SkillsModel>,languages: null == languages ? _self.languages : languages // ignore: cast_nullable_to_non_nullable
as List<LanguageModel>,references: null == references ? _self.references : references // ignore: cast_nullable_to_non_nullable
as List<ReferenceModel>,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as List<LinkModel>,favorites: null == favorites ? _self.favorites : favorites // ignore: cast_nullable_to_non_nullable
as List<Favorites>,applications: null == applications ? _self.applications : applications // ignore: cast_nullable_to_non_nullable
as List<ApplicationModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileModel].
extension ProfileModelPatterns on ProfileModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileModel value)  $default,){
final _that = this;
switch (_that) {
case _ProfileModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String phoneNumber, @TimestampConverter()  DateTime dateOfBirth,  String aboutYou,  String idNumber,  List<JobExperienceModel> jobExperience,  List<EducationModel> education,  List<SkillsModel> skills,  List<LanguageModel> languages,  List<ReferenceModel> references,  List<LinkModel> links,  List<Favorites> favorites,  List<ApplicationModel> applications)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that.id,_that.name,_that.phoneNumber,_that.dateOfBirth,_that.aboutYou,_that.idNumber,_that.jobExperience,_that.education,_that.skills,_that.languages,_that.references,_that.links,_that.favorites,_that.applications);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String phoneNumber, @TimestampConverter()  DateTime dateOfBirth,  String aboutYou,  String idNumber,  List<JobExperienceModel> jobExperience,  List<EducationModel> education,  List<SkillsModel> skills,  List<LanguageModel> languages,  List<ReferenceModel> references,  List<LinkModel> links,  List<Favorites> favorites,  List<ApplicationModel> applications)  $default,) {final _that = this;
switch (_that) {
case _ProfileModel():
return $default(_that.id,_that.name,_that.phoneNumber,_that.dateOfBirth,_that.aboutYou,_that.idNumber,_that.jobExperience,_that.education,_that.skills,_that.languages,_that.references,_that.links,_that.favorites,_that.applications);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String phoneNumber, @TimestampConverter()  DateTime dateOfBirth,  String aboutYou,  String idNumber,  List<JobExperienceModel> jobExperience,  List<EducationModel> education,  List<SkillsModel> skills,  List<LanguageModel> languages,  List<ReferenceModel> references,  List<LinkModel> links,  List<Favorites> favorites,  List<ApplicationModel> applications)?  $default,) {final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that.id,_that.name,_that.phoneNumber,_that.dateOfBirth,_that.aboutYou,_that.idNumber,_that.jobExperience,_that.education,_that.skills,_that.languages,_that.references,_that.links,_that.favorites,_that.applications);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileModel implements ProfileModel {
  const _ProfileModel({required this.id, required this.name, required this.phoneNumber, @TimestampConverter() required this.dateOfBirth, required this.aboutYou, required this.idNumber, required final  List<JobExperienceModel> jobExperience, required final  List<EducationModel> education, required final  List<SkillsModel> skills, required final  List<LanguageModel> languages, required final  List<ReferenceModel> references, required final  List<LinkModel> links, required final  List<Favorites> favorites, required final  List<ApplicationModel> applications}): _jobExperience = jobExperience,_education = education,_skills = skills,_languages = languages,_references = references,_links = links,_favorites = favorites,_applications = applications;
  factory _ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String phoneNumber;
@override@TimestampConverter() final  DateTime dateOfBirth;
@override final  String aboutYou;
@override final  String idNumber;
 final  List<JobExperienceModel> _jobExperience;
@override List<JobExperienceModel> get jobExperience {
  if (_jobExperience is EqualUnmodifiableListView) return _jobExperience;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_jobExperience);
}

 final  List<EducationModel> _education;
@override List<EducationModel> get education {
  if (_education is EqualUnmodifiableListView) return _education;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_education);
}

 final  List<SkillsModel> _skills;
@override List<SkillsModel> get skills {
  if (_skills is EqualUnmodifiableListView) return _skills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_skills);
}

 final  List<LanguageModel> _languages;
@override List<LanguageModel> get languages {
  if (_languages is EqualUnmodifiableListView) return _languages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_languages);
}

 final  List<ReferenceModel> _references;
@override List<ReferenceModel> get references {
  if (_references is EqualUnmodifiableListView) return _references;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_references);
}

 final  List<LinkModel> _links;
@override List<LinkModel> get links {
  if (_links is EqualUnmodifiableListView) return _links;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_links);
}

 final  List<Favorites> _favorites;
@override List<Favorites> get favorites {
  if (_favorites is EqualUnmodifiableListView) return _favorites;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_favorites);
}

 final  List<ApplicationModel> _applications;
@override List<ApplicationModel> get applications {
  if (_applications is EqualUnmodifiableListView) return _applications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_applications);
}


/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileModelCopyWith<_ProfileModel> get copyWith => __$ProfileModelCopyWithImpl<_ProfileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.aboutYou, aboutYou) || other.aboutYou == aboutYou)&&(identical(other.idNumber, idNumber) || other.idNumber == idNumber)&&const DeepCollectionEquality().equals(other._jobExperience, _jobExperience)&&const DeepCollectionEquality().equals(other._education, _education)&&const DeepCollectionEquality().equals(other._skills, _skills)&&const DeepCollectionEquality().equals(other._languages, _languages)&&const DeepCollectionEquality().equals(other._references, _references)&&const DeepCollectionEquality().equals(other._links, _links)&&const DeepCollectionEquality().equals(other._favorites, _favorites)&&const DeepCollectionEquality().equals(other._applications, _applications));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,phoneNumber,dateOfBirth,aboutYou,idNumber,const DeepCollectionEquality().hash(_jobExperience),const DeepCollectionEquality().hash(_education),const DeepCollectionEquality().hash(_skills),const DeepCollectionEquality().hash(_languages),const DeepCollectionEquality().hash(_references),const DeepCollectionEquality().hash(_links),const DeepCollectionEquality().hash(_favorites),const DeepCollectionEquality().hash(_applications));

@override
String toString() {
  return 'ProfileModel(id: $id, name: $name, phoneNumber: $phoneNumber, dateOfBirth: $dateOfBirth, aboutYou: $aboutYou, idNumber: $idNumber, jobExperience: $jobExperience, education: $education, skills: $skills, languages: $languages, references: $references, links: $links, favorites: $favorites, applications: $applications)';
}


}

/// @nodoc
abstract mixin class _$ProfileModelCopyWith<$Res> implements $ProfileModelCopyWith<$Res> {
  factory _$ProfileModelCopyWith(_ProfileModel value, $Res Function(_ProfileModel) _then) = __$ProfileModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String phoneNumber,@TimestampConverter() DateTime dateOfBirth, String aboutYou, String idNumber, List<JobExperienceModel> jobExperience, List<EducationModel> education, List<SkillsModel> skills, List<LanguageModel> languages, List<ReferenceModel> references, List<LinkModel> links, List<Favorites> favorites, List<ApplicationModel> applications
});




}
/// @nodoc
class __$ProfileModelCopyWithImpl<$Res>
    implements _$ProfileModelCopyWith<$Res> {
  __$ProfileModelCopyWithImpl(this._self, this._then);

  final _ProfileModel _self;
  final $Res Function(_ProfileModel) _then;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? phoneNumber = null,Object? dateOfBirth = null,Object? aboutYou = null,Object? idNumber = null,Object? jobExperience = null,Object? education = null,Object? skills = null,Object? languages = null,Object? references = null,Object? links = null,Object? favorites = null,Object? applications = null,}) {
  return _then(_ProfileModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime,aboutYou: null == aboutYou ? _self.aboutYou : aboutYou // ignore: cast_nullable_to_non_nullable
as String,idNumber: null == idNumber ? _self.idNumber : idNumber // ignore: cast_nullable_to_non_nullable
as String,jobExperience: null == jobExperience ? _self._jobExperience : jobExperience // ignore: cast_nullable_to_non_nullable
as List<JobExperienceModel>,education: null == education ? _self._education : education // ignore: cast_nullable_to_non_nullable
as List<EducationModel>,skills: null == skills ? _self._skills : skills // ignore: cast_nullable_to_non_nullable
as List<SkillsModel>,languages: null == languages ? _self._languages : languages // ignore: cast_nullable_to_non_nullable
as List<LanguageModel>,references: null == references ? _self._references : references // ignore: cast_nullable_to_non_nullable
as List<ReferenceModel>,links: null == links ? _self._links : links // ignore: cast_nullable_to_non_nullable
as List<LinkModel>,favorites: null == favorites ? _self._favorites : favorites // ignore: cast_nullable_to_non_nullable
as List<Favorites>,applications: null == applications ? _self._applications : applications // ignore: cast_nullable_to_non_nullable
as List<ApplicationModel>,
  ));
}


}


/// @nodoc
mixin _$JobExperienceModel {

 String get id; String get jobTitle; String get companyName;@TimestampConverter() DateTime get startDate;@TimestampConverter() DateTime get endDate; String? get description;
/// Create a copy of JobExperienceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobExperienceModelCopyWith<JobExperienceModel> get copyWith => _$JobExperienceModelCopyWithImpl<JobExperienceModel>(this as JobExperienceModel, _$identity);

  /// Serializes this JobExperienceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobExperienceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.jobTitle, jobTitle) || other.jobTitle == jobTitle)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,jobTitle,companyName,startDate,endDate,description);

@override
String toString() {
  return 'JobExperienceModel(id: $id, jobTitle: $jobTitle, companyName: $companyName, startDate: $startDate, endDate: $endDate, description: $description)';
}


}

/// @nodoc
abstract mixin class $JobExperienceModelCopyWith<$Res>  {
  factory $JobExperienceModelCopyWith(JobExperienceModel value, $Res Function(JobExperienceModel) _then) = _$JobExperienceModelCopyWithImpl;
@useResult
$Res call({
 String id, String jobTitle, String companyName,@TimestampConverter() DateTime startDate,@TimestampConverter() DateTime endDate, String? description
});




}
/// @nodoc
class _$JobExperienceModelCopyWithImpl<$Res>
    implements $JobExperienceModelCopyWith<$Res> {
  _$JobExperienceModelCopyWithImpl(this._self, this._then);

  final JobExperienceModel _self;
  final $Res Function(JobExperienceModel) _then;

/// Create a copy of JobExperienceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? jobTitle = null,Object? companyName = null,Object? startDate = null,Object? endDate = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,jobTitle: null == jobTitle ? _self.jobTitle : jobTitle // ignore: cast_nullable_to_non_nullable
as String,companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [JobExperienceModel].
extension JobExperienceModelPatterns on JobExperienceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobExperienceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobExperienceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobExperienceModel value)  $default,){
final _that = this;
switch (_that) {
case _JobExperienceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobExperienceModel value)?  $default,){
final _that = this;
switch (_that) {
case _JobExperienceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String jobTitle,  String companyName, @TimestampConverter()  DateTime startDate, @TimestampConverter()  DateTime endDate,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobExperienceModel() when $default != null:
return $default(_that.id,_that.jobTitle,_that.companyName,_that.startDate,_that.endDate,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String jobTitle,  String companyName, @TimestampConverter()  DateTime startDate, @TimestampConverter()  DateTime endDate,  String? description)  $default,) {final _that = this;
switch (_that) {
case _JobExperienceModel():
return $default(_that.id,_that.jobTitle,_that.companyName,_that.startDate,_that.endDate,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String jobTitle,  String companyName, @TimestampConverter()  DateTime startDate, @TimestampConverter()  DateTime endDate,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _JobExperienceModel() when $default != null:
return $default(_that.id,_that.jobTitle,_that.companyName,_that.startDate,_that.endDate,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobExperienceModel implements JobExperienceModel {
  const _JobExperienceModel({required this.id, required this.jobTitle, required this.companyName, @TimestampConverter() required this.startDate, @TimestampConverter() required this.endDate, this.description});
  factory _JobExperienceModel.fromJson(Map<String, dynamic> json) => _$JobExperienceModelFromJson(json);

@override final  String id;
@override final  String jobTitle;
@override final  String companyName;
@override@TimestampConverter() final  DateTime startDate;
@override@TimestampConverter() final  DateTime endDate;
@override final  String? description;

/// Create a copy of JobExperienceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobExperienceModelCopyWith<_JobExperienceModel> get copyWith => __$JobExperienceModelCopyWithImpl<_JobExperienceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobExperienceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobExperienceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.jobTitle, jobTitle) || other.jobTitle == jobTitle)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,jobTitle,companyName,startDate,endDate,description);

@override
String toString() {
  return 'JobExperienceModel(id: $id, jobTitle: $jobTitle, companyName: $companyName, startDate: $startDate, endDate: $endDate, description: $description)';
}


}

/// @nodoc
abstract mixin class _$JobExperienceModelCopyWith<$Res> implements $JobExperienceModelCopyWith<$Res> {
  factory _$JobExperienceModelCopyWith(_JobExperienceModel value, $Res Function(_JobExperienceModel) _then) = __$JobExperienceModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String jobTitle, String companyName,@TimestampConverter() DateTime startDate,@TimestampConverter() DateTime endDate, String? description
});




}
/// @nodoc
class __$JobExperienceModelCopyWithImpl<$Res>
    implements _$JobExperienceModelCopyWith<$Res> {
  __$JobExperienceModelCopyWithImpl(this._self, this._then);

  final _JobExperienceModel _self;
  final $Res Function(_JobExperienceModel) _then;

/// Create a copy of JobExperienceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? jobTitle = null,Object? companyName = null,Object? startDate = null,Object? endDate = null,Object? description = freezed,}) {
  return _then(_JobExperienceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,jobTitle: null == jobTitle ? _self.jobTitle : jobTitle // ignore: cast_nullable_to_non_nullable
as String,companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$EducationModel {

 String get id; String get school; String get field; String get degree; String get yearStart; String get yearEnd;
/// Create a copy of EducationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EducationModelCopyWith<EducationModel> get copyWith => _$EducationModelCopyWithImpl<EducationModel>(this as EducationModel, _$identity);

  /// Serializes this EducationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EducationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.school, school) || other.school == school)&&(identical(other.field, field) || other.field == field)&&(identical(other.degree, degree) || other.degree == degree)&&(identical(other.yearStart, yearStart) || other.yearStart == yearStart)&&(identical(other.yearEnd, yearEnd) || other.yearEnd == yearEnd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,school,field,degree,yearStart,yearEnd);

@override
String toString() {
  return 'EducationModel(id: $id, school: $school, field: $field, degree: $degree, yearStart: $yearStart, yearEnd: $yearEnd)';
}


}

/// @nodoc
abstract mixin class $EducationModelCopyWith<$Res>  {
  factory $EducationModelCopyWith(EducationModel value, $Res Function(EducationModel) _then) = _$EducationModelCopyWithImpl;
@useResult
$Res call({
 String id, String school, String field, String degree, String yearStart, String yearEnd
});




}
/// @nodoc
class _$EducationModelCopyWithImpl<$Res>
    implements $EducationModelCopyWith<$Res> {
  _$EducationModelCopyWithImpl(this._self, this._then);

  final EducationModel _self;
  final $Res Function(EducationModel) _then;

/// Create a copy of EducationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? school = null,Object? field = null,Object? degree = null,Object? yearStart = null,Object? yearEnd = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,school: null == school ? _self.school : school // ignore: cast_nullable_to_non_nullable
as String,field: null == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as String,degree: null == degree ? _self.degree : degree // ignore: cast_nullable_to_non_nullable
as String,yearStart: null == yearStart ? _self.yearStart : yearStart // ignore: cast_nullable_to_non_nullable
as String,yearEnd: null == yearEnd ? _self.yearEnd : yearEnd // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [EducationModel].
extension EducationModelPatterns on EducationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EducationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EducationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EducationModel value)  $default,){
final _that = this;
switch (_that) {
case _EducationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EducationModel value)?  $default,){
final _that = this;
switch (_that) {
case _EducationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String school,  String field,  String degree,  String yearStart,  String yearEnd)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EducationModel() when $default != null:
return $default(_that.id,_that.school,_that.field,_that.degree,_that.yearStart,_that.yearEnd);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String school,  String field,  String degree,  String yearStart,  String yearEnd)  $default,) {final _that = this;
switch (_that) {
case _EducationModel():
return $default(_that.id,_that.school,_that.field,_that.degree,_that.yearStart,_that.yearEnd);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String school,  String field,  String degree,  String yearStart,  String yearEnd)?  $default,) {final _that = this;
switch (_that) {
case _EducationModel() when $default != null:
return $default(_that.id,_that.school,_that.field,_that.degree,_that.yearStart,_that.yearEnd);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EducationModel implements EducationModel {
  const _EducationModel({required this.id, required this.school, required this.field, required this.degree, required this.yearStart, required this.yearEnd});
  factory _EducationModel.fromJson(Map<String, dynamic> json) => _$EducationModelFromJson(json);

@override final  String id;
@override final  String school;
@override final  String field;
@override final  String degree;
@override final  String yearStart;
@override final  String yearEnd;

/// Create a copy of EducationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EducationModelCopyWith<_EducationModel> get copyWith => __$EducationModelCopyWithImpl<_EducationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EducationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EducationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.school, school) || other.school == school)&&(identical(other.field, field) || other.field == field)&&(identical(other.degree, degree) || other.degree == degree)&&(identical(other.yearStart, yearStart) || other.yearStart == yearStart)&&(identical(other.yearEnd, yearEnd) || other.yearEnd == yearEnd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,school,field,degree,yearStart,yearEnd);

@override
String toString() {
  return 'EducationModel(id: $id, school: $school, field: $field, degree: $degree, yearStart: $yearStart, yearEnd: $yearEnd)';
}


}

/// @nodoc
abstract mixin class _$EducationModelCopyWith<$Res> implements $EducationModelCopyWith<$Res> {
  factory _$EducationModelCopyWith(_EducationModel value, $Res Function(_EducationModel) _then) = __$EducationModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String school, String field, String degree, String yearStart, String yearEnd
});




}
/// @nodoc
class __$EducationModelCopyWithImpl<$Res>
    implements _$EducationModelCopyWith<$Res> {
  __$EducationModelCopyWithImpl(this._self, this._then);

  final _EducationModel _self;
  final $Res Function(_EducationModel) _then;

/// Create a copy of EducationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? school = null,Object? field = null,Object? degree = null,Object? yearStart = null,Object? yearEnd = null,}) {
  return _then(_EducationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,school: null == school ? _self.school : school // ignore: cast_nullable_to_non_nullable
as String,field: null == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as String,degree: null == degree ? _self.degree : degree // ignore: cast_nullable_to_non_nullable
as String,yearStart: null == yearStart ? _self.yearStart : yearStart // ignore: cast_nullable_to_non_nullable
as String,yearEnd: null == yearEnd ? _self.yearEnd : yearEnd // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ReferenceModel {

 String get id; String get name; String get jobTitle; String get email;
/// Create a copy of ReferenceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReferenceModelCopyWith<ReferenceModel> get copyWith => _$ReferenceModelCopyWithImpl<ReferenceModel>(this as ReferenceModel, _$identity);

  /// Serializes this ReferenceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReferenceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.jobTitle, jobTitle) || other.jobTitle == jobTitle)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,jobTitle,email);

@override
String toString() {
  return 'ReferenceModel(id: $id, name: $name, jobTitle: $jobTitle, email: $email)';
}


}

/// @nodoc
abstract mixin class $ReferenceModelCopyWith<$Res>  {
  factory $ReferenceModelCopyWith(ReferenceModel value, $Res Function(ReferenceModel) _then) = _$ReferenceModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String jobTitle, String email
});




}
/// @nodoc
class _$ReferenceModelCopyWithImpl<$Res>
    implements $ReferenceModelCopyWith<$Res> {
  _$ReferenceModelCopyWithImpl(this._self, this._then);

  final ReferenceModel _self;
  final $Res Function(ReferenceModel) _then;

/// Create a copy of ReferenceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? jobTitle = null,Object? email = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,jobTitle: null == jobTitle ? _self.jobTitle : jobTitle // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ReferenceModel].
extension ReferenceModelPatterns on ReferenceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReferenceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReferenceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReferenceModel value)  $default,){
final _that = this;
switch (_that) {
case _ReferenceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReferenceModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReferenceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String jobTitle,  String email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReferenceModel() when $default != null:
return $default(_that.id,_that.name,_that.jobTitle,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String jobTitle,  String email)  $default,) {final _that = this;
switch (_that) {
case _ReferenceModel():
return $default(_that.id,_that.name,_that.jobTitle,_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String jobTitle,  String email)?  $default,) {final _that = this;
switch (_that) {
case _ReferenceModel() when $default != null:
return $default(_that.id,_that.name,_that.jobTitle,_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReferenceModel implements ReferenceModel {
  const _ReferenceModel({required this.id, required this.name, required this.jobTitle, required this.email});
  factory _ReferenceModel.fromJson(Map<String, dynamic> json) => _$ReferenceModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String jobTitle;
@override final  String email;

/// Create a copy of ReferenceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReferenceModelCopyWith<_ReferenceModel> get copyWith => __$ReferenceModelCopyWithImpl<_ReferenceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReferenceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReferenceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.jobTitle, jobTitle) || other.jobTitle == jobTitle)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,jobTitle,email);

@override
String toString() {
  return 'ReferenceModel(id: $id, name: $name, jobTitle: $jobTitle, email: $email)';
}


}

/// @nodoc
abstract mixin class _$ReferenceModelCopyWith<$Res> implements $ReferenceModelCopyWith<$Res> {
  factory _$ReferenceModelCopyWith(_ReferenceModel value, $Res Function(_ReferenceModel) _then) = __$ReferenceModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String jobTitle, String email
});




}
/// @nodoc
class __$ReferenceModelCopyWithImpl<$Res>
    implements _$ReferenceModelCopyWith<$Res> {
  __$ReferenceModelCopyWithImpl(this._self, this._then);

  final _ReferenceModel _self;
  final $Res Function(_ReferenceModel) _then;

/// Create a copy of ReferenceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? jobTitle = null,Object? email = null,}) {
  return _then(_ReferenceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,jobTitle: null == jobTitle ? _self.jobTitle : jobTitle // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$LinkModel {

 String get id; String get site; String get media; String? get iconUrl;
/// Create a copy of LinkModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LinkModelCopyWith<LinkModel> get copyWith => _$LinkModelCopyWithImpl<LinkModel>(this as LinkModel, _$identity);

  /// Serializes this LinkModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LinkModel&&(identical(other.id, id) || other.id == id)&&(identical(other.site, site) || other.site == site)&&(identical(other.media, media) || other.media == media)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,site,media,iconUrl);

@override
String toString() {
  return 'LinkModel(id: $id, site: $site, media: $media, iconUrl: $iconUrl)';
}


}

/// @nodoc
abstract mixin class $LinkModelCopyWith<$Res>  {
  factory $LinkModelCopyWith(LinkModel value, $Res Function(LinkModel) _then) = _$LinkModelCopyWithImpl;
@useResult
$Res call({
 String id, String site, String media, String? iconUrl
});




}
/// @nodoc
class _$LinkModelCopyWithImpl<$Res>
    implements $LinkModelCopyWith<$Res> {
  _$LinkModelCopyWithImpl(this._self, this._then);

  final LinkModel _self;
  final $Res Function(LinkModel) _then;

/// Create a copy of LinkModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? site = null,Object? media = null,Object? iconUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,site: null == site ? _self.site : site // ignore: cast_nullable_to_non_nullable
as String,media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as String,iconUrl: freezed == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LinkModel].
extension LinkModelPatterns on LinkModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LinkModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LinkModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LinkModel value)  $default,){
final _that = this;
switch (_that) {
case _LinkModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LinkModel value)?  $default,){
final _that = this;
switch (_that) {
case _LinkModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String site,  String media,  String? iconUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LinkModel() when $default != null:
return $default(_that.id,_that.site,_that.media,_that.iconUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String site,  String media,  String? iconUrl)  $default,) {final _that = this;
switch (_that) {
case _LinkModel():
return $default(_that.id,_that.site,_that.media,_that.iconUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String site,  String media,  String? iconUrl)?  $default,) {final _that = this;
switch (_that) {
case _LinkModel() when $default != null:
return $default(_that.id,_that.site,_that.media,_that.iconUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LinkModel implements LinkModel {
  const _LinkModel({required this.id, required this.site, required this.media, this.iconUrl});
  factory _LinkModel.fromJson(Map<String, dynamic> json) => _$LinkModelFromJson(json);

@override final  String id;
@override final  String site;
@override final  String media;
@override final  String? iconUrl;

/// Create a copy of LinkModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LinkModelCopyWith<_LinkModel> get copyWith => __$LinkModelCopyWithImpl<_LinkModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LinkModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LinkModel&&(identical(other.id, id) || other.id == id)&&(identical(other.site, site) || other.site == site)&&(identical(other.media, media) || other.media == media)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,site,media,iconUrl);

@override
String toString() {
  return 'LinkModel(id: $id, site: $site, media: $media, iconUrl: $iconUrl)';
}


}

/// @nodoc
abstract mixin class _$LinkModelCopyWith<$Res> implements $LinkModelCopyWith<$Res> {
  factory _$LinkModelCopyWith(_LinkModel value, $Res Function(_LinkModel) _then) = __$LinkModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String site, String media, String? iconUrl
});




}
/// @nodoc
class __$LinkModelCopyWithImpl<$Res>
    implements _$LinkModelCopyWith<$Res> {
  __$LinkModelCopyWithImpl(this._self, this._then);

  final _LinkModel _self;
  final $Res Function(_LinkModel) _then;

/// Create a copy of LinkModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? site = null,Object? media = null,Object? iconUrl = freezed,}) {
  return _then(_LinkModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,site: null == site ? _self.site : site // ignore: cast_nullable_to_non_nullable
as String,media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as String,iconUrl: freezed == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SkillsModel {

 String get id; String get category; String get categoryItem;
/// Create a copy of SkillsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SkillsModelCopyWith<SkillsModel> get copyWith => _$SkillsModelCopyWithImpl<SkillsModel>(this as SkillsModel, _$identity);

  /// Serializes this SkillsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SkillsModel&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.categoryItem, categoryItem) || other.categoryItem == categoryItem));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,category,categoryItem);

@override
String toString() {
  return 'SkillsModel(id: $id, category: $category, categoryItem: $categoryItem)';
}


}

/// @nodoc
abstract mixin class $SkillsModelCopyWith<$Res>  {
  factory $SkillsModelCopyWith(SkillsModel value, $Res Function(SkillsModel) _then) = _$SkillsModelCopyWithImpl;
@useResult
$Res call({
 String id, String category, String categoryItem
});




}
/// @nodoc
class _$SkillsModelCopyWithImpl<$Res>
    implements $SkillsModelCopyWith<$Res> {
  _$SkillsModelCopyWithImpl(this._self, this._then);

  final SkillsModel _self;
  final $Res Function(SkillsModel) _then;

/// Create a copy of SkillsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? category = null,Object? categoryItem = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,categoryItem: null == categoryItem ? _self.categoryItem : categoryItem // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SkillsModel].
extension SkillsModelPatterns on SkillsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SkillsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SkillsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SkillsModel value)  $default,){
final _that = this;
switch (_that) {
case _SkillsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SkillsModel value)?  $default,){
final _that = this;
switch (_that) {
case _SkillsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String category,  String categoryItem)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SkillsModel() when $default != null:
return $default(_that.id,_that.category,_that.categoryItem);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String category,  String categoryItem)  $default,) {final _that = this;
switch (_that) {
case _SkillsModel():
return $default(_that.id,_that.category,_that.categoryItem);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String category,  String categoryItem)?  $default,) {final _that = this;
switch (_that) {
case _SkillsModel() when $default != null:
return $default(_that.id,_that.category,_that.categoryItem);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SkillsModel implements SkillsModel {
  const _SkillsModel({required this.id, required this.category, required this.categoryItem});
  factory _SkillsModel.fromJson(Map<String, dynamic> json) => _$SkillsModelFromJson(json);

@override final  String id;
@override final  String category;
@override final  String categoryItem;

/// Create a copy of SkillsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SkillsModelCopyWith<_SkillsModel> get copyWith => __$SkillsModelCopyWithImpl<_SkillsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SkillsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SkillsModel&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.categoryItem, categoryItem) || other.categoryItem == categoryItem));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,category,categoryItem);

@override
String toString() {
  return 'SkillsModel(id: $id, category: $category, categoryItem: $categoryItem)';
}


}

/// @nodoc
abstract mixin class _$SkillsModelCopyWith<$Res> implements $SkillsModelCopyWith<$Res> {
  factory _$SkillsModelCopyWith(_SkillsModel value, $Res Function(_SkillsModel) _then) = __$SkillsModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String category, String categoryItem
});




}
/// @nodoc
class __$SkillsModelCopyWithImpl<$Res>
    implements _$SkillsModelCopyWith<$Res> {
  __$SkillsModelCopyWithImpl(this._self, this._then);

  final _SkillsModel _self;
  final $Res Function(_SkillsModel) _then;

/// Create a copy of SkillsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? category = null,Object? categoryItem = null,}) {
  return _then(_SkillsModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,categoryItem: null == categoryItem ? _self.categoryItem : categoryItem // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$LanguageModel {

 String get id; String get name; String get level; String get flagCode; String get flagEmoji;
/// Create a copy of LanguageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LanguageModelCopyWith<LanguageModel> get copyWith => _$LanguageModelCopyWithImpl<LanguageModel>(this as LanguageModel, _$identity);

  /// Serializes this LanguageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LanguageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.level, level) || other.level == level)&&(identical(other.flagCode, flagCode) || other.flagCode == flagCode)&&(identical(other.flagEmoji, flagEmoji) || other.flagEmoji == flagEmoji));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,level,flagCode,flagEmoji);

@override
String toString() {
  return 'LanguageModel(id: $id, name: $name, level: $level, flagCode: $flagCode, flagEmoji: $flagEmoji)';
}


}

/// @nodoc
abstract mixin class $LanguageModelCopyWith<$Res>  {
  factory $LanguageModelCopyWith(LanguageModel value, $Res Function(LanguageModel) _then) = _$LanguageModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String level, String flagCode, String flagEmoji
});




}
/// @nodoc
class _$LanguageModelCopyWithImpl<$Res>
    implements $LanguageModelCopyWith<$Res> {
  _$LanguageModelCopyWithImpl(this._self, this._then);

  final LanguageModel _self;
  final $Res Function(LanguageModel) _then;

/// Create a copy of LanguageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? level = null,Object? flagCode = null,Object? flagEmoji = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,flagCode: null == flagCode ? _self.flagCode : flagCode // ignore: cast_nullable_to_non_nullable
as String,flagEmoji: null == flagEmoji ? _self.flagEmoji : flagEmoji // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LanguageModel].
extension LanguageModelPatterns on LanguageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LanguageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LanguageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LanguageModel value)  $default,){
final _that = this;
switch (_that) {
case _LanguageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LanguageModel value)?  $default,){
final _that = this;
switch (_that) {
case _LanguageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String level,  String flagCode,  String flagEmoji)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LanguageModel() when $default != null:
return $default(_that.id,_that.name,_that.level,_that.flagCode,_that.flagEmoji);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String level,  String flagCode,  String flagEmoji)  $default,) {final _that = this;
switch (_that) {
case _LanguageModel():
return $default(_that.id,_that.name,_that.level,_that.flagCode,_that.flagEmoji);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String level,  String flagCode,  String flagEmoji)?  $default,) {final _that = this;
switch (_that) {
case _LanguageModel() when $default != null:
return $default(_that.id,_that.name,_that.level,_that.flagCode,_that.flagEmoji);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LanguageModel implements LanguageModel {
  const _LanguageModel({required this.id, required this.name, required this.level, required this.flagCode, required this.flagEmoji});
  factory _LanguageModel.fromJson(Map<String, dynamic> json) => _$LanguageModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String level;
@override final  String flagCode;
@override final  String flagEmoji;

/// Create a copy of LanguageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LanguageModelCopyWith<_LanguageModel> get copyWith => __$LanguageModelCopyWithImpl<_LanguageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LanguageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LanguageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.level, level) || other.level == level)&&(identical(other.flagCode, flagCode) || other.flagCode == flagCode)&&(identical(other.flagEmoji, flagEmoji) || other.flagEmoji == flagEmoji));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,level,flagCode,flagEmoji);

@override
String toString() {
  return 'LanguageModel(id: $id, name: $name, level: $level, flagCode: $flagCode, flagEmoji: $flagEmoji)';
}


}

/// @nodoc
abstract mixin class _$LanguageModelCopyWith<$Res> implements $LanguageModelCopyWith<$Res> {
  factory _$LanguageModelCopyWith(_LanguageModel value, $Res Function(_LanguageModel) _then) = __$LanguageModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String level, String flagCode, String flagEmoji
});




}
/// @nodoc
class __$LanguageModelCopyWithImpl<$Res>
    implements _$LanguageModelCopyWith<$Res> {
  __$LanguageModelCopyWithImpl(this._self, this._then);

  final _LanguageModel _self;
  final $Res Function(_LanguageModel) _then;

/// Create a copy of LanguageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? level = null,Object? flagCode = null,Object? flagEmoji = null,}) {
  return _then(_LanguageModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,flagCode: null == flagCode ? _self.flagCode : flagCode // ignore: cast_nullable_to_non_nullable
as String,flagEmoji: null == flagEmoji ? _self.flagEmoji : flagEmoji // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Favorites {

 String get id; String get workplaceId;
/// Create a copy of Favorites
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoritesCopyWith<Favorites> get copyWith => _$FavoritesCopyWithImpl<Favorites>(this as Favorites, _$identity);

  /// Serializes this Favorites to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Favorites&&(identical(other.id, id) || other.id == id)&&(identical(other.workplaceId, workplaceId) || other.workplaceId == workplaceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,workplaceId);

@override
String toString() {
  return 'Favorites(id: $id, workplaceId: $workplaceId)';
}


}

/// @nodoc
abstract mixin class $FavoritesCopyWith<$Res>  {
  factory $FavoritesCopyWith(Favorites value, $Res Function(Favorites) _then) = _$FavoritesCopyWithImpl;
@useResult
$Res call({
 String id, String workplaceId
});




}
/// @nodoc
class _$FavoritesCopyWithImpl<$Res>
    implements $FavoritesCopyWith<$Res> {
  _$FavoritesCopyWithImpl(this._self, this._then);

  final Favorites _self;
  final $Res Function(Favorites) _then;

/// Create a copy of Favorites
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? workplaceId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,workplaceId: null == workplaceId ? _self.workplaceId : workplaceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Favorites].
extension FavoritesPatterns on Favorites {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Favorites value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Favorites() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Favorites value)  $default,){
final _that = this;
switch (_that) {
case _Favorites():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Favorites value)?  $default,){
final _that = this;
switch (_that) {
case _Favorites() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String workplaceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Favorites() when $default != null:
return $default(_that.id,_that.workplaceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String workplaceId)  $default,) {final _that = this;
switch (_that) {
case _Favorites():
return $default(_that.id,_that.workplaceId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String workplaceId)?  $default,) {final _that = this;
switch (_that) {
case _Favorites() when $default != null:
return $default(_that.id,_that.workplaceId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Favorites implements Favorites {
  const _Favorites({required this.id, required this.workplaceId});
  factory _Favorites.fromJson(Map<String, dynamic> json) => _$FavoritesFromJson(json);

@override final  String id;
@override final  String workplaceId;

/// Create a copy of Favorites
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FavoritesCopyWith<_Favorites> get copyWith => __$FavoritesCopyWithImpl<_Favorites>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FavoritesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Favorites&&(identical(other.id, id) || other.id == id)&&(identical(other.workplaceId, workplaceId) || other.workplaceId == workplaceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,workplaceId);

@override
String toString() {
  return 'Favorites(id: $id, workplaceId: $workplaceId)';
}


}

/// @nodoc
abstract mixin class _$FavoritesCopyWith<$Res> implements $FavoritesCopyWith<$Res> {
  factory _$FavoritesCopyWith(_Favorites value, $Res Function(_Favorites) _then) = __$FavoritesCopyWithImpl;
@override @useResult
$Res call({
 String id, String workplaceId
});




}
/// @nodoc
class __$FavoritesCopyWithImpl<$Res>
    implements _$FavoritesCopyWith<$Res> {
  __$FavoritesCopyWithImpl(this._self, this._then);

  final _Favorites _self;
  final $Res Function(_Favorites) _then;

/// Create a copy of Favorites
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? workplaceId = null,}) {
  return _then(_Favorites(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,workplaceId: null == workplaceId ? _self.workplaceId : workplaceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ApplicationModel {

 String get id; String get jobId; String get workplaceId; String get jobTitle; String get companyName; String get status;@TimestampConverter() DateTime get appliedDate;
/// Create a copy of ApplicationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicationModelCopyWith<ApplicationModel> get copyWith => _$ApplicationModelCopyWithImpl<ApplicationModel>(this as ApplicationModel, _$identity);

  /// Serializes this ApplicationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.workplaceId, workplaceId) || other.workplaceId == workplaceId)&&(identical(other.jobTitle, jobTitle) || other.jobTitle == jobTitle)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.status, status) || other.status == status)&&(identical(other.appliedDate, appliedDate) || other.appliedDate == appliedDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,jobId,workplaceId,jobTitle,companyName,status,appliedDate);

@override
String toString() {
  return 'ApplicationModel(id: $id, jobId: $jobId, workplaceId: $workplaceId, jobTitle: $jobTitle, companyName: $companyName, status: $status, appliedDate: $appliedDate)';
}


}

/// @nodoc
abstract mixin class $ApplicationModelCopyWith<$Res>  {
  factory $ApplicationModelCopyWith(ApplicationModel value, $Res Function(ApplicationModel) _then) = _$ApplicationModelCopyWithImpl;
@useResult
$Res call({
 String id, String jobId, String workplaceId, String jobTitle, String companyName, String status,@TimestampConverter() DateTime appliedDate
});




}
/// @nodoc
class _$ApplicationModelCopyWithImpl<$Res>
    implements $ApplicationModelCopyWith<$Res> {
  _$ApplicationModelCopyWithImpl(this._self, this._then);

  final ApplicationModel _self;
  final $Res Function(ApplicationModel) _then;

/// Create a copy of ApplicationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? jobId = null,Object? workplaceId = null,Object? jobTitle = null,Object? companyName = null,Object? status = null,Object? appliedDate = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as String,workplaceId: null == workplaceId ? _self.workplaceId : workplaceId // ignore: cast_nullable_to_non_nullable
as String,jobTitle: null == jobTitle ? _self.jobTitle : jobTitle // ignore: cast_nullable_to_non_nullable
as String,companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,appliedDate: null == appliedDate ? _self.appliedDate : appliedDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ApplicationModel].
extension ApplicationModelPatterns on ApplicationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApplicationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApplicationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApplicationModel value)  $default,){
final _that = this;
switch (_that) {
case _ApplicationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApplicationModel value)?  $default,){
final _that = this;
switch (_that) {
case _ApplicationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String jobId,  String workplaceId,  String jobTitle,  String companyName,  String status, @TimestampConverter()  DateTime appliedDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApplicationModel() when $default != null:
return $default(_that.id,_that.jobId,_that.workplaceId,_that.jobTitle,_that.companyName,_that.status,_that.appliedDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String jobId,  String workplaceId,  String jobTitle,  String companyName,  String status, @TimestampConverter()  DateTime appliedDate)  $default,) {final _that = this;
switch (_that) {
case _ApplicationModel():
return $default(_that.id,_that.jobId,_that.workplaceId,_that.jobTitle,_that.companyName,_that.status,_that.appliedDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String jobId,  String workplaceId,  String jobTitle,  String companyName,  String status, @TimestampConverter()  DateTime appliedDate)?  $default,) {final _that = this;
switch (_that) {
case _ApplicationModel() when $default != null:
return $default(_that.id,_that.jobId,_that.workplaceId,_that.jobTitle,_that.companyName,_that.status,_that.appliedDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApplicationModel implements ApplicationModel {
  const _ApplicationModel({required this.id, required this.jobId, required this.workplaceId, required this.jobTitle, required this.companyName, required this.status, @TimestampConverter() required this.appliedDate});
  factory _ApplicationModel.fromJson(Map<String, dynamic> json) => _$ApplicationModelFromJson(json);

@override final  String id;
@override final  String jobId;
@override final  String workplaceId;
@override final  String jobTitle;
@override final  String companyName;
@override final  String status;
@override@TimestampConverter() final  DateTime appliedDate;

/// Create a copy of ApplicationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApplicationModelCopyWith<_ApplicationModel> get copyWith => __$ApplicationModelCopyWithImpl<_ApplicationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApplicationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApplicationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.workplaceId, workplaceId) || other.workplaceId == workplaceId)&&(identical(other.jobTitle, jobTitle) || other.jobTitle == jobTitle)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.status, status) || other.status == status)&&(identical(other.appliedDate, appliedDate) || other.appliedDate == appliedDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,jobId,workplaceId,jobTitle,companyName,status,appliedDate);

@override
String toString() {
  return 'ApplicationModel(id: $id, jobId: $jobId, workplaceId: $workplaceId, jobTitle: $jobTitle, companyName: $companyName, status: $status, appliedDate: $appliedDate)';
}


}

/// @nodoc
abstract mixin class _$ApplicationModelCopyWith<$Res> implements $ApplicationModelCopyWith<$Res> {
  factory _$ApplicationModelCopyWith(_ApplicationModel value, $Res Function(_ApplicationModel) _then) = __$ApplicationModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String jobId, String workplaceId, String jobTitle, String companyName, String status,@TimestampConverter() DateTime appliedDate
});




}
/// @nodoc
class __$ApplicationModelCopyWithImpl<$Res>
    implements _$ApplicationModelCopyWith<$Res> {
  __$ApplicationModelCopyWithImpl(this._self, this._then);

  final _ApplicationModel _self;
  final $Res Function(_ApplicationModel) _then;

/// Create a copy of ApplicationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? jobId = null,Object? workplaceId = null,Object? jobTitle = null,Object? companyName = null,Object? status = null,Object? appliedDate = null,}) {
  return _then(_ApplicationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as String,workplaceId: null == workplaceId ? _self.workplaceId : workplaceId // ignore: cast_nullable_to_non_nullable
as String,jobTitle: null == jobTitle ? _self.jobTitle : jobTitle // ignore: cast_nullable_to_non_nullable
as String,companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,appliedDate: null == appliedDate ? _self.appliedDate : appliedDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
