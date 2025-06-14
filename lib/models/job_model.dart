class JobModel {
  final String id;
  final String jobTitle;
  final String workplace;
  final String startDate;
  final String endDate;

  JobModel({
    required this.id,
    required this.jobTitle,
    required this.workplace,
    required this.startDate,
    required this.endDate,
  });
}

final List<JobModel> jobs = [
  JobModel(
    id: '1',
    jobTitle: 'Job title',
    workplace: 'Workplace',
    startDate: 'startDate',
    endDate: 'endDate',
  ),
  JobModel(
    id: '2',
    jobTitle: 'Software Developer',
    workplace: 'Tech Company',
    startDate: '2020',
    endDate: '2023',
  ),
];
