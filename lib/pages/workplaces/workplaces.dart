import 'package:cached_network_image/cached_network_image.dart';
import 'package:codehatch/l10n/app_localizations.dart';
import 'package:codehatch/models/workplace_model.dart';
import 'package:codehatch/providers/workplace_provider.dart';
import 'package:codehatch/utils/colors.dart';
import 'package:codehatch/widgets/app_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Workplaces extends StatefulWidget {
  const Workplaces({super.key});

  @override
  State<Workplaces> createState() => _WorkplacesState();
}

class _WorkplacesState extends State<Workplaces> {
  bool _showSearch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.workplaces),
        actions: [
          IconButton(
            onPressed: () => setState(() => _showSearch = !_showSearch),
            icon: const Icon(Icons.search, color: JobsyColors.whiteColor),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          if (_showSearch) ...[
            const AppSearchBar(),
            const SliverToBoxAdapter(child: SizedBox(height: 4)),
          ],
          const SliverToBoxAdapter(child: SizedBox(height: 8)),
          Selector<WorkplaceProvider, List<WorkplaceModel>>(
            selector: (_, provider) => provider.workplaces,
            builder: (context, workplaces, child) => SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.76,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => WorkplaceItem(workplace: workplaces[index]),
                childCount: workplaces.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
        ],
      ),
    );
  }
}

class WorkplaceItem extends StatelessWidget {
  const WorkplaceItem({super.key, required this.workplace});

  final WorkplaceModel workplace;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context)!;
    final workplaceProvider = context.watch<WorkplaceProvider>();
    final jobCount = workplaceProvider.jobs
        .where((job) => job.workplaceId == workplace.id)
        .length;

    return GestureDetector(
      onTap: () => context.push('/workplace-details/${workplace.id}'),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CachedNetworkImage(
              imageUrl: workplace.logoUrl ?? '',
              width: 80,
              height: 80,
              placeholder: (_, __) =>
                  const Placeholder(fallbackHeight: 80, fallbackWidth: 80),
              errorWidget: (_, __, ___) => const Icon(Icons.error),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 6,
                children: [
                  Text(
                    workplace.name,
                    style: theme.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    workplace.description,
                    style: theme.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Row(
                    spacing: 8,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.person, color: Colors.grey, size: 16),
                      Text(
                        workplace.size,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: JobsyColors.greyColor,
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 8,
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: JobsyColors.primaryColor,
                          child: Text(
                            jobCount.toString(),
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        local.vacancies,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: JobsyColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
