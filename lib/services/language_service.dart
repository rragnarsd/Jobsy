import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codehatch/models/profile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LanguageException implements Exception {
  final String message;
  LanguageException(this.message);

  @override
  String toString() => message;
}

/// Service class for managing user language data in Firestore.
/// This service provides CRUD operations for language records associated
/// with the current authenticated user. It stores language data as an array
/// within the user's profile document in Firestore.
class LanguageService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  /// Gets a reference to the current user's document in Firestore.
  /// Throws a [LanguageException] if the user is not authenticated.
  Future<DocumentReference<Map<String, dynamic>>> _getUserDoc() async {
    final user = currentUser;
    if (user == null) throw LanguageException('User not authenticated');
    return _firestore.collection('users').doc(user.uid);
  }

  List<dynamic> _getLanguageList(DocumentSnapshot userDoc) {
    final data = userDoc.data() as Map<String, dynamic>? ?? {};
    return List<dynamic>.from(data['languages'] ?? []);
  }

  Map<String, dynamic> _languageToMap(LanguageModel language) => {
    'id': language.id,
    'name': language.name,
    'level': language.level,
    'flagCode': language.flagCode,
    'flagEmoji': language.flagEmoji,
  };

  /// Adds a new language record to the user's profile.
  /// Throws a [LanguageException] if validation fails or the operation fails.
  Future<void> addLanguage(LanguageModel language) async {
    try {
      final userDocRef = await _getUserDoc();
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) throw LanguageException('User profile not found');

      final languageList = _getLanguageList(userDoc);
      languageList.add(_languageToMap(language));

      await userDocRef.update({
        'languages': languageList,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      if (e is LanguageException) rethrow;
      throw LanguageException('Failed to add language: $e');
    }
  }

  /// Retrieves all language records for the current user.
  /// Returns an empty list if no language records exist or if the user
  /// profile is not found. Throws a [LanguageException] if the operation fails.
  Future<List<LanguageModel>> getUserLanguages() async {
    try {
      final userDocRef = await _getUserDoc();
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) return [];

      final languageList = _getLanguageList(userDoc);
      return languageList
          .map(
            (language) => LanguageModel(
              id: language['id'],
              name: language['name'] ?? language['language'] ?? '',
              level: language['level'],
              flagCode: language['flagCode'],
              flagEmoji: language['flagEmoji'] ?? '',
            ),
          )
          .toList();
    } catch (e) {
      if (e is LanguageException) rethrow;
      throw LanguageException('Failed to get user languages: $e');
    }
  }

  /// Updates an existing language record.
  /// Throws a [LanguageException] if validation fails or the operation fails.
  Future<void> updateLanguage(LanguageModel language) async {
    try {
      final userDocRef = await _getUserDoc();
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) throw LanguageException('User profile not found');

      final languageList = _getLanguageList(userDoc);
      languageList.removeWhere((element) => element['id'] == language.id);
      languageList.add(_languageToMap(language));

      await userDocRef.update({
        'languages': languageList,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      if (e is LanguageException) rethrow;
      throw LanguageException('Failed to update language: $e');
    }
  }

  /// Deletes a language record by its ID.
  /// Validates that the language ID is provided.
  /// Throws a [LanguageException] if validation fails or the operation fails.
  Future<void> deleteLanguage(String languageId) async {
    if (languageId.trim().isEmpty) {
      throw LanguageException('Language ID is required');
    }

    try {
      final userDocRef = await _getUserDoc();
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) throw LanguageException('User profile not found');

      final languageList = _getLanguageList(userDoc);
      languageList.removeWhere((element) => element['id'] == languageId);

      await userDocRef.update({
        'languages': languageList,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      if (e is LanguageException) rethrow;
      throw LanguageException('Failed to delete language: $e');
    }
  }
}
