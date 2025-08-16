import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codehatch/utils/extensions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_model.freezed.dart';
part 'job_model.g.dart';

class JobTypeConverter implements JsonConverter<JobType, String> {
  const JobTypeConverter();

  @override
  JobType fromJson(String json) {
    return JobType.values.firstWhere(
      (e) => e.englishValue == json,
      orElse: () => JobType.fullTime,
    );
  }

  @override
  String toJson(JobType jobType) => jobType.englishValue;
}

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
abstract class JobModel with _$JobModel {
  const factory JobModel({
    required String id,
    required String title,
    required String description,
    required List<String> responsibilities,
    required List<String> qualifications,
    required List<LanguageSkill> languageSkills,
    @JobTypeConverter() required JobType jobType,
    required List<String> professions,
    @TimestampConverter() DateTime? publishedDate,
    @TimestampConverter() DateTime? deadline,
    required String workplaceId,
    double? salary,
    @Default(false) bool isRemote,
    String? location,
  }) = _JobModel;

  factory JobModel.fromJson(Map<String, dynamic> json) =>
      _$JobModelFromJson(json);
}

@freezed
abstract class LanguageSkill with _$LanguageSkill {
  const factory LanguageSkill({
    required String title,
    required String flagUrl,
  }) = _LanguageSkill;

  factory LanguageSkill.fromJson(Map<String, dynamic> json) =>
      _$LanguageSkillFromJson(json);
}
