import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codehatch/models/profile_model.dart';
import 'package:codehatch/models/workplace_model.dart';
import 'package:codehatch/services/application_service.dart';
import 'package:codehatch/services/workplace_service.dart';
import 'package:flutter/material.dart';

class ApplicationProvider extends ChangeNotifier {
  final ApplicationService _applicationService = ApplicationService();
  final WorkplaceService _workplaceService = WorkplaceService();

  List<ApplicationModel> _applications = [];
  final Map<String, WorkplaceModel?> _applicationWorkplaces = {};
  bool _isLoading = false;
  String? _error;

  List<ApplicationModel> get applications => _applications;
  bool get isLoading => _isLoading;
  String? get error => _error;

  WorkplaceModel? getWorkplaceForApplication(String applicationId) {
    return _applicationWorkplaces[applicationId];
  }

  Future<void> loadApplications() async {
    _setLoading(true);
    _clearError();

    try {
      _applications = await _applicationService.getUserApplications();
      await _loadWorkplacesForApplications();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> addApplication(ApplicationModel application) async {
    _setLoading(true);
    _clearError();

    try {
      await _applicationService.addApplication(application);
      _applications.add(application);
      await _loadWorkplacesForApplications();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> hasAppliedToJob(String jobId) async {
    try {
      // First check if we have the application in our local list
      final hasAppliedLocally = _applications.any((app) => app.jobId == jobId);
      if (hasAppliedLocally) {
        return true;
      }

      // If not found locally, check with the service
      return await _applicationService.hasAppliedToJob(jobId);
    } catch (e) {
      return false;
    }
  }

  Future<void> _loadWorkplacesForApplications() async {
    _applicationWorkplaces.clear();

    for (final application in _applications) {
      WorkplaceModel? workplace;

      // Try to get workplace from application.workplaceId first
      if (application.workplaceId.isNotEmpty) {
        workplace = await _getWorkplaceById(application.workplaceId);
      }

      // If no workplace found, try to get it from job data
      workplace ??= await _getWorkplaceFromJob(application.jobId);

      _applicationWorkplaces[application.id] = workplace;
    }

    notifyListeners();
  }

  Future<WorkplaceModel?> _getWorkplaceById(String workplaceId) async {
    try {
      final workplaces = await _workplaceService.getWorkplacesStream().first;
      try {
        return workplaces.firstWhere(
          (workplace) => workplace.id == workplaceId,
        );
      } catch (e) {
        return null;
      }
    } catch (e) {
      debugPrint('Error fetching workplace by ID: $e');
      return null;
    }
  }

  Future<WorkplaceModel?> _getWorkplaceFromJob(String jobId) async {
    try {
      final firestore = FirebaseFirestore.instance;
      final jobDoc = await firestore.collection('jobs').doc(jobId).get();

      if (jobDoc.exists) {
        final jobData = jobDoc.data();
        if (jobData != null && jobData['workplaceId'] != null) {
          final workplaceId = jobData['workplaceId'] as String;
          return await _getWorkplaceById(workplaceId);
        }
      }
    } catch (e) {
      debugPrint('Error fetching workplace from job: $e');
    }
    return null;
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

  bool hasAppliedToJobSync(String jobId) {
    return _applications.any((app) => app.jobId == jobId);
  }
}
