import 'package:codehatch/utils/extensions.dart';

class InboxModel {
  final String id;
  final String title;
  final String workplace;
  final String logoUrl;
  final String message;
  final String deadline;
  final JobStatus jobStatus;

  InboxModel({
    required this.id,
    required this.title,
    required this.workplace,
    required this.logoUrl,
    required this.message,
    required this.deadline,
    required this.jobStatus,
  });
}
