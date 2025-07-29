import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codehatch/models/profile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Custom exception for skills service operations.
class SkillsException implements Exception {
  final String message;
  SkillsException(this.message);

  @override
  String toString() => message;
}

/// Service class for managing user skills data in Firestore.
/// This service provides CRUD operations for skills records associated
/// with the current authenticated user. It stores skills data as an array
/// within the user's profile document in Firestore and provides streams
/// for real-time updates.
class SkillsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  /// Gets a reference to the current user's document in Firestore.
  /// Throws a [SkillsException] if the user is not authenticated.
  Future<DocumentReference<Map<String, dynamic>>> _getUserDoc() async {
    final user = currentUser;
    if (user == null) throw SkillsException('User not authenticated');
    return _firestore.collection('users').doc(user.uid);
  }

  /// Stream of all skills documents from the skills collection.
  /// Returns a stream of skills documents with their IDs and data.
  /// Throws a [SkillsException] if the operation fails.
  Stream<List<Map<String, dynamic>>> getSkillsDocumentsStream() {
    try {
      return _firestore.collection('skills').snapshots().map((snapshot) {
        return snapshot.docs.map((doc) {
          return {'id': doc.id, 'data': doc.data()};
        }).toList();
      });
    } catch (e) {
      throw SkillsException('Failed to get skills documents: $e');
    }
  }

  /// Stream of all main skills from the skills collection.
  /// Returns a stream of SkillsModel objects from the skills collection.
  /// Throws a [SkillsException] if the operation fails.
  Stream<List<SkillsModel>> getMainSkillsStream() {
    try {
      return _firestore.collection('skills').snapshots().map((snapshot) {
        return snapshot.docs
            .map((doc) => SkillsModel.fromJson(doc.data()))
            .toList();
      });
    } catch (e) {
      throw SkillsException('Failed to get main skills: $e');
    }
  }

  /// Stream of user's skills from their profile document.
  /// Returns a stream of SkillsModel objects from the current user's profile.
  /// Returns an empty stream if the user is not authenticated.
  /// Throws a [SkillsException] if the operation fails.
  Stream<List<SkillsModel>> getUserSkillsStream() {
    try {
      final user = currentUser;
      if (user == null) return Stream.value([]);

      return _firestore.collection('users').doc(user.uid).snapshots().map((
        doc,
      ) {
        final data = doc.data() ?? {};
        final skillsList = List<Map<String, dynamic>>.from(
          data['skills'] ?? [],
        );

        return skillsList
            .where(
              (json) =>
                  json['category'] != null && json['categoryItem'] != null,
            )
            .map((json) => SkillsModel.fromJson(json))
            .toList();
      });
    } catch (e) {
      throw SkillsException('Failed to get user skills: $e');
    }
  }

  /// Adds a skill to the current user's profile.
  /// Throws a [SkillsException] if validation fails or the operation fails.
  Future<void> addUserSkill(SkillsModel skill) async {
    try {
      final userDocRef = await _getUserDoc();
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) return;

      await userDocRef.update({
        'skills': FieldValue.arrayUnion([skill.toJson()]),
      });
    } catch (e) {
      if (e is SkillsException) rethrow;
      throw SkillsException('Failed to add user skill: $e');
    }
  }

  /// Removes a skill from the current user's profile.
  /// Throws a [SkillsException] if validation fails or the operation fails.
  Future<void> deleteUserSkill(SkillsModel skill) async {
    try {
      final userDocRef = await _getUserDoc();
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) return;

      await userDocRef.update({
        'skills': FieldValue.arrayRemove([skill.toJson()]),
      });
    } catch (e) {
      if (e is SkillsException) rethrow;
      throw SkillsException('Failed to delete user skill: $e');
    }
  }
}
