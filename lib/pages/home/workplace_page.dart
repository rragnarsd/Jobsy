import 'package:cached_network_image/cached_network_image.dart';
import 'package:codehatch/l10n/app_localizations.dart';
import 'package:codehatch/models/workplace_model.dart';
import 'package:codehatch/providers/workplace_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkplacePage extends StatefulWidget {
  const WorkplacePage({super.key, required this.workplaceId});

  final String workplaceId;

  @override
  State<WorkplacePage> createState() => _WorkplacePageState();
}

class _WorkplacePageState extends State<WorkplacePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final workplace = context.read<WorkplaceProvider>().getWorkplaceById(
        widget.workplaceId,
      );
      if (workplace != null) {
        context.read<WorkplaceProvider>().setWorkplace(workplace);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkplaceProvider>(
      builder: (context, provider, child) {
        final workplace = provider.workplace;
        if (workplace == null) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(workplace.name),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: const CustomScrollView(
            slivers: [
              WorkplaceHeader(),
              WorkplaceDescription(),
              WorkplaceSize(),
              WorkplaceAwards(),
              WorkplacePerks(),
              WorkplaceJobs(),
            ],
          ),
        );
      },
    );
  }
}

class WorkplaceDescription extends StatelessWidget {
  const WorkplaceDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Selector<WorkplaceProvider, String>(
            selector: (_, provider) => provider.workplace?.description ?? '',
            builder: (context, description, child) =>
                Text(description, style: Theme.of(context).textTheme.bodyLarge),
          ),
        ),
      ),
    );
  }
}

class WorkplaceHeader extends StatelessWidget {
  const WorkplaceHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverToBoxAdapter(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Consumer<WorkplaceProvider>(
            builder: (context, provider, child) {
              final workplace = provider.workplace;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        workplace?.logoUrl ?? '',
                        width: 80,
                        height: 100,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        workplace?.name ?? '',
                        style: theme.textTheme.headlineSmall,
                      ),
                    ],
                  ),
                  if (workplace?.motto?.isNotEmpty ?? false)
                    Text(
                      workplace!.motto!,
                      style: theme.textTheme.headlineMedium!.copyWith(
                        fontSize: 34,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  CachedNetworkImage(
                    errorWidget: (context, url, error) =>
                        const Center(child: Icon(Icons.error)),
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    imageUrl: workplace?.imageUrl ?? '',
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class WorkplaceSize extends StatelessWidget {
  const WorkplaceSize({super.key});

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
              Selector<WorkplaceProvider, String>(
                selector: (_, provider) => provider.workplace?.size ?? '',
                builder: (context, size, child) => Text(
                  size,
                  style: theme.textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
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
  const WorkplaceAwards({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Selector<WorkplaceProvider, List<String>?>(
      selector: (_, provider) => provider.workplace?.awards,
      builder: (context, awards, child) {
        if (awards == null || awards.isEmpty) {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }

        return SliverToBoxAdapter(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int index = 0; index < awards.length; index++) ...[
                    ListTile(
                      leading: const CircleAvatar(),
                      title: Text(
                        awards[index],
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                    if (index != awards.length - 1)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Divider(),
                      ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class WorkplacePerks extends StatelessWidget {
  const WorkplacePerks({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<WorkplaceProvider, List<PerkModel>?>(
      selector: (_, provider) => provider.workplace?.perks,
      builder: (context, perks, child) {
        if (perks == null || perks.isEmpty) {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }

        return SliverToBoxAdapter(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: List.generate(perks.length * 2 - 1, (index) {
                  if (index.isOdd) return const Divider();
                  final perk = perks[index ~/ 2];
                  return WorkplaceTile(
                    title: perk.title,
                    subtitle: perk.description,
                  );
                }),
              ),
            ),
          ),
        );
      },
    );
  }
}

class WorkplaceJobs extends StatelessWidget {
  const WorkplaceJobs({super.key});

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
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Divider(),
              ),
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
              Selector<WorkplaceProvider, String>(
                selector: (_, provider) => provider.workplace?.name ?? '',
                builder: (context, workplaceName, child) =>
                    Text(workplaceName, style: theme.textTheme.bodyLarge),
              ),
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
