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

  Stream<List<WorkplaceModel>> get workplacesStream =>
      _workplaceService.getWorkplacesStream();
  Stream<List<JobModel>> get jobsStream => _workplaceService.getJobsStream();

  void initializeStreams() {
    _workplaceService.getWorkplacesStream().listen((workplaces) {
      _workplaces = workplaces;
      notifyListeners();
    });

    _workplaceService.getJobsStream().listen((jobs) {
      _jobs = jobs;
      notifyListeners();
    });
  }

  WorkplaceModel? getWorkplaceById(String id) {
    return _workplaces.firstWhereOrNull((w) => w.id == id);
  }

  JobModel? getPrimaryJobForWorkplace(WorkplaceModel workplace) {
    if (workplace.jobIds.isNotEmpty) {
      final primaryJobId = workplace.jobIds.first;
      final job = getJobById(primaryJobId);
      if (job != null) return job;
    }

    return _jobs.firstWhereOrNull((job) => job.workplaceId == workplace.id) ??
        _jobs.firstOrNull;
  }

  JobModel? getJobById(String id) {
    return _jobs.firstWhereOrNull((job) => job.id == id);
  }
}
