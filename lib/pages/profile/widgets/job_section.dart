import 'package:codehatch/l10n/app_localizations.dart';
import 'package:codehatch/models/job_model.dart';
import 'package:codehatch/pages/profile/widgets/profile_header.dart';
import 'package:codehatch/pages/profile/widgets/profile_add_btn.dart';
import 'package:flutter/material.dart';

class JobSection extends StatelessWidget {
  const JobSection({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final local = AppLocalizations.of(context)!;
    return Column(
      children: [
        ProfileHeader(text: local.job_experience, onEditTap: () {}),
        Card(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2,
            separatorBuilder: (context, index) =>
                const Divider(height: 0.5, color: Colors.grey),
            itemBuilder: (context, index) {
              //TODO - Add another model for this
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
                          job.jobTitle,
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
                          job.publishedDate.toString().split(' ')[0],
                          style: theme.textTheme.bodyLarge!.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          job.deadline.toString().split(' ')[0],
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
        ProfileAddBtn(title: local.add_job),
      ],
    );
  }
}
