import 'package:cached_network_image/cached_network_image.dart';
import 'package:codehatch/models/workplace_model.dart';
import 'package:codehatch/pages/home/home_page.dart';
import 'package:codehatch/providers/workplace_provider.dart';
import 'package:codehatch/utils/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class WorkplacePage extends StatelessWidget {
  const WorkplacePage({super.key, required this.workplaceId});

  final String workplaceId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final workplace = context.watch<WorkplaceProvider>().getWorkplaceById(
      workplaceId,
    );
    if (workplace == null) {
      return Scaffold(body: Center(child: Text('workplace_not_found'.tr())));
    }

    final workplaceProvider = context.watch<WorkplaceProvider>();
    final jobsForWorkplace = workplaceProvider.jobs
        .where((job) => job.workplaceId == workplace.id)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(workplace.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: JobsyColors.whiteColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          WorkplaceHeader(workplace: workplace),
          WorkplaceDescription(description: workplace.description),
          WorkplaceSize(size: workplace.size ?? ''),
          WorkplaceAwards(awards: workplace.awards),
          WorkplacePerks(perks: workplace.perks),
          const SliverToBoxAdapter(child: SizedBox(height: 8)),
          jobsForWorkplace.isNotEmpty
              ? SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Text(
                      'newest_jobs'.tr(),
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                )
              : const SliverToBoxAdapter(child: SizedBox.shrink()),
          const SliverToBoxAdapter(child: SizedBox(height: 8)),
          WorkplaceJobsList(workplace: workplace),
        ],
      ),
    );
  }
}

class WorkplaceHeader extends StatelessWidget {
  const WorkplaceHeader({super.key, required this.workplace});

  final WorkplaceModel workplace;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: workplace.logoUrl!,
                    width: 80,
                    height: 100,
                  ),
                  const SizedBox(width: 16),
                  Text(workplace.name, style: theme.textTheme.headlineSmall),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  workplace.motto ?? '',
                  style: theme.textTheme.headlineMedium!.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              CachedNetworkImage(
                errorWidget: (_, __, ___) => const Icon(Icons.error),
                placeholder: (_, __) =>
                    const Center(child: CircularProgressIndicator()),
                imageUrl: workplace.imageUrl!,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WorkplaceDescription extends StatelessWidget {
  const WorkplaceDescription({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'about_company'.tr(),
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Text(description, style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        ),
      ),
    );
  }
}

class WorkplaceSize extends StatelessWidget {
  const WorkplaceSize({super.key, required this.size});

  final String size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Column(
            children: [
              Text(
                size,
                style: theme.textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'employees'.tr(),
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: JobsyColors.greyColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WorkplaceAwards extends StatelessWidget {
  const WorkplaceAwards({super.key, required this.awards});

  final List<String>? awards;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (awards == null || awards!.isEmpty) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    return SliverToBoxAdapter(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: List.generate(awards!.length * 2 - 1, (index) {
              if (index.isOdd) {
                return Divider(
                  color: JobsyColors.greyColor.withValues(alpha: 0.3),
                );
              }
              final award = awards![index ~/ 2];
              return ListTile(
                leading: CircleAvatar(
                  child: SvgPicture.network(
                    'https://ik.imagekit.io/redidhr3k/Untitled/Untitled%20(1)/trophy.svg?updatedAt=1751024702646',
                    width: 28,
                    height: 28,
                  ),
                ),
                title: Text(award, style: theme.textTheme.bodyLarge),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class WorkplacePerks extends StatelessWidget {
  const WorkplacePerks({super.key, required this.perks});

  final List<PerkModel>? perks;

  @override
  Widget build(BuildContext context) {
    if (perks == null || perks!.isEmpty) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'work_environment'.tr(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: List.generate(perks!.length * 2 - 1, (index) {
                  if (index.isOdd) {
                    return Divider(
                      color: JobsyColors.greyColor.withValues(alpha: 0.3),
                    );
                  }
                  final perk = perks![index ~/ 2];
                  return WorkplaceTile(
                    title: perk.title,
                    subtitle: perk.description,
                    iconUrl: perk.iconUrl,
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WorkplaceJobsList extends StatelessWidget {
  const WorkplaceJobsList({super.key, required this.workplace});

  final WorkplaceModel workplace;

  @override
  Widget build(BuildContext context) {
    final workplaceProvider = context.watch<WorkplaceProvider>();
    final jobs = workplaceProvider.jobs
        .where((job) => job.workplaceId == workplace.id)
        .toList();

    if (jobs.isEmpty) {
      return const SliverToBoxAdapter(child: SizedBox(height: 32));
    }

    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 32),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          final job = jobs[index];

          return JobCard(workplace: workplace, job: job);
        }, childCount: jobs.length),
      ),
    );
  }
}

class WorkplaceTile extends StatelessWidget {
  const WorkplaceTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconUrl,
  });

  final String title;
  final String subtitle;
  final String iconUrl;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ListTile(
      leading: CircleAvatar(
        child: SvgPicture.network(
          iconUrl,
          width: 28,
          height: 28,
          placeholderBuilder: (BuildContext context) => Container(
            padding: const EdgeInsets.all(30.0),
            child: const CircularProgressIndicator(),
          ),
        ),
      ),
      title: Text(
        title,
        style: theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700),
      ),
      subtitle: Text(subtitle, style: theme.textTheme.bodyLarge),
    );
  }
}
