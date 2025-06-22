import 'package:codehatch/l10n/app_localizations.dart';
import 'package:codehatch/models/language_model.dart';
import 'package:codehatch/pages/profile/widgets/profile_add_btn.dart';
import 'package:codehatch/pages/profile/widgets/profile_header.dart';
import 'package:codehatch/utils/colors.dart';
import 'package:flutter/material.dart';

class LanguageSection extends StatelessWidget {
  const LanguageSection({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final local = AppLocalizations.of(context)!;
    return SliverToBoxAdapter(
      child: Column(
        children: [
          ProfileHeader(text: local.languages, onEditTap: () {}),
          Card(
            child: Column(
              children: List.generate(languages.length * 2 - 1, (index) {
                if (index.isOdd) {
                  return const Divider(height: 0.5, color: JobsyColors.greyColor);
                }

                final language = languages[index ~/ 2];
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Placeholder(
                            fallbackHeight: 20,
                            fallbackWidth: 40,
                          ),
                          const SizedBox(width: 16),
                          Text(
                            language.name,
                            style: theme.textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Text(language.level, style: theme.textTheme.bodyLarge),
                    ],
                  ),
                );
              }),
            ),
          ),
          ProfileAddBtn(title: local.add_language),
        ],
      ),
    );
  }
}
