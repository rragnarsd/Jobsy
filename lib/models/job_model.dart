import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codehatch/utils/extensions.dart';

class JobModel {
  final String id;
  final String title;
  final String description;
  final List<String> responsibilities;
  final List<String> qualifications;
  final List<LanguageSkill> languageSkills;
  final JobType jobType;
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
      languageSkills: List<LanguageSkill>.from(
        json['languageSkills'].map((skill) => LanguageSkill.fromJson(skill)),
      ),
      jobType: JobType.values.firstWhere(
        (e) => e.englishValue == json['jobType'],
        orElse: () => JobType.fullTime,
      ),
      professions: List<String>.from(json['professions']),
      publishedDate: json['publishedDate'] != null
          ? (json['publishedDate'] is Timestamp
                ? (json['publishedDate'] as Timestamp).toDate()
                : DateTime.parse(json['publishedDate']))
          : null,
      deadline: json['deadline'] != null
          ? (json['deadline'] is Timestamp
                ? (json['deadline'] as Timestamp).toDate()
                : DateTime.parse(json['deadline']))
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
      'languageSkills': languageSkills.map((skill) => skill.toJson()).toList(),
      'jobType': jobType.englishValue,
      'professions': professions,
      'publishedDate': publishedDate,
      'deadline': deadline,
      'workplaceId': workplaceId,
      'salary': salary,
      'isRemote': isRemote,
      'location': location,
    };
  }
}

class LanguageSkill {
  final String title;
  final String flagUrl;

  LanguageSkill({required this.title, required this.flagUrl});

  factory LanguageSkill.fromJson(Map<String, dynamic> json) {
    return LanguageSkill(title: json['title'], flagUrl: json['flagUrl']);
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'flagUrl': flagUrl};
  }
}
