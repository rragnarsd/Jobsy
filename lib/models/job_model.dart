import 'package:cloud_firestore/cloud_firestore.dart';

class JobModel {
  final String id;
  final String title;
  final String description;
  final List<String> responsibilities;
  final List<String> qualifications;
  final List<String> languageSkills;
  final String jobType;
  final List<String> professions;
  final DateTime? publishedDate;
  final DateTime? deadline;
  final String workplaceId;
  final double? salary;
  final bool isRemote;
  final String? location;

  JobModel({
    required this.id,
    required this.title,
    required this.description,
    required this.responsibilities,
    required this.qualifications,
    required this.languageSkills,
    required this.jobType,
    required this.professions,
    this.publishedDate,
    this.deadline,
    required this.workplaceId,
    this.salary,
    this.isRemote = false,
    this.location,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      responsibilities: List<String>.from(json['responsibilities']),
      qualifications: List<String>.from(json['qualifications']),
      languageSkills: List<String>.from(json['languageSkills']),
      jobType: json['jobType'],
      professions: List<String>.from(json['professions']),
      publishedDate: json['publishedDate'] != null
          ? (json['publishedDate'] as Timestamp).toDate()
          : null,
      deadline: json['deadline'] != null
          ? (json['deadline'] as Timestamp).toDate()
          : null,
      workplaceId: json['workplaceId'],
      salary: (json['salary'] != null) ? json['salary'].toDouble() : null,
      isRemote: json['isRemote'] ?? false,
      location: json['location'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'responsibilities': responsibilities,
      'qualifications': qualifications,
      'languageSkills': languageSkills,
      'jobType': jobType,
      'professions': professions,
      'publishedDate': publishedDate?.toIso8601String(),
      'deadline': deadline?.toIso8601String(),
      'workplaceId': workplaceId,
      'salary': salary,
      'isRemote': isRemote,
      'location': location,
    };
  }
}
