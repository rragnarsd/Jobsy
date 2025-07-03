import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codehatch/models/profile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ReferenceService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  Future<DocumentReference<Map<String, dynamic>>> _getUserDoc() {
    final user = currentUser;
    if (user == null) throw Exception('User not authenticated');
    return Future.value(_firestore.collection('users').doc(user.uid));
  }

  List<dynamic> _getReferenceList(DocumentSnapshot userDoc) {
    final data = userDoc.data() as Map<String, dynamic>? ?? {};
    return List<dynamic>.from(data['references'] ?? []);
  }

  Map<String, dynamic> _referenceToMap(ReferenceModel ref) => {
    'id': ref.id,
    'name': ref.name,
    'jobTitle': ref.jobTitle,
    'email': ref.email,
  };

  Future<void> addReference(ReferenceModel reference) async {
    try {
      final userDocRef = await _getUserDoc();
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) throw Exception('User profile not found');

      final referenceList = _getReferenceList(userDoc);
      referenceList.add(_referenceToMap(reference));

      await userDocRef.update({
        'references': referenceList,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to add reference: $e');
    }
  }

  Future<List<ReferenceModel>> getUserReferences() async {
    try {
      final userDocRef = await _getUserDoc();
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) return [];

      final referenceList = _getReferenceList(userDoc);

      return referenceList.map((ref) {
        return ReferenceModel(
          id: ref['id'],
          name: ref['name'],
          jobTitle: ref['jobTitle'],
          email: ref['email'],
        );
      }).toList();
    } catch (e) {
      throw Exception('Failed to get references: $e');
    }
  }

  Future<void> updateReference(ReferenceModel reference) async {
    try {
      final userDocRef = await _getUserDoc();
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) throw Exception('User profile not found');

      final referenceList = _getReferenceList(userDoc);
      referenceList.removeWhere((r) => r['id'] == reference.id);
      referenceList.add(_referenceToMap(reference));

      await userDocRef.update({
        'references': referenceList,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to update reference: $e');
    }
  }

  Future<void> deleteReference(String referenceId) async {
    try {
      final userDocRef = await _getUserDoc();
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) throw Exception('User profile not found');

      final referenceList = _getReferenceList(userDoc);
      referenceList.removeWhere((r) => r['id'] == referenceId);

      await userDocRef.update({
        'references': referenceList,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to delete reference: $e');
    }
  }
}
