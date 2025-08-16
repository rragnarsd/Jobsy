// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobModel _$JobModelFromJson(Map<String, dynamic> json) => _JobModel(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  responsibilities: (json['responsibilities'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  qualifications: (json['qualifications'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  languageSkills: (json['languageSkills'] as List<dynamic>)
      .map((e) => LanguageSkill.fromJson(e as Map<String, dynamic>))
      .toList(),
  jobType: const JobTypeConverter().fromJson(json['jobType'] as String),
  professions: (json['professions'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  publishedDate: const TimestampConverter().fromJson(json['publishedDate']),
  deadline: const TimestampConverter().fromJson(json['deadline']),
  workplaceId: json['workplaceId'] as String,
  salary: (json['salary'] as num?)?.toDouble(),
  isRemote: json['isRemote'] as bool? ?? false,
  location: json['location'] as String?,
);

Map<String, dynamic> _$JobModelToJson(_JobModel instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'responsibilities': instance.responsibilities,
  'qualifications': instance.qualifications,
  'languageSkills': instance.languageSkills,
  'jobType': const JobTypeConverter().toJson(instance.jobType),
  'professions': instance.professions,
  'publishedDate': _$JsonConverterToJson<dynamic, DateTime>(
    instance.publishedDate,
    const TimestampConverter().toJson,
  ),
  'deadline': _$JsonConverterToJson<dynamic, DateTime>(
    instance.deadline,
    const TimestampConverter().toJson,
  ),
  'workplaceId': instance.workplaceId,
  'salary': instance.salary,
  'isRemote': instance.isRemote,
  'location': instance.location,
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);

_LanguageSkill _$LanguageSkillFromJson(Map<String, dynamic> json) =>
    _LanguageSkill(
      title: json['title'] as String,
      flagUrl: json['flagUrl'] as String,
    );

Map<String, dynamic> _$LanguageSkillToJson(_LanguageSkill instance) =>
    <String, dynamic>{'title': instance.title, 'flagUrl': instance.flagUrl};
