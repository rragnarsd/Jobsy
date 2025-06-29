import 'package:codehatch/l10n/app_localizations.dart';
import 'package:codehatch/models/profile_model.dart';
import 'package:codehatch/pages/profile/widgets/profile_add_btn.dart';
import 'package:codehatch/pages/profile/widgets/profile_header.dart';
import 'package:codehatch/utils/colors.dart';
import 'package:codehatch/utils/extensions.dart';
import 'package:flutter/material.dart';

class JobSection extends StatelessWidget {
  const JobSection({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final local = AppLocalizations.of(context)!;

    return SliverToBoxAdapter(
      child: Column(
        children: [
          ProfileHeader(text: local.job_experience),
          Card(
            child: Column(
              children: List.generate(jobExperience.length * 2 - 1, (index) {
                if (index.isOdd) {
                  return const Divider(
                    height: 0.5,
                    color: JobsyColors.greyColor,
                  );
                }

                final job = jobExperience[index ~/ 2];
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(job.jobTitle, style: theme.textTheme.titleLarge),
                          const SizedBox(height: 4),
                          Text(
                            job.companyName,
                            style: theme.textTheme.bodyLarge!.copyWith(
                              color: JobsyColors.greyColor,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            job.startDate.toShortFormattedDate(),
                            style: theme.textTheme.bodyLarge!.copyWith(
                              color: JobsyColors.greyColor,
                            ),
                          ),
                          Text(
                            job.endDate.toShortFormattedDate(),
                            style: theme.textTheme.bodyLarge!.copyWith(
                              color: JobsyColors.greyColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
          ProfileAddBtn(title: local.add_job),
        ],
      ),
    );
  }
}
