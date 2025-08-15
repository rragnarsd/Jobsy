import 'package:cached_network_image/cached_network_image.dart';
import 'package:codehatch/models/workplace_model.dart';
import 'package:codehatch/providers/workplace_provider.dart';
import 'package:codehatch/utils/colors.dart';
import 'package:codehatch/widgets/app_search_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
        title: Text('workplaces'.tr()),
        leadingWidth: 90,
        leading: Image.asset('assets/icon/jobsy.png'),
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
            builder: (context, workplaces, child) {
              if (workplaces.isEmpty) {
                return const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: Text('No workplaces available')),
                  ),
                );
              }

              return SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverAlignedGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  itemCount: workplaces.length,
                  itemBuilder: (context, index) =>
                      WorkplaceItem(workplace: workplaces[index]),
                ),
              );
            },
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
    final workplaceProvider = context.watch<WorkplaceProvider>();

    final jobCount = workplaceProvider.jobs
        .where((job) => job.workplaceId == workplace.id)
        .length;

    return GestureDetector(
      onTap: () => context.push('/workplace-details/${workplace.id}'),
      child: Card(
        margin: EdgeInsets.zero,
        clipBehavior: Clip.hardEdge,
        child: Padding(
          padding: const EdgeInsets.all(8),
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
              const SizedBox(height: 8),
              Text(
                workplace.name,
                style: theme.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                workplace.description,
                style: theme.textTheme.bodyMedium,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.person, color: Colors.grey, size: 16),
                  const SizedBox(width: 4),
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
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: JobsyColors.primaryColor,
                    child: Text(
                      jobCount.toString(),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'vacancies'.tr(),
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: JobsyColors.primaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
