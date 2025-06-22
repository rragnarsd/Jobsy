import 'package:codehatch/l10n/app_localizations.dart';
import 'package:codehatch/pages/profile/widgets/profile_add_btn.dart';
import 'package:codehatch/pages/profile/widgets/profile_header.dart';
import 'package:codehatch/utils/colors.dart';
import 'package:flutter/material.dart';

class SkillSection extends StatelessWidget {
  SkillSection({super.key});

  //TODO - Make this dynamic
  final List<String> skills = [
    'Independence',
    'Microsoft Word',
    'Proactive',
    'Honesty',
    'Positivity',
    'Human relations',
  ];

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return SliverToBoxAdapter(
      child: Column(
        children: [
          ProfileHeader(
            text: local.skills,
            onEditTap: () {},
            trailingText: '${local.my_skills} (${skills.length})',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: skills
                  .map(
                    (skill) => SizedBox(
                      width: (MediaQuery.of(context).size.width - 52) / 2,
                      child: SkillCard(skill: skill),
                    ),
                  )
                  .toList(),
            ),
          ),
          ProfileAddBtn(title: local.add_skills),
        ],
      ),
    );
  }
}

class SkillCard extends StatelessWidget {
  final String skill;

  const SkillCard({required this.skill, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF141414),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1C1C1C).withValues(alpha: 0.8),
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              child: const Row(
                children: [
                  Icon(
                    Icons.flash_on,
                    size: 16,
                    color: JobsyColors.primaryColor,
                  ),
                  SizedBox(width: 4),
                  Text(
                    '5',
                    style: TextStyle(
                      color: JobsyColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                skill,
                style: const TextStyle(
                  color: JobsyColors.whiteColor,
                  fontSize: 16,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
