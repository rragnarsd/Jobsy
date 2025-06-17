class JobModel {
  final String id;
  final String jobTitle;
  final String jobDescription;
  final List<String> responsibilities;
  final List<String> qualifications;
  final List<String> languageSkills;
  final JobType jobType;
  final List<String> professions;
  final DateTime publishedDate;
  final DateTime deadline;
  final String workplaceId;
  final double? salary;
  final List<String>? benefits;
  final bool isRemote;
  final String? location;
  final String timeAgo;

  JobModel({
    required this.id,
    required this.jobTitle,
    required this.jobDescription,
    required this.responsibilities,
    required this.qualifications,
    required this.languageSkills,
    required this.jobType,
    required this.professions,
    required this.publishedDate,
    required this.deadline,
    required this.workplaceId,
    required this.timeAgo,
    this.salary,
    this.benefits,
    this.isRemote = false,
    this.location,
  });
}

enum JobType { fullTime, partTime, internship, freelance, temporary }

extension JobTypeExtension on JobType {
  String toDisplayString() {
    switch (this) {
      case JobType.fullTime:
        return 'Full Time';
      case JobType.partTime:
        return 'Part Time';
      case JobType.internship:
        return 'Internship';
      case JobType.freelance:
        return 'Freelance';
      case JobType.temporary:
        return 'Temporary';
    }
  }
}

final List<JobModel> jobs = [
  JobModel(
    id: 'j1',
    jobTitle: 'AI Software Engineer',
    jobDescription: 'Join our team to develop cutting-edge AI solutions.',
    responsibilities: [
      'Design and implement AI algorithms',
      'Collaborate with cross-functional teams',
      'Optimize model performance',
    ],
    qualifications: [
      'Bachelor\'s in Computer Science',
      '3+ years of AI development experience',
      'Strong Python skills',
    ],
    languageSkills: ['English', 'Icelandic'],
    jobType: JobType.fullTime,
    professions: ['Software Engineering', 'AI/ML'],
    publishedDate: DateTime(2024, 1, 15),
    deadline: DateTime(2024, 2, 15),
    workplaceId: 'w1',
    timeAgo: '20 min',
    salary: 120000,
    benefits: ['Health insurance', 'Stock options', 'Remote work'],
    isRemote: true,
  ),
  JobModel(
    id: 'j2',
    jobTitle: 'Senior Engineer',
    jobDescription: 'Lead sustainable energy projects.',
    responsibilities: [
      'Design renewable energy systems',
      'Lead engineering teams',
      'Project management',
    ],
    qualifications: [
      'Master\'s in Engineering',
      '5+ years experience',
      'Project management certification',
    ],
    languageSkills: ['English', 'Icelandic'],
    jobType: JobType.fullTime,
    professions: ['Engineering', 'Renewable Energy'],
    publishedDate: DateTime(2024, 2, 1),
    deadline: DateTime(2024, 3, 1),
    workplaceId: 'w2',
    timeAgo: '1 hour',
    location: 'Austin, TX',
  ),
  JobModel(
    id: 'j3',
    jobTitle: 'Curriculum Designer',
    jobDescription:
        'Create engaging educational content for our e-learning platform.',
    responsibilities: [
      'Design course curricula',
      'Develop learning materials',
      'Collaborate with subject matter experts',
    ],
    qualifications: [
      'Bachelor\'s in Education or related field',
      '2+ years curriculum design experience',
      'Strong writing and communication skills',
    ],
    languageSkills: ['English'],
    jobType: JobType.partTime,
    professions: ['Education', 'Content Creation'],
    publishedDate: DateTime(2024, 2, 5),
    deadline: DateTime(2024, 3, 5),
    workplaceId: 'w3',
    timeAgo: '2 hours',
    salary: 45000,
    benefits: ['Flexible hours', 'Learning budget'],
    isRemote: true,
  ),
  JobModel(
    id: 'j4',
    jobTitle: 'HealthTech Engineer',
    jobDescription: 'Develop innovative healthcare software solutions.',
    responsibilities: [
      'Design healthcare software systems',
      'Implement security protocols',
      'Work with healthcare professionals',
    ],
    qualifications: [
      'Bachelor\'s in Computer Science',
      'Experience with healthcare systems',
      'Knowledge of HIPAA compliance',
    ],
    languageSkills: ['English'],
    jobType: JobType.fullTime,
    professions: ['Software Engineering', 'Healthcare'],
    publishedDate: DateTime(2024, 2, 10),
    deadline: DateTime(2024, 3, 10),
    workplaceId: 'w4',
    timeAgo: '3 hours',
    salary: 130000,
    benefits: ['Health insurance', '401k', 'Professional development'],
    location: 'Seattle, WA',
  ),
  JobModel(
    id: 'j5',
    jobTitle: 'UI/UX Designer',
    jobDescription: 'Create beautiful and intuitive user interfaces.',
    responsibilities: [
      'Design user interfaces',
      'Conduct user research',
      'Create design systems',
    ],
    qualifications: [
      'Bachelor\'s in Design or related field',
      '3+ years UI/UX experience',
      'Portfolio demonstrating design skills',
    ],
    languageSkills: ['English'],
    jobType: JobType.freelance,
    professions: ['Design', 'User Experience'],
    publishedDate: DateTime(2024, 2, 15),
    deadline: DateTime(2024, 3, 15),
    workplaceId: 'w5',
    timeAgo: '4 hours',
    salary: 85000,
    benefits: ['Flexible schedule', 'Remote work'],
    isRemote: true,
  ),
];
