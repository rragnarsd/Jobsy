import 'package:codehatch/models/language_model.dart';
import 'package:codehatch/pages/profile/widgets/profile_add_btn.dart';
import 'package:codehatch/pages/profile/widgets/profile_header.dart';
import 'package:flutter/material.dart';

class LanguageSection extends StatelessWidget {
  const LanguageSection({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Column(
      children: [
        const ProfileHeader(text: 'Languages'),
        Card(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: languages.length,
            separatorBuilder: (context, index) =>
                const Divider(height: 0.5, color: Colors.grey),
            itemBuilder: (context, index) {
              final language = languages[index];
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 16,
                      children: [
                        const Placeholder(
                          fallbackHeight: 20,
                          fallbackWidth: 40,
                        ),
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
            },
          ),
        ),
        const ProfileAddBtn(title: 'Add a language'),
      ],
    );
  }
}
