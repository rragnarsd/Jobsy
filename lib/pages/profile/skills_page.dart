import 'package:codehatch/l10n/app_localizations.dart';
import 'package:codehatch/models/profile_model.dart';
import 'package:codehatch/providers/skills_provider.dart';
import 'package:codehatch/utils/colors.dart';
import 'package:codehatch/utils/extensions.dart';
import 'package:codehatch/widgets/app_empty_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SkillsPage extends StatefulWidget {
  const SkillsPage({super.key, this.initialTabIndex = 0});

  final int initialTabIndex;

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.initialTabIndex,
    );
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.removeListener(() {});
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context)!;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            title: Text(local.skills),
            centerTitle: true,
            floating: false,
            pinned: true,
            snap: false,
            forceElevated: innerBoxIsScrolled,
            leading: IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.arrow_back, color: JobsyColors.whiteColor),
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(46),
              child: Container(
                height: 46,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: JobsyColors.greyColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(26),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  indicator: _tabController.index == 1
                      ? BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(26),
                          border: Border.all(color: Colors.white, width: 1),
                        )
                      : BoxDecoration(
                          color: JobsyColors.primaryColor,
                          borderRadius: BorderRadius.circular(26),
                        ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white,
                  tabs: [
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (_tabController.index == 0)
                            const Icon(Icons.person),
                          if (_tabController.index == 0)
                            const SizedBox(width: 6),
                          Text(
                            local.my_skills,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (_tabController.index == 1)
                            const Icon(Icons.category),
                          if (_tabController.index == 1)
                            const SizedBox(width: 6),
                          Text(
                            local.categories,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
        body: TabBarView(
          controller: _tabController,
          children: [
            UserSkillList(
              onAddSkillsPressed: () => _tabController.animateTo(1),
            ),

            const SkillsFirestoreList(),
          ],
        ),
      ),
    );
  }
}

class SkillsFirestoreList extends StatelessWidget {
  const SkillsFirestoreList({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<SkillsProvider>(
      builder: (context, provider, _) {
        final docs = provider.skillsDocuments;

        return ListView.builder(
          itemCount: docs.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, docIndex) {
            final doc = docs[docIndex];
            final docId = doc['id'] as String? ?? 'Unknown';
            final data = doc['data'] as Map<String, dynamic>? ?? {};

            return ExpansionTile(
              title: Text(
                docId.toTitleCaseWithSpaces(),
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              children: data.entries.map<Widget>((entry) {
                final category = entry.key;
                final skills = List<String>.from(entry.value);

                return ExpansionTile(
                  backgroundColor: JobsyColors.greyColor.withValues(alpha: 0.1),
                  title: Text(
                    category.toTitleCaseWithSpaces(),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  children: [
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: skills.map((skill) {
                        final skillModel = SkillsModel(
                          id: docId,
                          category: category,
                          categoryItem: skill,
                        );

                        final isSelected = provider.skills.any(
                          (s) =>
                              s.category == skillModel.category &&
                              s.categoryItem == skillModel.categoryItem,
                        );

                        return SkillButton(
                          skillModel: skillModel,
                          isSelected: isSelected,
                          onPressed: () {
                            if (isSelected) {
                              provider.removeUserSkill(skillModel);
                            } else {
                              provider.addUserSkill(skillModel);
                            }
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),
                  ],
                );
              }).toList(),
            );
          },
        );
      },
    );
  }
}

class UserSkillList extends StatelessWidget {
  const UserSkillList({super.key, this.onAddSkillsPressed});

  final VoidCallback? onAddSkillsPressed;

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return Consumer<SkillsProvider>(
      builder: (context, skillsProvider, _) {
        final userSkills = skillsProvider.skills;

        if (userSkills.isEmpty) {
          return EmptyState(
            icon: Icons.school,
            title: local.no_skills,
            //TODO - Localize
            subTitle: 'Your skills will appear here',
          );
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Wrap(
            spacing: 12,
            children: userSkills.map((skill) {
              final isSelected = skillsProvider.skills.any(
                (s) =>
                    s.category == skill.category &&
                    s.categoryItem == skill.categoryItem,
              );

              return SkillButton(
                skillModel: skill,
                isSelected: isSelected,
                onPressed: () => skillsProvider.removeUserSkill(skill),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

class SkillButton extends StatelessWidget {
  const SkillButton({
    super.key,
    required this.skillModel,
    required this.onPressed,
    required this.isSelected,
  });

  final SkillsModel skillModel;
  final VoidCallback onPressed;
  final bool isSelected;

  //TODO - Reuse button?
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF141414),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      onPressed: onPressed,
      icon: isSelected
          ? const Icon(Icons.check, color: JobsyColors.primaryColor)
          : const Icon(Icons.add),
      label: Text(
        skillModel.categoryItem,
        style: theme.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
