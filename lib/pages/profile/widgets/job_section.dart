import 'package:codehatch/models/job_model.dart';
import 'package:codehatch/pages/profile/widgets/profile_header.dart';
import 'package:codehatch/pages/profile/widgets/profile_add_btn.dart';
import 'package:flutter/material.dart';

class JobSection extends StatelessWidget {
  const JobSection({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Column(
      children: [
        const ProfileHeader(text: 'Job Experience'),
        Card(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: jobs.length,
            separatorBuilder: (context, index) =>
                const Divider(height: 0.5, color: Colors.grey),
            itemBuilder: (context, index) {
              final job = jobs[index];
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(job.jobTitle, style: theme.textTheme.titleLarge),
                        Text(
                          job.workplace,
                          style: theme.textTheme.bodyLarge!.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          job.startDate,
                          style: theme.textTheme.bodyLarge!.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          job.endDate,
                          style: theme.textTheme.bodyLarge!.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const ProfileAddBtn(title: 'Add new job'),
      ],
    );
  }
}
