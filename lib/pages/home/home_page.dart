import 'package:codehatch/l10n/app_localizations.dart';
import 'package:codehatch/models/job_model.dart' as job_model;
import 'package:codehatch/models/workplace_model.dart';
import 'package:codehatch/pages/courses/courses_page.dart';
import 'package:codehatch/utils/colors.dart';
import 'package:codehatch/utils/extensions.dart';
import 'package:codehatch/widgets/app_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showSearch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${AppLocalizations.of(context)!.vacancies} (${dummyWorkplaces.length})',
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
                child: const Icon(Icons.person, color: JobsyColors.whiteColor, size: 26),
              ),
              const Icon(Icons.favorite, color: JobsyColors.whiteColor, size: 24),
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
          const AppDivider(),
          const AppJobList(),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
             Expanded(child: Divider(endIndent: 16,color: JobsyColors.greyColor.withValues(alpha: 0.3))),
            Text(
              '${AppLocalizations.of(context)!.new_today} (${dummyWorkplaces.length})',
              style: theme.textTheme.bodyMedium,
            ),
             Expanded(child: Divider(indent: 16, color: JobsyColors.greyColor.withValues(alpha: 0.3),)),
          ],
        ),
      ),
    );
  }
}

class AppJobList extends StatelessWidget {
  const AppJobList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => JobCard(workplace: dummyWorkplaces[index]),
        childCount: dummyWorkplaces.length,
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  const JobCard({super.key, required this.workplace});

  final WorkplaceModel workplace;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    final primaryJob = job_model.jobs.primaryForWorkplace(workplace);

    if (primaryJob == null) {
      return const SizedBox.shrink();
    }

    return GestureDetector(
      onTap: () => context.push('/job-description', extra: primaryJob),
      child: Card(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 16,
                    children: [
                      Image.asset(
                        workplace.logoUrl ?? '',
                        width: 60,
                        height: 60,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            workplace.primaryJobTitle,
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
                      spacing: 4,
                      children: [
                        IconTextRow(
                          icon: Icons.work,
                          text: primaryJob.jobType.toDisplayString(),
                        ),
                        VerticalDivider(
                       color: JobsyColors.greyColor.withValues(alpha: 0.3),
                          indent: 3,
                          endIndent: 3,
                        ),
                        IconTextRow(
                          //TODO - Modify this
                          icon: Icons.location_on,
                          text: primaryJob.isRemote
                              ? 'Remote'
                              : primaryJob.location?.split(',').first.trim() ??
                                    'Reykjavík',
                        ),
                        VerticalDivider(
                          color: JobsyColors.greyColor.withValues(alpha: 0.3),
                          indent: 3,
                          endIndent: 3,
                        ),
                        IconTextRow(
                          icon: Icons.calendar_today,
                          text: primaryJob.deadline.toShortFormattedDate(),
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
                primaryJob.timeAgo,
                style: const TextStyle(color: JobsyColors.greyColor, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension JobUtils on List<job_model.JobModel> {
  job_model.JobModel? primaryForWorkplace(WorkplaceModel workplace) {
    if (workplace.jobIds.isNotEmpty) {
      final jobById = where(
        (job) => job.id == workplace.jobIds.first,
      ).firstOrNull;
      if (jobById != null) return jobById;
    }

    final jobByWorkplace = where(
      (job) => job.workplaceId == workplace.id,
    ).firstOrNull;
    if (jobByWorkplace != null) return jobByWorkplace;

    return isNotEmpty ? first : null;
  }
}
