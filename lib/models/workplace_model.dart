import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'workplace_model.freezed.dart';
part 'workplace_model.g.dart';

class GeoPointConverter implements JsonConverter<GeoPoint, dynamic> {
  const GeoPointConverter();

  @override
  GeoPoint fromJson(dynamic json) {
    if (json is GeoPoint) {
      return json;
    } else if (json is Map<String, dynamic>) {
      return GeoPoint(json['latitude'] as double, json['longitude'] as double);
    }
    throw FormatException('Invalid GeoPoint format: $json');
  }

  @override
  dynamic toJson(GeoPoint geoPoint) {
    return {'latitude': geoPoint.latitude, 'longitude': geoPoint.longitude};
  }
}

@freezed
abstract class WorkplaceModel with _$WorkplaceModel {
  const factory WorkplaceModel({
    required String id,
    required String name,
    required String description,
    required String location,
    @GeoPointConverter() required GeoPoint locationGeoPoint,
    String? websiteUrl,
    required String size,
    required String motto,
    required List<String>? jobIds,
    required String imageUrl,
    required String logoUrl,
    List<String>? awards,
    List<PerkModel>? perks,
  }) = _WorkplaceModel;

  factory WorkplaceModel.fromJson(Map<String, dynamic> json) =>
      _$WorkplaceModelFromJson(json);
}

@freezed
abstract class PerkModel with _$PerkModel {
  const factory PerkModel({
    required String title,
    required String description,
    required String iconUrl,
  }) = _PerkModel;

  factory PerkModel.fromJson(Map<String, dynamic> json) =>
      _$PerkModelFromJson(json);
}
