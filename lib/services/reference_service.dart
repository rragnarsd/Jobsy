import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codehatch/models/profile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Service class for managing user reference data in Firestore.
/// This service provides CRUD operations for reference records associated
/// with the current authenticated user. It stores reference data as an array
/// within the user's profile document in Firestore.
class ReferenceService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  /// Gets a reference to the current user's document in Firestore.
  /// Throws a [ReferenceException] if the user is not authenticated.
  Future<DocumentReference<Map<String, dynamic>>> _getUserDoc() async {
    final user = currentUser;
    if (user == null) throw Exception('User not authenticated');
    return _firestore.collection('users').doc(user.uid);
  }

  List<dynamic> _getReferenceList(DocumentSnapshot userDoc) {
    final data = userDoc.data() as Map<String, dynamic>? ?? {};
    return List<dynamic>.from(data['references'] ?? []);
  }

  Map<String, dynamic> _referenceToMap(ReferenceModel ref) => ref.toJson();

  /// Adds a new reference record to the user's profile.
  /// Throws a [ReferenceException] if validation fails or the operation fails.
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
      if (e is Exception) rethrow;
      throw Exception('Failed to add reference: $e');
    }
  }

  /// Retrieves all reference records for the current user.
  /// Returns an empty list if no reference records exist or if the user
  /// profile is not found. Throws a [ReferenceException] if the operation fails.
  Future<List<ReferenceModel>> getUserReferences() async {
    try {
      final userDocRef = await _getUserDoc();
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) return [];

      final referenceList = _getReferenceList(userDoc);

      return referenceList.map((ref) => ReferenceModel.fromJson(ref)).toList();
    } catch (e) {
      if (e is Exception) rethrow;
      throw Exception('Failed to get references: $e');
    }
  }

  /// Updates an existing reference record.
  /// Validates that all required fields are provided before updating the record.
  /// Throws a [ReferenceException] if validation fails or the operation fails.
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
      if (e is Exception) rethrow;
      throw Exception('Failed to update reference: $e');
    }
  }

  /// Deletes a reference record by its ID.
  /// Validates that the reference ID is provided.
  /// Throws a [ReferenceException] if validation fails or the operation fails.
  Future<void> deleteReference(String referenceId) async {
    if (referenceId.trim().isEmpty) {
      throw Exception('Reference ID is required');
    }

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
      if (e is Exception) rethrow;
      throw Exception('Failed to delete reference: $e');
    }
  }
}
