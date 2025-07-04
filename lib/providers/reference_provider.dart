import 'package:codehatch/models/profile_model.dart';
import 'package:codehatch/services/reference_service.dart';
import 'package:flutter/material.dart';

class ReferenceProvider extends ChangeNotifier {
  final ReferenceService _referenceService = ReferenceService();

  List<ReferenceModel> _references = [];
  bool _isLoading = false;
  String? _error;

  List<ReferenceModel> get references => _references;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadReferences() async {
    _setLoading(true);
    _clearError();

    try {
      _references = await _referenceService.getUserReferences();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> addReference(ReferenceModel reference) async {
    _setLoading(true);
    _clearError();
    try {
      await _referenceService.addReference(reference);
      _references.add(reference);
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> updateReference(ReferenceModel reference) async {
    _setLoading(true);
    _clearError();

    try {
      await _referenceService.updateReference(reference);
      _references.removeWhere((ref) => ref.id == reference.id);
      _references.add(reference);
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> deleteReference(String referenceId) async {
    _setLoading(true);
    _clearError();

    try {
      await _referenceService.deleteReference(referenceId);
      _references.removeWhere((ref) => ref.id == referenceId);
      notifyListeners();
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

  void clearError() {
    _clearError();
  }
}
