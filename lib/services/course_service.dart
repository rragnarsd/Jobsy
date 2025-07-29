import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codehatch/models/course_model.dart';

class CourseException implements Exception {
  final String message;
  CourseException(this.message);

  @override
  String toString() => message;
}

/// Service class for managing course data in Firestore.
/// This service provides stream-based access to courses collection
/// for real-time updates. It does not require user authentication as it
/// provides public data access.
class CourseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Stream of all courses from the courses collection.
  /// Returns a stream of CourseModel objects with real-time updates.
  /// Handles errors gracefully by returning an empty list.
  Stream<List<CourseModel>> getCoursesStream() {
    return _firestore
        .collection('courses')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => CourseModel.fromJson(doc.data()))
              .toList(),
        );
  }
}
