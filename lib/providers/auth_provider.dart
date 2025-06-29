import 'package:codehatch/pages/auth/auth_exception.dart';
import 'package:codehatch/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum AuthStatus {
  uninitialized,
  authenticating,
  authenticated,
  unauthenticated,
  error,
}

class AuthUserProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  FirebaseAuth get _firebaseAuth => FirebaseAuth.instance;

  bool _isInitialized = false;

  AuthStatus _status = AuthStatus.uninitialized;
  User? _user;
  Map<String, dynamic>? _profile;
  String? _authErrorMessage;

  AuthUserProvider() {
    _authService.authStateChanges.listen((user) async {
      _user = user;

      if (_user == null) {
        _status = AuthStatus.unauthenticated;
        _profile = null;
      } else {
        _status = AuthStatus.authenticated;
        _profile = await _authService.getUserProfile(_user!.uid);
      }

      notifyListeners();
    });
  }

  bool get isInitialized => _isInitialized;
  AuthStatus get status => _status;
  User? get currentUser => _user;
  String? get authErrorMessage => _authErrorMessage;
  Map<String, dynamic>? get userProfile => _profile;
  bool get isLoggedIn => _user != null;
  bool get isAuthenticating => _status == AuthStatus.authenticating;
  bool get hasProfile => _profile != null;

  Future<void> initAuth() async {
    final user = _firebaseAuth.currentUser;
    _user = user;
    _isInitialized = true;
    notifyListeners();
  }

  Future<void> authenticate({
    required bool register,
    required String email,
    required String password,
    String? name,
    String? phoneNumber,
  }) async {
    _status = AuthStatus.authenticating;
    _authErrorMessage = null;
    notifyListeners();

    try {
      if (register) {
        await _authService.signUpWithEmailAndPassword(
          email: email,
          password: password,
          name: name!,
          phoneNumber: phoneNumber!,
        );
      } else {
        await _authService.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      }

      _user = _authService.currentUser;
      _profile = await _authService.getUserProfile(_user!.uid);
      _status = AuthStatus.authenticated;
    } catch (e) {
      _setError(e);
      _status = AuthStatus.error;
    } finally {
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    try {
      await _authService.signOut();
      _user = null;
      _profile = null;
      _status = AuthStatus.unauthenticated;
      notifyListeners();
    } catch (e) {
      _setError(e);
    }
  }

  void _setError(Object error) {
    if (error is AuthException) {
      _authErrorMessage = error.message;
    } else {
      _authErrorMessage = 'An unexpected error occurred.';
    }
    notifyListeners();
  }

  void clearError() {
    _authErrorMessage = null;
    notifyListeners();
  }

  Future<void> refreshProfile() async {
    if (_user != null) {
      try {
        _profile = await _authService.getUserProfile(_user!.uid);
        notifyListeners();
      } catch (e) {
        _setError(e);
      }
    }
  }

  Future<void> updateUserProfile(Map<String, dynamic> data) async {
    if (_user == null) return;
    await _authService.updateUserProfile(_user!.uid, data);
    _profile = await _authService.getUserProfile(_user!.uid);
    notifyListeners();
  }
}
