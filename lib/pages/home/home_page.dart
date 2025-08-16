import 'package:cached_network_image/cached_network_image.dart';
import 'package:codehatch/models/job_model.dart';
import 'package:codehatch/models/workplace_model.dart';
import 'package:codehatch/pages/home/widgets/dividers.dart';
import 'package:codehatch/pages/profile/profile_page.dart';
import 'package:codehatch/providers/workplace_provider.dart';
import 'package:codehatch/utils/colors.dart';
import 'package:codehatch/utils/extensions.dart';
import 'package:codehatch/widgets/app_search_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showSearch = false;

  @override
  void initState() {
    super.initState();
    context.read<WorkplaceProvider>().initializeStreams();
  }

  @override
  Widget build(BuildContext context) {
    final workplaceProvider = context.watch<WorkplaceProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text('${'vacancies'.tr()} (${workplaceProvider.jobs.length})'),
        leading: GestureDetector(
          onTap: () => showProfile(),
          child: const Icon(
            Icons.person,
            color: JobsyColors.whiteColor,
            size: 26,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => setState(() => _showSearch = !_showSearch),
            icon: const Icon(Icons.search, color: JobsyColors.whiteColor),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          if (_showSearch) const AppSearchBar(),
          if (workplaceProvider.getTodayJobsCount() > 0)
            const AppTodayDivider(),
          const AppJobList(),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }

  void showProfile() {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (BuildContext context) {
          return const ProfilePage();
        },
      ),
    );
  }
}

class AppJobList extends StatelessWidget {
  const AppJobList({super.key});

  @override
  Widget build(BuildContext context) {
    final workplaceProvider = context.watch<WorkplaceProvider>();
    final jobSections = workplaceProvider.getJobsWithSections();

    if (jobSections.isEmpty) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final sectionItem = jobSections[index];

        if (sectionItem.isDivider) {
          return const AppOlderDivider();
        }

        return JobCard(
          workplace: sectionItem.workplace!,
          job: sectionItem.job!,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        );
      }, childCount: jobSections.length),
    );
  }
}

class JobCard extends StatelessWidget {
  const JobCard({
    super.key,
    required this.workplace,
    required this.job,
    this.padding,
  });

  final WorkplaceModel workplace;
  final JobModel job;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => context.push('/job-description/${job.id}'),
      child: Card(
        child: Stack(
          children: [
            Padding(
              padding: padding ?? const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      CachedNetworkImage(
                        imageUrl: workplace.logoUrl!,
                        width: 60,
                        height: 60,
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            job.title,
                            style: theme.textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            workplace.name,
                            style: theme.textTheme.bodyMedium!.copyWith(
                              color: JobsyColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 20,
                    child: Row(
                      children: [
                        IconTextRow(
                          icon: Icons.work,
                          text: job.jobType.displayName,
                        ),
                        VerticalDivider(
                          color: JobsyColors.greyColor.withValues(alpha: 0.5),
                          indent: 3,
                          endIndent: 3,
                        ),
                        IconTextRow(
                          icon: Icons.location_on,
                          text: job.isRemote
                              ? 'remote'.tr()
                              : workplace.location.split(',').first.trim(),
                        ),
                        VerticalDivider(
                          color: JobsyColors.greyColor.withValues(alpha: 0.5),
                          indent: 3,
                          endIndent: 3,
                        ),
                        IconTextRow(
                          icon: Icons.calendar_today,
                          text: job.deadline?.toShortFormattedDate() ?? 'N/A',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 12,
              right: 12,
              child: Text(
                job.publishedDate?.timeAgo ?? 'just_now'.tr(),
                style: const TextStyle(
                  color: JobsyColors.greyColor,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IconTextRow extends StatelessWidget {
  const IconTextRow({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Row(
      spacing: 4,
      children: [
        Icon(icon, size: 16, color: JobsyColors.greyColor),
        Text(
          text,
          style: theme.textTheme.bodyMedium!.copyWith(
            color: JobsyColors.greyColor,
          ),
        ),
      ],
    );
  }
}
