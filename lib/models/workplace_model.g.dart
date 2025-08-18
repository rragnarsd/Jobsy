// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workplace_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkplaceModel _$WorkplaceModelFromJson(
  Map<String, dynamic> json,
) => _WorkplaceModel(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  location: json['location'] as String,
  locationGeoPoint: const GeoPointConverter().fromJson(
    json['locationGeoPoint'],
  ),
  websiteUrl: json['websiteUrl'] as String?,
  size: json['size'] as String,
  motto: json['motto'] as String,
  jobIds: (json['jobIds'] as List<dynamic>?)?.map((e) => e as String).toList(),
  imageUrl: json['imageUrl'] as String,
  logoUrl: json['logoUrl'] as String,
  awards: (json['awards'] as List<dynamic>?)?.map((e) => e as String).toList(),
  perks: (json['perks'] as List<dynamic>?)
      ?.map((e) => PerkModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$WorkplaceModelToJson(_WorkplaceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'location': instance.location,
      'locationGeoPoint': const GeoPointConverter().toJson(
        instance.locationGeoPoint,
      ),
      'websiteUrl': instance.websiteUrl,
      'size': instance.size,
      'motto': instance.motto,
      'jobIds': instance.jobIds,
      'imageUrl': instance.imageUrl,
      'logoUrl': instance.logoUrl,
      'awards': instance.awards,
      'perks': instance.perks,
    };

_PerkModel _$PerkModelFromJson(Map<String, dynamic> json) => _PerkModel(
  title: json['title'] as String,
  description: json['description'] as String,
  iconUrl: json['iconUrl'] as String,
);

Map<String, dynamic> _$PerkModelToJson(_PerkModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'iconUrl': instance.iconUrl,
    };
