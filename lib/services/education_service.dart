import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codehatch/models/profile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EducationException implements Exception {
  final String message;
  EducationException(this.message);

  @override
  String toString() => message;
}

/// Service class for managing user education data in Firestore.
/// This service provides CRUD operations for education records associated
/// with the current authenticated user. It stores education data as an array
/// within the user's profile document in Firestore.
class EducationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  /// Gets a reference to the current user's document in Firestore.
  /// Throws an [EducationException] if the user is not authenticated.
  Future<DocumentReference<Map<String, dynamic>>> _getUserDoc() async {
    final user = currentUser;
    if (user == null) throw EducationException('User not authenticated');
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

  /// Adds a new education record to the user's profile.
  /// Throws an [EducationException] if validation fails or the operation fails.
  Future<void> addEducation(EducationModel education) async {
    try {
      final userDocRef = await _getUserDoc();
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) throw EducationException('User profile not found');

      final educationList = _getEducationList(userDoc);
      educationList.add(_educationToMap(education));

      await userDocRef.update({
        'education': educationList,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      if (e is EducationException) rethrow;
      throw EducationException('Failed to add education: $e');
    }
  }

  /// Retrieves all education records for the current user.
  /// Returns an empty list if no education records exist or if the user
  /// profile is not found. Throws an [EducationException] if the operation fails.
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
      if (e is EducationException) rethrow;
      throw EducationException('Failed to get education: $e');
    }
  }

  Future<void> updateEducation(EducationModel education) async {
    try {
      final userDocRef = await _getUserDoc();
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) throw EducationException('User profile not found');

      final educationList = _getEducationList(userDoc);

      final index = educationList.indexWhere(
        (edu) => edu['id'] == education.id,
      );

      if (index == -1) throw EducationException('Education not found');

      educationList[index] = _educationToMap(education);

      await userDocRef.update({
        'education': educationList,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      if (e is EducationException) rethrow;
      throw EducationException('Failed to update education: $e');
    }
  }

  Future<void> deleteEducation(String educationId) async {
    try {
      final userDocRef = await _getUserDoc();
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) throw EducationException('User profile not found');

      final educationList = _getEducationList(userDoc);
      educationList.removeWhere((edu) => edu['id'] == educationId);

      await userDocRef.update({
        'education': educationList,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      if (e is EducationException) rethrow;
      throw EducationException('Failed to delete education: $e');
    }
  }
}
