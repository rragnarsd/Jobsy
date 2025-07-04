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

  Future<void> addJobExperience(JobExperienceModel model) async {
    _setLoading(true);
    _clearError();

    try {
      await _jobService.addJobExperience(model);
      _jobExperience.add(model);
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> updateJobExperience(JobExperienceModel model) async {
    _setLoading(true);
    _clearError();

    try {
      await _jobService.updateJobExperience(model.id, model);
      _jobExperience.removeWhere((job) => job.id == model.id);
      _jobExperience.add(model);
      notifyListeners();
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
