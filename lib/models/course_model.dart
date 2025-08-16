import 'package:codehatch/utils/extensions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_model.freezed.dart';
part 'course_model.g.dart';

class CourseTypesConverter implements JsonConverter<CourseTypes, String> {
  const CourseTypesConverter();

  @override
  CourseTypes fromJson(String json) {
    return CourseTypes.values.byName(json);
  }

  @override
  String toJson(CourseTypes courseType) => courseType.name;
}

class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  @override
  DateTime fromJson(String json) {
    return DateTime.parse(json);
  }

  @override
  String toJson(DateTime dateTime) => dateTime.toIso8601String();
}

@freezed
abstract class CourseModel with _$CourseModel {
  const factory CourseModel({
    required String id,
    required String title,
    required String businessName,
    @DateTimeConverter() required DateTime startDate,
    required int timeSpan,
    required double price,
    @CourseTypesConverter() required CourseTypes type,
    required String courseInfo,
    required List<String> categories,
    required String logoUrl,
    required String imageUrl,
  }) = _CourseModel;

  factory CourseModel.fromJson(Map<String, dynamic> json) =>
      _$CourseModelFromJson(json);
}
