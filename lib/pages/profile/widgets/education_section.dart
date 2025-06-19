import 'package:codehatch/l10n/app_localizations.dart';
import 'package:codehatch/models/profile_model.dart';
import 'package:codehatch/pages/profile/widgets/profile_add_btn.dart';
import 'package:codehatch/pages/profile/widgets/profile_header.dart';
import 'package:flutter/material.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final local = AppLocalizations.of(context)!;
    return SliverToBoxAdapter(
      child: Column(
        children: [
          ProfileHeader(text: local.education, onEditTap: () {}),
          Card(
            child: Column(
              children: List.generate(educations.length * 2 - 1, (index) {
                if (index.isOdd) {
                  return const Divider(height: 0.5, color: Colors.grey);
                }

                final education = educations[index ~/ 2];
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            education.name,
                            style: theme.textTheme.titleLarge,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            education.school,
                            style: theme.textTheme.bodyLarge!.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            education.type,
                            style: theme.textTheme.bodyLarge!.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            education.yearStart,
                            style: theme.textTheme.bodyLarge!.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            education.yearEnd,
                            style: theme.textTheme.bodyLarge!.copyWith(
                              color: Colors.grey,
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
          ProfileAddBtn(title: local.add_education),
        ],
      ),
    );
  }
}
