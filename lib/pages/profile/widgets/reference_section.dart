import 'package:codehatch/l10n/app_localizations.dart';
import 'package:codehatch/models/profile_model.dart';
import 'package:codehatch/pages/profile/widgets/profile_add_btn.dart';
import 'package:codehatch/pages/profile/widgets/profile_header.dart';
import 'package:codehatch/utils/colors.dart' show JobsyColors;
import 'package:flutter/material.dart';

class ReferenceSection extends StatelessWidget {
  const ReferenceSection({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final local = AppLocalizations.of(context)!;
    return SliverToBoxAdapter(
      child: Column(
        children: [
          ProfileHeader(text: local.references, onEditTap: () {}),
          Card(
            child: Column(
              children: List.generate(references.length * 2 - 1, (index) {
                if (index.isOdd) {
                  return const Divider(height: 0.5, color: JobsyColors.greyColor);
                }

                final reference = references[index ~/ 2];
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: JobsyColors.greyColor,
                        radius: 16,
                        child: Icon(Icons.person, size: 16),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            reference.name,
                            style: theme.textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            reference.jobTitle,
                            style: theme.textTheme.bodyLarge!.copyWith(
                              color: JobsyColors.greyColor,
                            ),
                          ),
                          Text(
                            reference.email,
                            style: theme.textTheme.bodyMedium!.copyWith(
                              color: JobsyColors.primaryColor,
                              fontWeight: FontWeight.w500,
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
          ProfileAddBtn(title: local.add_reference),
        ],
      ),
    );
  }
}
