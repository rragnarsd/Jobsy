import 'package:codehatch/widgets/app_search_bar.dart';
import 'package:flutter/material.dart';

class Workplaces extends StatefulWidget {
  const Workplaces({super.key});

  @override
  State<Workplaces> createState() => _WorkplacesState();
}

class _WorkplacesState extends State<Workplaces> {
  bool _showSearch = false;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vinnustaðir'),
        leading: const Padding(
          padding: EdgeInsets.all(16),
          child: Icon(Icons.person, color: Colors.white, size: 26),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() => _showSearch = !_showSearch);
            },
            icon: const Icon(Icons.search, color: Colors.white),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          if (_showSearch) const AppSearchBar(),
          if (_showSearch) const SliverToBoxAdapter(child: SizedBox(height: 4)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            sliver: SliverGrid.builder(
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.64,
              ),
              itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Column(
                  spacing: 8,
                  children: [
                    Placeholder(
                      fallbackHeight: 100,
                      fallbackWidth: 100,
                      color: Colors.grey.shade300,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        spacing: 6,
                        children: [
                          Text(
                            'Landspítali',
                            style: theme.textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Landspítali er lifandi og fjölbreyttur vinnustaður..',
                            style: theme.textTheme.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                          Row(
                            spacing: 8,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.person, color: Colors.white),
                              Text(
                                '4000+',
                                style: theme.textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 8,
                            children: [
                              //TODO - Add number of jobs
                              const CircleAvatar(
                                radius: 16,
                                backgroundColor: Color(0xffFF6D00),
                              ),
                              Text(
                                'Laus störf',
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
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
        ],
      ),
    );
  }
}
