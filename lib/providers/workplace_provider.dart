import 'package:codehatch/models/job_model.dart';
import 'package:codehatch/models/workplace_model.dart';
import 'package:codehatch/services/workplace_service.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class WorkplaceProvider extends ChangeNotifier {
  List<WorkplaceModel> _workplaces = [];
  List<JobModel> _jobs = [];
  String _searchQuery = '';

  final WorkplaceService _workplaceService = WorkplaceService();

  List<WorkplaceModel> get workplaces => List.unmodifiable(_workplaces);
  List<JobModel> get jobs => List.unmodifiable(_jobs);
  String get searchQuery => _searchQuery;

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

  void updateSearchQuery(String query) {
    _searchQuery = query.trim().toLowerCase();
    notifyListeners();
  }

  void clearSearch() {
    _searchQuery = '';
    notifyListeners();
  }

  List<WorkplaceModel> get filteredWorkplaces {
    if (_searchQuery.isEmpty) return _workplaces;

    return _workplaces.where((workplace) {
      return workplace.name.toLowerCase().contains(_searchQuery) ||
          workplace.description.toLowerCase().contains(_searchQuery);
    }).toList();
  }

  List<JobModel> get filteredJobs {
    if (_searchQuery.isEmpty) return _jobs;

    return _jobs.where((job) {
      final workplace = getWorkplaceById(job.workplaceId);
      final query = _searchQuery.toLowerCase();

      if (job.title.toLowerCase().contains(query)) return true;

      if (workplace != null && workplace.name.toLowerCase().contains(query)) {
        return true;
      }

      if (job.professions.any(
        (profession) => profession.toLowerCase().contains(query),
      )) {
        return true;
      }

      return false;
    }).toList();
  }

  WorkplaceModel? getWorkplaceById(String id) {
    return _workplaces.firstWhereOrNull((w) => w.id == id);
  }

  JobModel? getJobById(String id) {
    return _jobs.firstWhereOrNull((job) => job.id == id);
  }

  List<MapEntry<JobModel, WorkplaceModel>> getAllJobsWithWorkplaces() {
    final jobsToUse = _searchQuery.isEmpty ? _jobs : filteredJobs;

    final result = jobsToUse
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
    final todayJobs = grouped[JobSection.today] ?? [];
    final olderJobs = grouped[JobSection.older] ?? [];

    final sections = <JobSectionItem>[];

    if (todayJobs.isNotEmpty) {
      for (final entry in todayJobs) {
        sections.add(
          JobSectionItem(
            job: entry.key,
            workplace: entry.value,
            section: JobSection.today,
          ),
        );
      }
    }

    if (olderJobs.isNotEmpty) {
      if (sections.isNotEmpty) {
        sections.add(JobSectionItem.divider());
      }
      for (final entry in olderJobs) {
        sections.add(
          JobSectionItem(
            job: entry.key,
            workplace: entry.value,
            section: JobSection.older,
          ),
        );
      }
    }

    return sections;
  }

  bool get hasActiveSearch => _searchQuery.isNotEmpty;
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
