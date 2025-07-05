import 'package:codehatch/l10n/app_localizations.dart';
import 'package:codehatch/pages/home/home_page.dart';
import 'package:codehatch/pages/profile/settings_page.dart';
import 'package:codehatch/pages/profile/widgets/about_section.dart';
import 'package:codehatch/pages/profile/widgets/education_section.dart';
import 'package:codehatch/pages/profile/widgets/job_section.dart';
import 'package:codehatch/pages/profile/widgets/language_section.dart';
import 'package:codehatch/pages/profile/widgets/link_section.dart';
import 'package:codehatch/pages/profile/widgets/profile_action_button.dart';
import 'package:codehatch/pages/profile/widgets/profile_section.dart';
import 'package:codehatch/pages/profile/widgets/reference_section.dart';
import 'package:codehatch/pages/profile/widgets/skill_section.dart';
import 'package:codehatch/providers/auth_provider.dart';
import 'package:codehatch/providers/favorites_provider.dart';
import 'package:codehatch/providers/workplace_provider.dart' as workplace;
import 'package:codehatch/utils/colors.dart';
import 'package:codehatch/widgets/app_dismissible_item.dart';
import 'package:codehatch/widgets/app_empty_state.dart';
import 'package:codehatch/widgets/app_modal_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FavoritesProvider>().loadFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    final authProvider = context.watch<AuthUserProvider>();
    final user = authProvider.currentUser;
    final profile = authProvider.userProfile;
    return Scaffold(
      appBar: AppBar(
        //TODO - Add percentage
        title: Text('${local.profile} (100%)'),
        leading: IconButton(
          icon: const Icon(Icons.close, color: JobsyColors.whiteColor),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: JobsyColors.whiteColor),
            onPressed: () => showFavorites(),
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: JobsyColors.whiteColor),
            onPressed: () => showSettings(),
          ),
        ],
      ),

      body: CustomScrollView(
        slivers: [
          ProfileSection(user: user, profile: profile),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  ProfileIconActionButton(text: local.download_profile),
                  const SizedBox(width: 16),
                  ProfileIconActionButton(text: '${local.attachments} (4)'),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 8)),
          SliverToBoxAdapter(
            child: Divider(
              color: JobsyColors.greyColor.withValues(alpha: 0.3),
              thickness: 1,
              endIndent: 16,
              indent: 16,
            ),
          ),
          const AboutSection(),
          const JobSection(),
          const EducationSection(),
          const SkillSection(),
          const LanguageSection(),
          const ReferenceSection(),
          const LinkSection(),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }

  void showSettings() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (BuildContext context) {
          return const SettingsPage();
        },
      ),
    );
  }

  void showFavorites() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (BuildContext context) {
          return const FavoritesSheet();
        },
      ),
    );
  }
}

class FavoritesSheet extends StatelessWidget {
  const FavoritesSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(local.saved_jobs),
        leading: IconButton(
          icon: const Icon(Icons.close, color: JobsyColors.whiteColor),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            onPressed: () =>
                deleteJobs(context: context, theme: theme, local: local),
            icon: const Icon(Icons.delete, color: JobsyColors.whiteColor),
          ),
        ],
      ),
      body: Consumer<FavoritesProvider>(
        builder: (context, favoritesProvider, child) {
          if (favoritesProvider.isLoading) {
            const Center(child: CircularProgressIndicator());
          }

          if (favoritesProvider.favorites.isEmpty) {
            EmptyState(
              icon: Icons.favorite_border,
              title: local.no_saved_jobs,
              subTitle: local.jobs_displayed,
            );
          }

          return ListView.builder(
            itemCount: favoritesProvider.favorites.length,
            itemBuilder: (context, index) {
              final jobId = favoritesProvider.favorites[index];
              final workplaceProvider = context
                  .watch<workplace.WorkplaceProvider>();
              final job = workplaceProvider.getJobById(jobId);

              if (job == null) {
                return const SizedBox.shrink();
              }

              final workplaceModel = workplaceProvider.getWorkplaceById(
                job.workplaceId,
              );

              if (workplaceModel == null) {
                return const SizedBox.shrink();
              }

              return AppDismissibleItem(
                itemKey: Key(job.workplaceId),
                onDismissed: (direction) =>
                    favoritesProvider.removeFavorite(job.id),
                child: JobCard(
                  workplace: workplaceModel,
                  job: job,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void deleteJobs({
    required BuildContext context,
    required ThemeData theme,
    required AppLocalizations local,
  }) {
    WoltModalSheet.show(
      context: context,
      pageListBuilder: (context) => [
        SliverWoltModalSheetPage(
          backgroundColor: JobsyColors.scaffoldColor,
          hasTopBarLayer: false,
          mainContentSliversBuilder: (context) => [
            ModalSheetItem(
              mainText: 'Delete jobs?',
              subText: 'Are you sure you want to delete all jobs?',
              btnText: 'Delete',
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
