// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inbox_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InboxModel _$InboxModelFromJson(Map<String, dynamic> json) => _InboxModel(
  id: json['id'] as String,
  title: json['title'] as String,
  workplace: json['workplace'] as String,
  logoUrl: json['logoUrl'] as String,
  message: json['message'] as String,
  deadline: json['deadline'] as String,
  jobStatus: const JobStatusConverter().fromJson(json['jobStatus'] as String),
);

Map<String, dynamic> _$InboxModelToJson(_InboxModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'workplace': instance.workplace,
      'logoUrl': instance.logoUrl,
      'message': instance.message,
      'deadline': instance.deadline,
      'jobStatus': const JobStatusConverter().toJson(instance.jobStatus),
    };
