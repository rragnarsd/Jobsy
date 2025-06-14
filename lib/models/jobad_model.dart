import 'package:codehatch/models/workplace_model.dart';

//TODO
enum JobType { fullTime, partTime, contract, internship, freelance, temporary }

class JobAdModel {
  final String id;
  final String jobTitle;
  final String jobDescription;
  final List<String> responsibilities;
  final List<String> qualifications;
  final List<String> languageSkills;
  final JobType jobType;
  final List<String> professions;
  final DateTime publishedDate;
  final WorkplaceModel workplace;

  JobAdModel({
    required this.id,
    required this.jobTitle,
    required this.jobDescription,
    required this.responsibilities,
    required this.qualifications,
    required this.languageSkills,
    required this.jobType,
    required this.professions,
    required this.publishedDate,
    required this.workplace,
  });

  String jobTypeToString(JobType type) => type.name;

  JobType jobTypeFromString(String value) =>
      JobType.values.firstWhere((e) => e.name == value);
}
