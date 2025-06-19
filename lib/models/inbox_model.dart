import 'package:codehatch/models/job_model.dart';

class InboxModel {
  //TODO - Continue here
  final String id;
  final String title;
  final String message;
  final JobModel jobModel;

  InboxModel({
    required this.id,
    required this.title,
    required this.message,
    required this.jobModel,
  });
}
