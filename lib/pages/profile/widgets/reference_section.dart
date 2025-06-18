import 'package:codehatch/l10n/app_localizations.dart';
import 'package:codehatch/models/reference_model.dart';
import 'package:codehatch/pages/profile/widgets/profile_add_btn.dart';
import 'package:codehatch/pages/profile/widgets/profile_header.dart';
import 'package:flutter/material.dart';

class ReferenceSection extends StatelessWidget {
  const ReferenceSection({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final local = AppLocalizations.of(context)!;
    return Column(
      children: [
        ProfileHeader(text: local.references, onEditTap: () {}),
        Card(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: references.length,
            separatorBuilder: (context, index) =>
                const Divider(height: 0.5, color: Colors.grey),
            itemBuilder: (context, index) {
              final reference = references[index];
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  spacing: 16,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 16,
                      child: Icon(Icons.person),
                    ),
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
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          reference.email,
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: const Color(0xFFFF7200),
                            fontWeight: FontWeight.w500,
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
        ProfileAddBtn(title: local.add_reference),
      ],
    );
  }
}
