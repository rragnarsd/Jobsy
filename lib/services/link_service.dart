import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codehatch/models/link_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  Map<String, dynamic> _linkToMap(LinkModel link) => {
    'id': link.id,
    'site': link.site,
    'media': link.media,
  };

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
      throw Exception('Failed to add link: $e');
    }
  }

  Future<List<LinkModel>> getUserLinks() async {
    try {
      final userDocRef = await _getUserDoc();
      final userDoc = await userDocRef.get();

      if (!userDoc.exists) return [];

      final linkList = _getLinkList(userDoc);

      return linkList.map((link) {
        return LinkModel(
          id: link['id'],
          site: link['site'],
          media: link['media'],
        );
      }).toList();
    } catch (e) {
      throw Exception('Failed to get links: $e');
    }
  }

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
      throw Exception('Failed to update link: $e');
    }
  }

  Future<void> deleteLink(String linkId) async {
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
      throw Exception('Failed to delete link: $e');
    }
  }
}
