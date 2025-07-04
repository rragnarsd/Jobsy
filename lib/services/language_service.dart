import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codehatch/models/profile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LanguageService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  Future<DocumentReference<Map<String, dynamic>>> _getUserDoc() async {
    final user = currentUser;
    if (user == null) throw Exception('User not authenticated');
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

  Future<void> addLanguage(LanguageModel language) async {
    try {
      final userDocRef = await _getUserDoc();
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) throw Exception('User profile not found');

      final languageList = _getLanguageList(userDoc);
      languageList.add(_languageToMap(language));

      await userDocRef.update({
        'languages': languageList,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to add language: $e');
    }
  }

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
      throw Exception('Failed to get user languages: $e');
    }
  }

  Future<void> updateLanguage(LanguageModel language) async {
    try {
      final userDocRef = await _getUserDoc();
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) throw Exception('User profile not found');

      final languageList = _getLanguageList(userDoc);
      languageList.removeWhere((element) => element['id'] == language.id);
      languageList.add(_languageToMap(language));

      await userDocRef.update({
        'languages': languageList,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to update language: $e');
    }
  }

  Future<void> deleteLanguage(String languageId) async {
    try {
      final userDocRef = await _getUserDoc();
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) throw Exception('User profile not found');

      final languageList = _getLanguageList(userDoc);
      languageList.removeWhere((element) => element['id'] == languageId);

      await userDocRef.update({
        'languages': languageList,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Failed to delete language: $e');
    }
  }
}
