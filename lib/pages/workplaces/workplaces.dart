import 'package:codehatch/l10n/app_localizations.dart';
import 'package:codehatch/models/workplace_model.dart';
import 'package:codehatch/providers/workplace_provider.dart';
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
        leading: Padding(
          padding: const EdgeInsets.all(16),
          child: GestureDetector(
            onTap: () => context.push('/profile'),
            child: const Icon(Icons.person, color: Colors.white, size: 26),
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
          if (_showSearch) ...[
            const AppSearchBar(),
            const SliverToBoxAdapter(child: SizedBox(height: 4)),
          ],
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

    return GestureDetector(
      onTap: () => context.push('/workplace-details', extra: workplace),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // TODO: Add placeholder image logic if needed
            Image.asset(workplace.logoUrl ?? '', width: 80, height: 80),
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
                      Icon(Icons.person, color: Colors.grey.shade400, size: 16),
                      Text(
                        workplace.size,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: Colors.grey.shade400,
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
                          backgroundColor: const Color(0xffFF6D00),
                          child: Text(workplace.jobIds.length.toString()),
                        ),
                      ),
                      Text(
                        local.vacancies,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: const Color(0xffFF6D00),
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
