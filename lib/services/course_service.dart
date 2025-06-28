import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codehatch/models/course_model.dart';

class CourseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
