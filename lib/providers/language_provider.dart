import 'package:codehatch/models/profile_model.dart';
import 'package:codehatch/services/language_service.dart';
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  final LanguageService _languageService = LanguageService();

  LanguageService get languageService => _languageService;

  List<LanguageModel> _languages = [];
  bool _isLoading = false;
  String? _error;

  List<LanguageModel> get languages => _languages;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadLanguages() async {
    _setLoading(true);
    _clearError();

    try {
      _languages = await _languageService.getUserLanguages();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> addLanguage(LanguageModel language) async {
    _setLoading(true);
    _clearError();

    try {
      await _languageService.addLanguage(language);
      await loadLanguages();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> updateLanguage(LanguageModel language) async {
    _setLoading(true);
    _clearError();

    try {
      await _languageService.updateLanguage(language);
      await loadLanguages();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> deleteLanguage(String languageId) async {
    _setLoading(true);
    _clearError();

    try {
      await _languageService.deleteLanguage(languageId);
      await loadLanguages();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _clearError() {
    _error = null;
    notifyListeners();
  }

  void _setError(String error) {
    _error = error;
    notifyListeners();
  }
}
