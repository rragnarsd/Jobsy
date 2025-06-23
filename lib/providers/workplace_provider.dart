import 'package:codehatch/models/job_model.dart';
import 'package:codehatch/models/workplace_model.dart';
import 'package:codehatch/services/workplace_service.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class WorkplaceProvider extends ChangeNotifier {
  WorkplaceModel? _workplace;
  List<WorkplaceModel> _workplaces = [];
  List<JobModel> _jobs = [];

  final WorkplaceService _workplaceService = WorkplaceService();

  WorkplaceModel? get workplace => _workplace;
  List<WorkplaceModel> get workplaces => List.unmodifiable(_workplaces);
  List<JobModel> get jobs => List.unmodifiable(_jobs);

  void setWorkplace(WorkplaceModel workplace) {
    _workplace = workplace;
    notifyListeners();
  }

  Future<void> fetchData() async {
    _workplaces = await _workplaceService.getWorkplaces();
    _jobs = await _workplaceService.getJobs();
    notifyListeners();
  }

  WorkplaceModel? getWorkplaceById(String id) {
    try {
      return _workplaces.firstWhere((workplace) => workplace.id == id);
    } catch (e) {
      return null;
    }
  }

  JobModel? getPrimaryJobForWorkplace(WorkplaceModel workplace) {
    if (workplace.jobIds.isNotEmpty) {
      final job = _jobs.firstWhereOrNull(
        (job) => job.id == workplace.jobIds.first,
      );
      if (job != null) {
        return job;
      }
    }
    return _jobs.firstWhereOrNull((job) => job.workplaceId == workplace.id) ??
        _jobs.firstOrNull;
  }

  JobModel? getJobById(String id) {
    return _jobs.firstWhereOrNull((job) => job.id == id);
  }
}
