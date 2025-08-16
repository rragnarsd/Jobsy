import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'workplace_model.freezed.dart';
part 'workplace_model.g.dart';

class GeoPointConverter
    implements JsonConverter<GeoPoint, Map<String, dynamic>> {
  const GeoPointConverter();

  @override
  GeoPoint fromJson(Map<String, dynamic> json) {
    return GeoPoint(json['latitude'] as double, json['longitude'] as double);
  }

  @override
  Map<String, dynamic> toJson(GeoPoint geoPoint) {
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
    required String websiteUrl,
    required String size,
    required String motto,
    required List<String> jobIds,
    String? imageUrl,
    String? logoUrl,
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
