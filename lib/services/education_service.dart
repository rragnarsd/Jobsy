import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codehatch/models/profile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EducationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  Future<DocumentReference<Map<String, dynamic>>> _getUserDoc() async {
    final user = currentUser;
    if (user == null) throw Exception('User not authenticated');
    return _firestore.collection('users').doc(user.uid);
  }

  List<dynamic> _getEducationList(DocumentSnapshot userDoc) {
    final data = userDoc.data() as Map<String, dynamic>? ?? {};
    return List<dynamic>.from(data['education'] ?? []);
  }

  Map<String, dynamic> _educationToMap(EducationModel education) => {
    'id': education.id,
    'school': education.school,
    'field': education.field,
    'degree': education.degree,
    'yearStart': education.yearStart,
    'yearEnd': education.yearEnd,
  };

  Future<void> addEducation(EducationModel education) async {
    try {
      final userDocRef = await _getUserDoc();
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) throw Exception('User profile not found');

      final educationList = _getEducationList(userDoc);
      educationList.add(_educationToMap(education));

      await userDocRef.update({
        'education': educationList,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to add education: $e');
    }
  }

  Future<List<EducationModel>> getUserEducation() async {
    try {
      final userDocRef = await _getUserDoc();
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) return [];

      final educationList = _getEducationList(userDoc);

      return educationList.map((edu) {
        return EducationModel(
          id: edu['id'],
          school: edu['school'],
          field: edu['field'],
          degree: edu['degree'],
          yearStart: edu['yearStart'],
          yearEnd: edu['yearEnd'],
        );
      }).toList();
    } catch (e) {
      throw Exception('Failed to get education: $e');
    }
  }

  Future<void> updateEducation(EducationModel education) async {
    try {
      final userDocRef = await _getUserDoc();
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) throw Exception('User profile not found');

      final educationList = _getEducationList(userDoc);

      final index = educationList.indexWhere(
        (edu) => edu['id'] == education.id,
      );

      if (index == -1) throw Exception('Education not found');

      educationList[index] = _educationToMap(education);

      await userDocRef.update({
        'education': educationList,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to update education: $e');
    }
  }

  Future<void> deleteEducation(String educationId) async {
    try {
      final userDocRef = await _getUserDoc();
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) throw Exception('User profile not found');

      final educationList = _getEducationList(userDoc);
      educationList.removeWhere((edu) => edu['id'] == educationId);

      await userDocRef.update({
        'education': educationList,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to delete education: $e');
    }
  }
}
