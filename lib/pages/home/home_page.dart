import 'package:codehatch/l10n/app_localizations.dart';
import 'package:codehatch/models/job_model.dart';
import 'package:codehatch/models/workplace_model.dart';
import 'package:codehatch/pages/courses/courses_page.dart';
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
    context.read<WorkplaceProvider>().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final workplaceProvider = context.watch<WorkplaceProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${AppLocalizations.of(context)!.vacancies} (${workplaceProvider.workplaces.length})',
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
    final workplaceProvider = context.watch<WorkplaceProvider>();
    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            Expanded(
              child: Divider(
                endIndent: 16,
                color: JobsyColors.greyColor.withValues(alpha: 0.3),
              ),
            ),
            Text(
              '${AppLocalizations.of(context)!.new_today} (${workplaceProvider.jobs.length})',
              style: theme.textTheme.bodyMedium,
            ),
            Expanded(
              child: Divider(
                indent: 16,
                color: JobsyColors.greyColor.withValues(alpha: 0.3),
              ),
            ),
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
    final workplaceProvider = context.watch<WorkplaceProvider>();

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final workplace = workplaceProvider.workplaces[index];
        final job = workplaceProvider.getPrimaryJobForWorkplace(workplace);
        return JobCard(workplace: workplace, job: job);
      }, childCount: workplaceProvider.workplaces.length),
    );
  }
}

class JobCard extends StatelessWidget {
  final WorkplaceModel workplace;
  final JobModel? job;

  const JobCard({super.key, required this.workplace, required this.job});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (job == null) return const SizedBox.shrink();

    return GestureDetector(
      onTap: () => context.push('/job-description/${job!.id}'),
      child: Card(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      /* workplace.logoUrl != null
                          ? Image.network(
                              workplace.logoUrl!,
                              width: 60,
                              height: 60,
                            )
                          : const Placeholder(
                              fallbackHeight: 60,
                              fallbackWidth: 60,
                            ),*/
                      const Placeholder(fallbackHeight: 60, fallbackWidth: 60),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            job!.title,
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
                      IconTextRow(icon: Icons.work, text: job!.jobType),
                      const VerticalDivider(),
                      IconTextRow(
                        icon: Icons.location_on,
                        text: job!.isRemote
                            ? 'Remote'
                            : workplace.location.split(',').first.trim(),
                      ),
                      const VerticalDivider(),
                      IconTextRow(
                        icon: Icons.calendar_today,
                        text: job!.deadline?.toShortFormattedDate() ?? 'N/A',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Positioned(
              top: 12,
              right: 12,
              child: Text(
                //TODO
                'job!.timeAgo',
                style: TextStyle(color: JobsyColors.greyColor, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
