import 'package:codehatch/l10n/app_localizations.dart';
import 'package:codehatch/models/job_model.dart' as job_model;
import 'package:codehatch/models/workplace_model.dart';
import 'package:codehatch/pages/courses/courses_page.dart';
import 'package:codehatch/pages/profile/profile_page.dart';
import 'package:codehatch/widgets/app_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart' as intl;

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
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                ),
                child: const Icon(Icons.person, color: Colors.white, size: 26),
              ),
              const Icon(Icons.favorite, color: Colors.white, size: 24),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => setState(() => _showSearch = !_showSearch),
            icon: const Icon(Icons.search, color: Colors.white),
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
            const Expanded(child: Divider(endIndent: 16)),
            Text(
              '${AppLocalizations.of(context)!.new_today} (${dummyWorkplaces.length})',
              style: theme.textTheme.bodyMedium,
            ),
            const Expanded(child: Divider(indent: 16)),
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
  final WorkplaceModel workplace;

  const JobCard({super.key, required this.workplace});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    job_model.JobModel? primaryJob;
    if (workplace.jobIds.isNotEmpty) {
      try {
        primaryJob = job_model.jobs.firstWhere(
          (job) => job.id == workplace.jobIds.first,
          orElse: () => job_model.jobs.firstWhere(
            (job) => job.workplaceId == workplace.id,
            orElse: () => job_model.jobs.first,
          ),
        );
      } catch (e) {
        if (job_model.jobs.isNotEmpty) {
          primaryJob = job_model.jobs.first;
        }
      }
    }

    if (primaryJob == null) {
      return const Card();
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
                              color: const Color(0xFFFF8000),
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
                          color: Colors.grey.shade300,
                          indent: 3,
                          endIndent: 3,
                        ),
                        IconTextRow(
                          icon: Icons.location_on,
                          text: primaryJob.isRemote
                              ? 'Remote'
                              : primaryJob.location?.split(',').first.trim() ??
                                    'Reykjavík',
                        ),
                        VerticalDivider(
                          color: Colors.grey.shade300,
                          indent: 3,
                          endIndent: 3,
                        ),
                        IconTextRow(
                          icon: Icons.calendar_today,
                          text: intl.DateFormat(
                            'd. MMM',
                            'is_IS',
                          ).format(primaryJob.deadline),
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
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
