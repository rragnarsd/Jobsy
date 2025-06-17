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
        leading: const Padding(
          padding: EdgeInsets.all(16),
          child: Icon(Icons.person, color: Colors.white, size: 26),
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
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            sliver: Selector<WorkplaceProvider, List<WorkplaceModel>>(
              selector: (_, provider) => provider.workplaces,
              builder: (context, workplaces, child) => SliverGrid.builder(
                itemCount: workplaces.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.62,
                ),
                itemBuilder: (context, index) =>
                    SliverItem(workplaceId: workplaces[index].id),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
        ],
      ),
    );
  }
}

class SliverItem extends StatelessWidget {
  const SliverItem({super.key, required this.workplaceId});

  final String workplaceId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context)!;

    return Selector<WorkplaceProvider, WorkplaceModel?>(
      selector: (_, provider) => provider.getWorkplaceById(workplaceId),
      builder: (context, workplace, child) {
        if (workplace == null) return const SizedBox.shrink();

        return GestureDetector(
          onTap: () {
            context.read<WorkplaceProvider>().setWorkplace(workplace);
            context.push('/workplace-details', extra: workplace.id);
          },
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Column(
              spacing: 8,
              children: [
                //TODO - Add placeholder image
                Image.asset(workplace.logoUrl ?? '', width: 100, height: 100),
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
                          const Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 16,
                          ),
                          Text(
                            workplace.size,
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 8,
                        children: [
                          CircleAvatar(
                            radius: 16,
                            backgroundColor: const Color(0xffFF6D00),
                            child: Text(workplace.jobIds.length.toString()),
                          ),
                          Text(
                            local.vacancies,
                            style: theme.textTheme.bodyLarge!.copyWith(
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
      },
    );
  }
}
