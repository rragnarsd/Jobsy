import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codehatch/pages/auth/auth_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? get currentUser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw AuthException('Failed to sign out.');
    }
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw AuthException(_getSignInError(e));
    } catch (e) {
      throw AuthException('An unexpected error occurred.');
    }
  }

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
    required String phoneNumber,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await saveUserProfile(name: name, phoneNumber: phoneNumber);
    } on FirebaseAuthException catch (e) {
      throw AuthException(_getSignUpError(e));
    } catch (e) {
      throw AuthException('An unexpected error occurred.');
    }
  }

  Future<void> saveUserProfile({
    required String name,
    required String phoneNumber,
  }) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        throw Exception('User not authenticated');
      }

      final userData = {
        'id': user.uid,
        'email': user.email,
        'name': name,
        'phoneNumber': phoneNumber,
        'aboutYou': '',
        'imageUrl': '',
        'jobExperience': [],
        'education': [],
        'skills': [],
        'languages': [],
        'references': [],
        'links': [],
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      };

      await _firestore.collection('users').doc(user.uid).set(userData);
    } catch (e) {
      throw Exception('Failed to save user profile: $e');
    }
  }

  Future<Map<String, dynamic>?> getUserProfile(String userId) async {
    try {
      final doc = await _firestore.collection('users').doc(userId).get();
      return doc.data();
    } catch (e) {
      throw Exception('Failed to get user profile: $e');
    }
  }

  Future<void> updateUserProfile(String uid, Map<String, dynamic> data) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).update(data);
  }

  Future<bool> userProfileExists(String userId) async {
    try {
      final doc = await _firestore.collection('users').doc(userId).get();
      return doc.exists;
    } catch (e) {
      return false;
    }
  }

  Future<void> resetPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw AuthException('Failed to send password reset email: ${e.message}');
    } catch (e) {
      throw AuthException('An unexpected error occurred.');
    }
  }

  Future<void> deleteAccount({
    required String email,
    required String password,
  }) async {
    try {
      AuthCredential credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );
      await currentUser?.reauthenticateWithCredential(credential);
      await currentUser?.delete();
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw AuthException('Failed to delete account: ${e.message}');
    } catch (e) {
      throw AuthException('An unexpected error occurred.');
    }
  }

  Future<void> resetPasswordFromCurrentPassword({
    required String currentPassword,
    required String newPassword,
    required String email,
  }) async {
    try {
      AuthCredential credential = EmailAuthProvider.credential(
        email: currentUser?.email ?? '',
        password: currentPassword,
      );
      await currentUser?.reauthenticateWithCredential(credential);
      await currentUser?.updatePassword(newPassword);
    } on FirebaseAuthException catch (e) {
      throw AuthException('Failed to reset password: ${e.message}');
    } catch (e) {
      throw AuthException('An unexpected error occurred.');
    }
  }

  String _getSignInError(FirebaseAuthException e) {
    return switch (e.code) {
      'user-not-found' => 'No user found for that email.',
      'wrong-password' => 'Wrong password provided.',
      'invalid-email' => 'The email address is invalid.',
      'user-disabled' => 'This user account has been disabled.',
      'too-many-requests' => 'Too many attempts. Please try again later.',
      'network-request-failed' => 'No internet connection.',
      _ => 'Authentication failed: ${e.message}',
    };
  }

  String _getSignUpError(FirebaseAuthException e) {
    return switch (e.code) {
      'weak-password' => 'The password is too weak.',
      'email-already-in-use' => 'An account already exists for this email.',
      'invalid-email' => 'Invalid email address.',
      'operation-not-allowed' => 'Email/password sign up is disabled.',
      'network-request-failed' => 'No internet connection.',
      _ => 'Registration failed: ${e.message}',
    };
  }
}
