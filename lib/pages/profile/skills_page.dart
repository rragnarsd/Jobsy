import 'package:codehatch/models/skills_model.dart';
import 'package:codehatch/providers/skills_provider.dart';
import 'package:codehatch/utils/colors.dart';
import 'package:codehatch/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SkillsPage extends StatefulWidget {
  final int initialTabIndex;
  const SkillsPage({super.key, this.initialTabIndex = 0});

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

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            title: const Text('Skills'),
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
                            'My skills',
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
                            'Categories',
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
          children: const [UserSkillList(), SkillsFirestoreList()],
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

        if (docs.isEmpty) {
          return const Center(child: Text('No skills available.'));
        }

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
  const UserSkillList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SkillsProvider>(
      builder: (context, skillsProvider, _) {
        final userSkills = skillsProvider.skills;

        if (userSkills.isEmpty) {
          return const Center(child: Text('You have no skills added yet.'));
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
    required this.isSelected,
    required this.onPressed,
  });

  final SkillsModel skillModel;
  final bool isSelected;
  final void Function() onPressed;

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
