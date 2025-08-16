import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codehatch/models/profile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Service class for managing user link data in Firestore.
/// This service provides CRUD operations for link records associated
/// with the current authenticated user. It stores link data as an array
/// within the user's profile document in Firestore.
class LinkService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  Future<DocumentReference<Map<String, dynamic>>> _getUserDoc() async {
    final user = currentUser;
    if (user == null) throw Exception('User not authenticated');
    return _firestore.collection('users').doc(user.uid);
  }

  List<dynamic> _getLinkList(DocumentSnapshot userDoc) {
    final data = userDoc.data() as Map<String, dynamic>? ?? {};
    return List<dynamic>.from(data['links'] ?? []);
  }

  Map<String, dynamic> _linkToMap(LinkModel link) => link.toJson();

  /// Adds a new link record to the user's profile.
  /// Throws a [LinkException] if validation fails or the operation fails.
  Future<void> addLink(LinkModel link) async {
    try {
      final userDocRef = await _getUserDoc();
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) throw Exception('User profile not found');

      final linkList = _getLinkList(userDoc);
      linkList.add(_linkToMap(link));

      await userDocRef.update({
        'links': linkList,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      if (e is Exception) rethrow;
      throw Exception('Failed to add link: $e');
    }
  }

  /// Retrieves all link records for the current user.
  /// Returns an empty list if no link records exist or if the user
  /// profile is not found. Throws a [LinkException] if the operation fails.
  Future<List<LinkModel>> getUserLinks() async {
    try {
      final userDocRef = await _getUserDoc();
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) return [];

      final linkList = _getLinkList(userDoc);

      return linkList.map((link) => LinkModel.fromJson(link)).toList();
    } catch (e) {
      if (e is Exception) rethrow;
      throw Exception('Failed to get links: $e');
    }
  }

  /// Updates an existing link record.
  /// Throws a [LinkException] if validation fails or the operation fails.
  Future<void> updateLink(LinkModel link) async {
    try {
      final userDocRef = await _getUserDoc();
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) throw Exception('User profile not found');

      final linkList = _getLinkList(userDoc);
      linkList.removeWhere((element) => element['id'] == link.id);
      linkList.add(_linkToMap(link));

      await userDocRef.update({
        'links': linkList,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      if (e is Exception) rethrow;
      throw Exception('Failed to update link: $e');
    }
  }

  /// Deletes a link record by its ID.
  /// Validates that the link ID is provided.
  /// Throws a [LinkException] if validation fails or the operation fails.
  Future<void> deleteLink(String linkId) async {
    if (linkId.trim().isEmpty) {
      throw Exception('Link ID is required');
    }

    try {
      final userDocRef = await _getUserDoc();
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) throw Exception('User profile not found');

      final linkList = _getLinkList(userDoc);
      linkList.removeWhere((element) => element['id'] == linkId);

      await userDocRef.update({
        'links': linkList,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      if (e is Exception) rethrow;
      throw Exception('Failed to delete link: $e');
    }
  }
}
