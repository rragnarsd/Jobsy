// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CourseModel _$CourseModelFromJson(Map<String, dynamic> json) => _CourseModel(
  id: json['id'] as String,
  title: json['title'] as String,
  businessName: json['businessName'] as String,
  startDate: const DateTimeConverter().fromJson(json['startDate'] as String),
  timeSpan: (json['timeSpan'] as num).toInt(),
  price: (json['price'] as num).toDouble(),
  type: const CourseTypesConverter().fromJson(json['type'] as String),
  courseInfo: json['courseInfo'] as String,
  categories: (json['categories'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  logoUrl: json['logoUrl'] as String,
  imageUrl: json['imageUrl'] as String,
);

Map<String, dynamic> _$CourseModelToJson(_CourseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'businessName': instance.businessName,
      'startDate': const DateTimeConverter().toJson(instance.startDate),
      'timeSpan': instance.timeSpan,
      'price': instance.price,
      'type': const CourseTypesConverter().toJson(instance.type),
      'courseInfo': instance.courseInfo,
      'categories': instance.categories,
      'logoUrl': instance.logoUrl,
      'imageUrl': instance.imageUrl,
    };
