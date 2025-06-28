import 'package:flutter/material.dart';

enum JobType { fullTime, partTime, internship, freelance, temporary }

enum CourseTypes { onSite, remote }

enum JobStatus { inProgress, active, ended }

enum JobPerks { activity, workingHours, health, food, commute, entertainment }

extension CourseTypesExtension on CourseTypes {
  String get displayName {
    switch (this) {
      case CourseTypes.onSite:
        return 'On-site';
      case CourseTypes.remote:
        return 'Remote';
    }
  }
}

extension JobStatusExtension on JobStatus {
  String get displayName {
    switch (this) {
      case JobStatus.inProgress:
        return 'In Progress';
      case JobStatus.active:
        return 'Active';
      case JobStatus.ended:
        return 'Ended';
    }
  }

  Color get color {
    switch (this) {
      case JobStatus.inProgress:
        return Colors.orange;
      case JobStatus.active:
        return Colors.green;
      case JobStatus.ended:
        return Colors.grey;
    }
  }
}

extension JobPerksExtension on JobPerks {
  String get displayName {
    switch (this) {
      case JobPerks.activity:
        return 'Activity';
      case JobPerks.workingHours:
        return 'Working Hours';
      case JobPerks.health:
        return 'Health';
      case JobPerks.food:
        return 'Food';
      case JobPerks.commute:
        return 'Commute';
      case JobPerks.entertainment:
        return 'Entertainment';
    }
  }
}
