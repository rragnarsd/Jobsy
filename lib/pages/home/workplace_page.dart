import 'package:cached_network_image/cached_network_image.dart';
import 'package:codehatch/l10n/app_localizations.dart';
import 'package:codehatch/models/workplace_model.dart';
import 'package:flutter/material.dart';

class WorkplacePage extends StatelessWidget {
  const WorkplacePage({super.key, required this.workplace});

  final WorkplaceModel workplace;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(workplace.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          WorkplaceHeader(workplace: workplace),
          WorkplaceDescription(description: workplace.description),
          WorkplaceSize(size: workplace.size),
          WorkplaceAwards(awards: workplace.awards),
          WorkplacePerks(perks: workplace.perks),
          WorkplaceJobs(workplaceName: workplace.name),
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
                  Image.asset(workplace.logoUrl ?? '', width: 80, height: 100),
                  const SizedBox(width: 16),
                  Text(workplace.name, style: theme.textTheme.headlineSmall),
                ],
              ),
              if (workplace.motto?.isNotEmpty ?? false)
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    workplace.motto!,
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
                imageUrl: workplace.imageUrl ?? '',
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
          child: Text(
            description,
            style: Theme.of(context).textTheme.bodyLarge,
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
    final local = AppLocalizations.of(context)!;
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
                local.employees,
                style: theme.textTheme.bodyLarge!.copyWith(color: Colors.grey),
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
              if (index.isOdd) return const Divider();
              final award = awards![index ~/ 2];
              return ListTile(
                leading: const CircleAvatar(),
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
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            children: List.generate(perks!.length * 2 - 1, (index) {
              if (index.isOdd) return const Divider();
              final perk = perks![index ~/ 2];
              return WorkplaceTile(
                title: perk.title,
                subtitle: perk.description,
              );
            }),
          ),
        ),
      ),
    );
  }
}

class WorkplaceJobs extends StatelessWidget {
  const WorkplaceJobs({super.key, required this.workplaceName});

  final String workplaceName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context)!;

    return SliverToBoxAdapter(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    local.newest_jobs,
                    style: theme.textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffFF6D00),
                    ),
                    child: Text(
                      local.all_jobs,
                      style: theme.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(height: 8),
              const Placeholder(fallbackHeight: 80, fallbackWidth: 80),
              const SizedBox(height: 8),
              Text(
                'Starf á lager',
                style: theme.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Text(workplaceName, style: theme.textTheme.bodyLarge),
            ],
          ),
        ),
      ),
    );
  }
}

class WorkplaceTile extends StatelessWidget {
  const WorkplaceTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon,
  });

  final String title;
  final String subtitle;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ListTile(
      leading: const CircleAvatar(),
      title: Text(
        title,
        style: theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700),
      ),
      subtitle: Text(subtitle, style: theme.textTheme.bodyLarge),
    );
  }
}
