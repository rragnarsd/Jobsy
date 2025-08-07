import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// This service provides methods for user authentication, profile management,
/// and password reset functionality. It integrates with Firebase Auth for
/// authentication and Firestore for user profile storage.
class AuthService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? get currentUser => _auth.currentUser;

  /// This stream emits the current user when authentication state changes,
  /// or null when the user signs out.
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// Checks if the current user is authenticated.
  /// Returns true if a user is signed in, false otherwise.
  bool get isAuthenticated => _auth.currentUser != null;

  /// Gets the current user's UID.
  /// Returns the user's UID if authenticated, null otherwise.
  String? get currentUserId => _auth.currentUser?.uid;

  /// Validates that the current user is authenticated.
  /// Throws an [AuthException] if no user is currently signed in.
  void _validateAuthentication() {
    if (!isAuthenticated) {
      throw Exception('User not authenticated');
    }
  }

  /// Signs out the current user.
  /// Throws an [AuthException] if the sign out operation fails.
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception('Failed to sign out.');
    }
  }

  /// Signs in a user with email and password.
  /// [email] and [password] must not be empty.
  /// Throws an [AuthException] if authentication fails.
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw Exception(_getSignInError(e));
    } catch (e) {
      throw Exception('An unexpected error occurred.');
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
      throw Exception(_getSignUpError(e));
    } catch (e) {
      throw Exception('An unexpected error occurred.');
    }
  }

  Future<void> saveUserProfile({
    required String name,
    required String phoneNumber,
  }) async {
    try {
      _validateAuthentication();
      final user = _auth.currentUser!;

      final userData = {
        'id': user.uid,
        'email': user.email,
        'name': name,
        'phoneNumber': phoneNumber,
        'aboutYou': '',
        'jobExperience': [],
        'education': [],
        'skills': [],
        'languages': [],
        'references': [],
        'links': [],
        'favorites': [],
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      };

      await _firestore.collection('users').doc(user.uid).set(userData);
    } catch (e) {
      if (e is Exception) rethrow;
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
    try {
      await _firestore.collection('users').doc(uid).update(data);
    } catch (e) {
      throw Exception('Failed to update user profile: $e');
    }
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
      throw Exception('Failed to send password reset email: ${e.message}');
    } catch (e) {
      throw Exception('An unexpected error occurred.');
    }
  }

  Future<void> resetPasswordFromCurrentPassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      AuthCredential credential = EmailAuthProvider.credential(
        email: currentUser?.email ?? '',
        password: currentPassword,
      );
      await currentUser?.reauthenticateWithCredential(credential);
      await currentUser?.updatePassword(newPassword);
    } on FirebaseAuthException catch (e) {
      throw Exception('Failed to reset password: ${e.message}');
    } catch (e) {
      throw Exception('An unexpected error occurred.');
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
