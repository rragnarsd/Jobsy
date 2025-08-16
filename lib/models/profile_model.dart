import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

class TimestampConverter implements JsonConverter<DateTime, dynamic> {
  const TimestampConverter();

  @override
  DateTime fromJson(dynamic json) {
    if (json is Timestamp) {
      return json.toDate();
    } else if (json is String) {
      return DateTime.parse(json);
    }
    throw FormatException('Invalid timestamp format: $json');
  }

  @override
  dynamic toJson(DateTime dateTime) => dateTime;
}

@freezed
abstract class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    required String id,
    required String name,
    required String phoneNumber,
    @TimestampConverter() required DateTime dateOfBirth,
    required String aboutYou,
    required String idNumber,
    required List<JobExperienceModel> jobExperience,
    required List<EducationModel> education,
    required List<SkillsModel> skills,
    required List<LanguageModel> languages,
    required List<ReferenceModel> references,
    required List<LinkModel> links,
    required List<Favorites> favorites,
    required List<ApplicationModel> applications,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}

@freezed
abstract class JobExperienceModel with _$JobExperienceModel {
  const factory JobExperienceModel({
    required String id,
    required String jobTitle,
    required String companyName,
    @TimestampConverter() required DateTime startDate,
    @TimestampConverter() required DateTime endDate,
    String? description,
  }) = _JobExperienceModel;

  factory JobExperienceModel.fromJson(Map<String, dynamic> json) =>
      _$JobExperienceModelFromJson(json);
}

@freezed
abstract class EducationModel with _$EducationModel {
  const factory EducationModel({
    required String id,
    required String school,
    required String field,
    required String degree,
    required String yearStart,
    required String yearEnd,
  }) = _EducationModel;

  factory EducationModel.fromJson(Map<String, dynamic> json) =>
      _$EducationModelFromJson(json);
}

@freezed
abstract class ReferenceModel with _$ReferenceModel {
  const factory ReferenceModel({
    required String id,
    required String name,
    required String jobTitle,
    required String email,
  }) = _ReferenceModel;

  factory ReferenceModel.fromJson(Map<String, dynamic> json) =>
      _$ReferenceModelFromJson(json);
}

@freezed
abstract class LinkModel with _$LinkModel {
  const factory LinkModel({
    required String id,
    required String site,
    required String media,
    String? iconUrl,
  }) = _LinkModel;

  factory LinkModel.fromJson(Map<String, dynamic> json) =>
      _$LinkModelFromJson(json);
}

@freezed
abstract class SkillsModel with _$SkillsModel {
  const factory SkillsModel({
    required String id,
    required String category,
    required String categoryItem,
  }) = _SkillsModel;

  factory SkillsModel.fromJson(Map<String, dynamic> json) =>
      _$SkillsModelFromJson(json);
}

@freezed
abstract class LanguageModel with _$LanguageModel {
  const factory LanguageModel({
    required String id,
    required String name,
    required String level,
    required String flagCode,
    required String flagEmoji,
  }) = _LanguageModel;

  factory LanguageModel.fromJson(Map<String, dynamic> json) =>
      _$LanguageModelFromJson(json);
}

@freezed
abstract class Favorites with _$Favorites {
  const factory Favorites({required String id, required String workplaceId}) =
      _Favorites;

  factory Favorites.fromJson(Map<String, dynamic> json) =>
      _$FavoritesFromJson(json);
}

@freezed
abstract class ApplicationModel with _$ApplicationModel {
  const factory ApplicationModel({
    required String id,
    required String jobId,
    required String workplaceId,
    required String jobTitle,
    required String companyName,
    required String status,
    @TimestampConverter() required DateTime appliedDate,
  }) = _ApplicationModel;

  factory ApplicationModel.fromJson(Map<String, dynamic> json) =>
      _$ApplicationModelFromJson(json);
}
