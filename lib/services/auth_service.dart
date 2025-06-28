import 'package:codehatch/pages/auth/auth_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
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

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw AuthException(_getSignInError(e));
    } catch (e) {
      throw AuthException('An unexpected error occurred.');
    }
  }

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw AuthException(_getSignUpError(e));
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
