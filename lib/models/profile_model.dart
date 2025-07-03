import 'package:codehatch/models/language_model.dart';

class ProfileModel {
  final String id;
  final String name;
  final String phoneNumber;
  final DateTime dateOfBirth;
  final String aboutYou;
  final String idNumber;
  final String imageUrl;
  final List<JobExperienceModel> jobExperience;
  final List<EducationModel> education;
  final List<String> skills;
  final List<LanguageModel> languages;
  final List<ReferenceModel> references;
  final List<String> links;

  ProfileModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.aboutYou,
    required this.idNumber,
    required this.imageUrl,
    required this.jobExperience,
    required this.education,
    required this.skills,
    required this.languages,
    required this.references,
    required this.links,
  });
}

class JobExperienceModel {
  final String id;
  final String jobTitle;
  final String companyName;
  final DateTime startDate;
  final DateTime endDate;
  final String? description;

  JobExperienceModel({
    required this.id,
    required this.jobTitle,
    required this.companyName,
    required this.startDate,
    required this.endDate,
    this.description,
  });
}

class EducationModel {
  final String id;
  final String school;
  final String field;
  final String degree;
  final String yearStart;
  final String yearEnd;

  EducationModel({
    required this.id,
    required this.school,
    required this.field,
    required this.degree,
    required this.yearStart,
    required this.yearEnd,
  });
}

class ReferenceModel {
  final String id;
  final String name;
  final String jobTitle;
  final String email;

  ReferenceModel({
    required this.id,
    required this.name,
    required this.jobTitle,
    required this.email,
  });
}

final List<ReferenceModel> references = [
  ReferenceModel(
    id: '1',
    name: 'Paul Newman',
    jobTitle: 'CEO',
    email: 'paul_ceo@hotmail.com',
  ),
  ReferenceModel(
    id: '2',
    name: 'John Doe',
    jobTitle: 'Senior Developer',
    email: 'john.doe@example.com',
  ),
];
