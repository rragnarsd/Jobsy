import 'package:codehatch/pages/profile/skills_page.dart';
import 'package:codehatch/pages/profile/widgets/profile_add_btn.dart';
import 'package:codehatch/pages/profile/widgets/profile_header.dart';
import 'package:codehatch/providers/skills_provider.dart';
import 'package:codehatch/utils/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SkillSection extends StatelessWidget {
  const SkillSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final skillsProvider = context.watch<SkillsProvider>();

    final selectedSkills = skillsProvider.skills;

    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileHeader(
            text: 'skills'.tr(),
            onEditTap: () => showSkills(context: context),
            trailingText: '${'my_skills'.tr()} (${selectedSkills.length})',
          ),
          if (selectedSkills.isEmpty)
            SizedBox(
              width: double.infinity,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'no_skills'.tr(),
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: JobsyColors.greyColor,
                    ),
                  ),
                ),
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Wrap(
                spacing: 12,
                children: selectedSkills.map((skill) {
                  return SkillButtonTag(
                    skillModel: skill,
                    isSelected: true,
                    onPressed: () => skillsProvider.removeUserSkill(skill),
                  );
                }).toList(),
              ),
            ),
          ProfileAddBtn(
            title: 'add_skills'.tr(),
            onPressed: () => showSkills(context: context, tabIndex: 1),
          ),
        ],
      ),
    );
  }

  void showSkills({required BuildContext context, int tabIndex = 0}) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (BuildContext context) {
          return SkillsPage(initialTabIndex: tabIndex);
        },
      ),
    );
  }
}
