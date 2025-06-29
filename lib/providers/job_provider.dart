import 'package:codehatch/models/profile_model.dart';
import 'package:codehatch/services/job_service.dart';
import 'package:flutter/foundation.dart';

class JobProvider extends ChangeNotifier {
  final JobService _jobService = JobService();

  List<JobExperienceModel> _jobExperience = [];
  bool _isLoading = false;
  String? _error;

  List<JobExperienceModel> get jobExperience => _jobExperience;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadJobExperience() async {
    _setLoading(true);
    _clearError();

    try {
      _jobExperience = await _jobService.getUserJobExperience();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> addJobExperience({
    required String jobTitle,
    required String companyName,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    _setLoading(true);
    _clearError();

    try {
      final newJob = JobExperienceModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        jobTitle: jobTitle,
        companyName: companyName,
        startDate: startDate,
        endDate: endDate,
      );

      await _jobService.addJobExperience(newJob);
      _jobExperience.add(newJob);
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> updateJobExperience({
    required String jobId,
    required String jobTitle,
    required String companyName,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    _setLoading(true);
    _clearError();

    try {
      final updatedJob = JobExperienceModel(
        id: jobId,
        jobTitle: jobTitle,
        companyName: companyName,
        startDate: startDate,
        endDate: endDate,
      );

      await _jobService.updateJobExperience(jobId, updatedJob);

      final index = _jobExperience.indexWhere((job) => job.id == jobId);
      if (index != -1) {
        _jobExperience[index] = updatedJob;
        notifyListeners();
      }
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> deleteJobExperience(String jobId) async {
    _setLoading(true);
    _clearError();

    try {
      await _jobService.deleteJobExperience(jobId);
      _jobExperience.removeWhere((job) => job.id == jobId);
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
