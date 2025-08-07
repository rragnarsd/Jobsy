import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Service class for managing user favorite jobs in Firestore.
/// This service provides CRUD operations for favorite job IDs associated
/// with the current authenticated user. It stores favorite job IDs as an array
/// within the user's profile document in Firestore.
class FavoriteService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  /// Gets a reference to the current user's document in Firestore.
  /// Throws a [FavoriteException] if the user is not authenticated.
  Future<DocumentReference<Map<String, dynamic>>> _getUserDoc() async {
    final user = currentUser;
    if (user == null) throw Exception('User not authenticated');
    return _firestore.collection('users').doc(user.uid);
  }

  List<dynamic> _getFavorites(DocumentSnapshot userDoc) {
    final data = userDoc.data() as Map<String, dynamic>? ?? {};
    return List<dynamic>.from(data['favorites'] ?? []);
  }

  /// Retrieves all favorite job IDs for the current user.
  /// Returns an empty list if no favorites exist or if the user
  /// profile is not found. Throws a [FavoriteException] if the operation fails.
  Future<List<String>> getFavorites() async {
    try {
      final userDocRef = await _getUserDoc();
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) return [];

      final favorites = _getFavorites(userDoc);

      // Validate and filter out invalid entries
      return favorites
          .where(
            (favorite) => favorite != null && favorite.toString().isNotEmpty,
          )
          .map((favorite) => favorite.toString())
          .toList();
    } catch (e) {
      if (e is Exception) rethrow;
      throw Exception('Failed to get favorites: $e');
    }
  }

  /// Adds a job ID to the user's favorites list.
  /// Validates that the job ID is not empty before adding.
  /// Does not add duplicate job IDs. Throws a [FavoriteException] if validation fails or the operation fails.
  Future<void> addFavorite(String jobId) async {
    if (jobId.trim().isEmpty) {
      throw Exception('Job ID is required');
    }

    try {
      final userDocRef = await _getUserDoc();
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) throw Exception('User profile not found');

      final favorites = _getFavorites(userDoc);
      if (!favorites.contains(jobId)) {
        favorites.add(jobId);
        await userDocRef.update({'favorites': favorites});
      }
    } catch (e) {
      if (e is Exception) rethrow;
      throw Exception('Failed to add favorite: $e');
    }
  }

  Future<void> removeFavorite(String jobId) async {
    if (jobId.trim().isEmpty) {
      throw Exception('Job ID is required');
    }

    try {
      final userDocRef = await _getUserDoc();
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) throw Exception('User profile not found');

      final favorites = _getFavorites(userDoc);
      favorites.remove(jobId);

      await userDocRef.update({'favorites': favorites});
    } catch (e) {
      throw Exception('Failed to remove favorite: $e');
    }
  }

  /// Removes all favorite job IDs from the user's favorites list.
  /// Throws a [FavoriteException] if the operation fails.
  Future<void> deleteAllFavorites() async {
    try {
      final userDocRef = await _getUserDoc();
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) throw Exception('User profile not found');

      await userDocRef.update({'favorites': []});
    } catch (e) {
      throw Exception('Failed to delete all favorites: $e');
    }
  }
}
