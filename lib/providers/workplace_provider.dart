import 'package:codehatch/models/job_model.dart';
import 'package:codehatch/models/workplace_model.dart';
import 'package:codehatch/services/workplace_service.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class WorkplaceProvider extends ChangeNotifier {
  List<WorkplaceModel> _workplaces = [];
  List<JobModel> _jobs = [];

  final WorkplaceService _workplaceService = WorkplaceService();

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

  JobModel? getJobById(String id) {
    return _jobs.firstWhereOrNull((job) => job.id == id);
  }

  List<MapEntry<JobModel, WorkplaceModel>> getAllJobsWithWorkplaces() {
    final result = _jobs
        .map((job) {
          WorkplaceModel? workplace = getWorkplaceById(job.workplaceId);
          return workplace != null ? MapEntry(job, workplace) : null;
        })
        .whereType<MapEntry<JobModel, WorkplaceModel>>()
        .toList();

    result.sort((a, b) {
      DateTime dateA = a.key.publishedDate ?? DateTime(2025);
      DateTime dateB = b.key.publishedDate ?? DateTime(2025);
      return dateB.compareTo(dateA);
    });

    return result;
  }

  Map<JobSection, List<MapEntry<JobModel, WorkplaceModel>>>
  groupJobsBySection() {
    final today = DateTime.now();
    final allJobs = getAllJobsWithWorkplaces();

    final Map<JobSection, List<MapEntry<JobModel, WorkplaceModel>>> grouped = {
      JobSection.today: [],
      JobSection.older: [],
    };

    for (final entry in allJobs) {
      DateTime? date = entry.key.publishedDate;

      if (date == null || date.year < 2025) {
        grouped[JobSection.today]!.add(entry);
      } else if (_isSameDay(date, today)) {
        grouped[JobSection.today]!.add(entry);
      } else {
        grouped[JobSection.older]!.add(entry);
      }
    }

    return grouped;
  }

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  int getTodayJobsCount() => groupJobsBySection()[JobSection.today]!.length;

  int getOlderJobsCount() => groupJobsBySection()[JobSection.older]!.length;

  List<JobSectionItem> getJobsWithSections() {
    final grouped = groupJobsBySection();
    final todayJobs = grouped[JobSection.today]!;
    final olderJobs = grouped[JobSection.older]!;

    final sections = <JobSectionItem>[
      for (final entry in todayJobs)
        JobSectionItem(
          job: entry.key,
          workplace: entry.value,
          section: JobSection.today,
        ),
      if (olderJobs.isNotEmpty) JobSectionItem.divider(),
      for (final entry in olderJobs)
        JobSectionItem(
          job: entry.key,
          workplace: entry.value,
          section: JobSection.older,
        ),
    ];

    return sections;
  }
}

enum JobSection { today, older, divider }

class JobSectionItem {
  final JobModel? job;
  final WorkplaceModel? workplace;
  final JobSection section;

  JobSectionItem({
    required this.job,
    required this.workplace,
    required this.section,
  });

  JobSectionItem.divider()
    : job = null,
      workplace = null,
      section = JobSection.divider;

  bool get isDivider => section == JobSection.divider;
  bool get isToday => section == JobSection.today;
  bool get isOlder => section == JobSection.older;
}
