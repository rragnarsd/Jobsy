import 'package:codehatch/l10n/app_localizations.dart';
import 'package:codehatch/pages/profile/skills_page.dart';
import 'package:codehatch/pages/profile/widgets/profile_add_btn.dart';
import 'package:codehatch/pages/profile/widgets/profile_header.dart';
import 'package:codehatch/providers/skills_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SkillSection extends StatelessWidget {
  const SkillSection({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final skillsProvider = context.watch<SkillsProvider>();

    final selectedSkills = skillsProvider.skills;

    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileHeader(
            text: local.skills,
            onEditTap: () => context.push('/profile/skills'),
            trailingText: '${local.my_skills} (${selectedSkills.length})',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Wrap(
              spacing: 12,
              children: selectedSkills.map((skill) {
                return SkillButton(
                  skillModel: skill,
                  isSelected: true,
                  onPressed: () => skillsProvider.removeUserSkill(skill),
                );
              }).toList(),
            ),
          ),
          ProfileAddBtn(
            title: local.add_skills,
            onPressed: () => context.push('/profile/skills', extra: 1),
          ),
        ],
      ),
    );
  }
}
