import 'package:codehatch/models/profile_model.dart';
import 'package:codehatch/services/education_service.dart';
import 'package:flutter/material.dart';

class EducationProvider extends ChangeNotifier {
  final EducationService _educationService = EducationService();

  List<EducationModel> _education = [];
  bool _isLoading = false;
  String? _error;

  List<EducationModel> get education => _education;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadEducation() async {
    _setLoading(true);
    _clearError();

    try {
      _education = await _educationService.getUserEducation();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> addEducation(EducationModel education) async {
    _setLoading(true);
    _clearError();

    try {
      final newEducation = EducationModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        school: education.school,
        field: education.field,
        degree: education.degree,
        yearStart: education.yearStart,
        yearEnd: education.yearEnd,
      );

      await _educationService.addEducation(newEducation);
      _education.add(newEducation);
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> updateEducation(EducationModel education) async {
    _setLoading(true);
    _clearError();

    try {
      await _educationService.updateEducation(education);
      _education.removeWhere((edu) => edu.id == education.id);
      _education.add(education);
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> deleteEducation(String educationId) async {
    _setLoading(true);
    _clearError();

    try {
      await _educationService.deleteEducation(educationId);
      _education.removeWhere((edu) => edu.id == educationId);
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String error) {
    _error = error;
    notifyListeners();
  }

  void _clearError() {
    _error = null;
    notifyListeners();
  }

  void clearError() {
    _clearError();
  }
}
