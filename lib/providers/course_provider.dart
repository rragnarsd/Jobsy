import 'package:codehatch/models/course_model.dart';
import 'package:codehatch/services/course_service.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class CourseProvider extends ChangeNotifier {
  List<CourseModel> _courses = [];

  final CourseService _courseService = CourseService();

  List<CourseModel> get courses => List.unmodifiable(_courses);

  Stream<List<CourseModel>> get coursesStream =>
      _courseService.getCoursesStream();

  void initializeStreams() {
    _courseService.getCoursesStream().listen((courses) {
      _courses = courses;
      notifyListeners();
    });
  }

  CourseModel? getCourseById(String id) {
    return _courses.firstWhereOrNull((course) => course.id == id);
  }
}
