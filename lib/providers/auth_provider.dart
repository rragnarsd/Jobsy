import 'package:codehatch/pages/auth/auth_exception.dart';
import 'package:codehatch/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  bool _isLoading = false;
  bool _isRegister = true;
  String? _authErrorMessage;
  bool _obscurePassword = true;
  User? _user;
  bool _initialized = false;

  AuthProvider() {
    _authService.authStateChanges.listen((user) {
      _user = user;
      _initialized = true;
      notifyListeners();
    });
  }

  bool get isLoading => _isLoading;
  bool get isRegister => _isRegister;
  String? get authErrorMessage => _authErrorMessage;
  bool get obscurePassword => _obscurePassword;
  bool get isLoggedIn => _user != null;
  bool get isInitialized => _initialized;

  void toggleAuthMode() {
    _isRegister = !_isRegister;
    _authErrorMessage = null;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  void setAuthMode(bool isRegister) {
    _isRegister = isRegister;
    _authErrorMessage = null;
    notifyListeners();
  }

  Future<void> signOut() async {
    _setLoading(true);
    try {
      await _authService.signOut();
    } catch (e) {
      _setError(e);
    } finally {
      _setLoading(false);
    }
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    _setLoading(true);
    try {
      await _authService.signInWithEmailAndPassword(email, password);
    } catch (e) {
      _setError(e);
    } finally {
      _setLoading(false);
    }
  }

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    _setLoading(true);
    try {
      await _authService.signUpWithEmailAndPassword(email, password);
    } catch (e) {
      _setError(e);
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
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
}
