import 'package:codehatch/utils/extensions.dart';
import 'package:intl/intl.dart';

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

final DateFormat formatter = DateFormat('d. MMM yyyy');

final List<InboxModel> inboxItems = [
  InboxModel(
    id: '1',
    title: 'UI/UX Designer',
    workplace: 'Tech Innovators Inc.',
    logoUrl:
        'https://ik.imagekit.io/redidhr3k/Untitled/logos/tech-innovators.png?updatedAt=1751019215969',
    message: 'We liked your profile. Let’s discuss further.',
    deadline: formatter.format(
      DateTime.now().subtract(const Duration(hours: 15)),
    ),
    jobStatus: JobStatus.inProgress,
  ),
  InboxModel(
    id: '2',
    title: 'Backend Developer',
    workplace: 'Green Future Ltd',
    logoUrl:
        'https://ik.imagekit.io/redidhr3k/Untitled/logos/green-future.png?updatedAt=1751019215860',
    message: 'Application received. We’ll review it soon.',
    deadline: formatter.format(
      DateTime.now().subtract(const Duration(days: 7)),
    ),
    jobStatus: JobStatus.active,
  ),
  InboxModel(
    id: '3',
    title: 'Product Manager',
    workplace: 'HealthTech Partners',
    logoUrl:
        'https://ik.imagekit.io/redidhr3k/Untitled/logos/health-tech.png?updatedAt=1751019215674',
    message: 'The position has been closed.',
    deadline: formatter.format(
      DateTime.now().subtract(const Duration(days: 60)),
    ),
    jobStatus: JobStatus.ended,
  ),
];
