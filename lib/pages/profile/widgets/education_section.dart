import 'package:codehatch/models/education_model.dart';
import 'package:codehatch/pages/profile/widgets/profile_add_btn.dart';
import 'package:codehatch/pages/profile/widgets/profile_header.dart';
import 'package:flutter/material.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Column(
      children: [
        const ProfileHeader(text: 'Education'),
        Card(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: educations.length,
            separatorBuilder: (context, index) =>
                const Divider(height: 0.5, color: Colors.grey),
            itemBuilder: (context, index) {
              final education = educations[index];
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(education.name, style: theme.textTheme.titleLarge),
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
            },
          ),
        ),
        const ProfileAddBtn(title: 'Add new education'),
      ],
    );
  }
}
