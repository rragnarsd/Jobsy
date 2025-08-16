// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) =>
    _ProfileModel(
      id: json['id'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      dateOfBirth: const TimestampConverter().fromJson(json['dateOfBirth']),
      aboutYou: json['aboutYou'] as String,
      idNumber: json['idNumber'] as String,
      jobExperience: (json['jobExperience'] as List<dynamic>)
          .map((e) => JobExperienceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      education: (json['education'] as List<dynamic>)
          .map((e) => EducationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      skills: (json['skills'] as List<dynamic>)
          .map((e) => SkillsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      languages: (json['languages'] as List<dynamic>)
          .map((e) => LanguageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      references: (json['references'] as List<dynamic>)
          .map((e) => ReferenceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: (json['links'] as List<dynamic>)
          .map((e) => LinkModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      favorites: (json['favorites'] as List<dynamic>)
          .map((e) => Favorites.fromJson(e as Map<String, dynamic>))
          .toList(),
      applications: (json['applications'] as List<dynamic>)
          .map((e) => ApplicationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProfileModelToJson(_ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'dateOfBirth': const TimestampConverter().toJson(instance.dateOfBirth),
      'aboutYou': instance.aboutYou,
      'idNumber': instance.idNumber,
      'jobExperience': instance.jobExperience,
      'education': instance.education,
      'skills': instance.skills,
      'languages': instance.languages,
      'references': instance.references,
      'links': instance.links,
      'favorites': instance.favorites,
      'applications': instance.applications,
    };

_JobExperienceModel _$JobExperienceModelFromJson(Map<String, dynamic> json) =>
    _JobExperienceModel(
      id: json['id'] as String,
      jobTitle: json['jobTitle'] as String,
      companyName: json['companyName'] as String,
      startDate: const TimestampConverter().fromJson(json['startDate']),
      endDate: const TimestampConverter().fromJson(json['endDate']),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$JobExperienceModelToJson(_JobExperienceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'jobTitle': instance.jobTitle,
      'companyName': instance.companyName,
      'startDate': const TimestampConverter().toJson(instance.startDate),
      'endDate': const TimestampConverter().toJson(instance.endDate),
      'description': instance.description,
    };

_EducationModel _$EducationModelFromJson(Map<String, dynamic> json) =>
    _EducationModel(
      id: json['id'] as String,
      school: json['school'] as String,
      field: json['field'] as String,
      degree: json['degree'] as String,
      yearStart: json['yearStart'] as String,
      yearEnd: json['yearEnd'] as String,
    );

Map<String, dynamic> _$EducationModelToJson(_EducationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'school': instance.school,
      'field': instance.field,
      'degree': instance.degree,
      'yearStart': instance.yearStart,
      'yearEnd': instance.yearEnd,
    };

_ReferenceModel _$ReferenceModelFromJson(Map<String, dynamic> json) =>
    _ReferenceModel(
      id: json['id'] as String,
      name: json['name'] as String,
      jobTitle: json['jobTitle'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$ReferenceModelToJson(_ReferenceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'jobTitle': instance.jobTitle,
      'email': instance.email,
    };

_LinkModel _$LinkModelFromJson(Map<String, dynamic> json) => _LinkModel(
  id: json['id'] as String,
  site: json['site'] as String,
  media: json['media'] as String,
  iconUrl: json['iconUrl'] as String?,
);

Map<String, dynamic> _$LinkModelToJson(_LinkModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'site': instance.site,
      'media': instance.media,
      'iconUrl': instance.iconUrl,
    };

_SkillsModel _$SkillsModelFromJson(Map<String, dynamic> json) => _SkillsModel(
  id: json['id'] as String,
  category: json['category'] as String,
  categoryItem: json['categoryItem'] as String,
);

Map<String, dynamic> _$SkillsModelToJson(_SkillsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'categoryItem': instance.categoryItem,
    };

_LanguageModel _$LanguageModelFromJson(Map<String, dynamic> json) =>
    _LanguageModel(
      id: json['id'] as String,
      name: json['name'] as String,
      level: json['level'] as String,
      flagCode: json['flagCode'] as String,
      flagEmoji: json['flagEmoji'] as String,
    );

Map<String, dynamic> _$LanguageModelToJson(_LanguageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'level': instance.level,
      'flagCode': instance.flagCode,
      'flagEmoji': instance.flagEmoji,
    };

_Favorites _$FavoritesFromJson(Map<String, dynamic> json) => _Favorites(
  id: json['id'] as String,
  workplaceId: json['workplaceId'] as String,
);

Map<String, dynamic> _$FavoritesToJson(_Favorites instance) =>
    <String, dynamic>{'id': instance.id, 'workplaceId': instance.workplaceId};

_ApplicationModel _$ApplicationModelFromJson(Map<String, dynamic> json) =>
    _ApplicationModel(
      id: json['id'] as String,
      jobId: json['jobId'] as String,
      workplaceId: json['workplaceId'] as String,
      jobTitle: json['jobTitle'] as String,
      companyName: json['companyName'] as String,
      status: json['status'] as String,
      appliedDate: const TimestampConverter().fromJson(json['appliedDate']),
    );

Map<String, dynamic> _$ApplicationModelToJson(_ApplicationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'jobId': instance.jobId,
      'workplaceId': instance.workplaceId,
      'jobTitle': instance.jobTitle,
      'companyName': instance.companyName,
      'status': instance.status,
      'appliedDate': const TimestampConverter().toJson(instance.appliedDate),
    };
