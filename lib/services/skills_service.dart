import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codehatch/models/skills_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SkillsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  Future<DocumentReference<Map<String, dynamic>>> _getUserDoc() {
    final user = currentUser;
    if (user == null) throw Exception('User not authenticated');
    return Future.value(_firestore.collection('users').doc(user.uid));
  }

  Stream<List<Map<String, dynamic>>> getSkillsDocumentsStream() {
    try {
      return _firestore.collection('skills').snapshots().map((snapshot) {
        return snapshot.docs.map((doc) {
          return {'id': doc.id, 'data': doc.data()};
        }).toList();
      });
    } catch (e) {
      throw Exception('Failed to get skills documents: $e');
    }
  }

  Stream<List<SkillsModel>> getMainSkillsStream() {
    try {
      return _firestore.collection('skills').snapshots().map((snapshot) {
        return snapshot.docs
            .map((doc) => SkillsModel.fromJson(doc.data()))
            .toList();
      });
    } catch (e) {
      throw Exception('Failed to get main skills: $e');
    }
  }

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
        return skillsList.map((json) => SkillsModel.fromJson(json)).toList();
      });
    } catch (e) {
      throw Exception('Failed to get user skills: $e');
    }
  }

  Future<void> addUserSkill(SkillsModel skill) async {
    try {
      final userDocRef = await _getUserDoc();
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) return;

      await userDocRef.update({
        'skills': FieldValue.arrayUnion([skill.toJson()]),
      });
    } catch (e) {
      throw Exception('Failed to add user skill: $e');
    }
  }

  Future<void> deleteUserSkill(SkillsModel skill) async {
    try {
      final userDocRef = await _getUserDoc();
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) return;

      await userDocRef.update({
        'skills': FieldValue.arrayRemove([skill.toJson()]),
      });
    } catch (e) {
      throw Exception('Failed to delete user skill: $e');
    }
  }
}
