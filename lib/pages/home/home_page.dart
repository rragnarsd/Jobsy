import 'package:cached_network_image/cached_network_image.dart';
import 'package:codehatch/l10n/app_localizations.dart';
import 'package:codehatch/models/job_model.dart';
import 'package:codehatch/models/workplace_model.dart';
import 'package:codehatch/pages/home/widgets/dividers.dart';
import 'package:codehatch/providers/workplace_provider.dart';
import 'package:codehatch/utils/colors.dart';
import 'package:codehatch/utils/extensions.dart';
import 'package:codehatch/widgets/app_search_bar.dart';
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
        title: Text(
          '${AppLocalizations.of(context)!.vacancies} (${workplaceProvider.jobs.length})',
        ),
        leadingWidth: 100,
        leading: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              GestureDetector(
                onTap: () => context.push('/profile'),
                child: const Icon(
                  Icons.person,
                  color: JobsyColors.whiteColor,
                  size: 26,
                ),
              ),
              const Icon(
                Icons.favorite,
                color: JobsyColors.whiteColor,
                size: 24,
              ),
            ],
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
}

class AppJobList extends StatelessWidget {
  const AppJobList({super.key});

  @override
  Widget build(BuildContext context) {
    final workplaceProvider = context.watch<WorkplaceProvider>();
    final jobSections = workplaceProvider.getJobsWithSections();

    if (jobSections.isEmpty) {
      return const SliverToBoxAdapter(child: Center(child: SizedBox.shrink()));
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final section = jobSections[index];

        if (section.isDivider) {
          return const AppOlderDivider();
        } else if (section.section == JobSection.today) {
          return JobCard(
            workplace: section.workplace!,
            job: section.job!,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          );
        } else if (section.section == JobSection.older) {
          return JobCard(
            workplace: section.workplace!,
            job: section.job!,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          );
        } else {
          return const SizedBox.shrink();
        }
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
                  Row(
                    children: [
                      IconTextRow(icon: Icons.work, text: job.jobType),
                      const VerticalDivider(),
                      IconTextRow(
                        icon: Icons.location_on,
                        text: job.isRemote
                            ? 'Remote'
                            : workplace.location.split(',').first.trim(),
                      ),
                      const VerticalDivider(),
                      IconTextRow(
                        icon: Icons.calendar_today,
                        text: job.deadline?.toShortFormattedDate() ?? 'N/A',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 12,
              right: 12,
              child: Text(
                job.publishedDate?.timeAgo ?? 'Just now',
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
