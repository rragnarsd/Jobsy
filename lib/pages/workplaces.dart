import 'package:codehatch/pages/home_page.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vinnustaðir'),
        backgroundColor: const Color(0xffFF6D00),
        actions: [
          IconButton(
            onPressed: () {
              setState(() => _showSearch = !_showSearch);
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          if (_showSearch) const AppSearchBar(),
          if (_showSearch) const SliverToBoxAdapter(child: SizedBox(height: 4)),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid.builder(
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                crossAxisCount: 2,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (context, index) => Card(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Placeholder(
                      fallbackHeight: 100,
                      fallbackWidth: 100,
                      color: Colors.grey.shade300,
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 6,
                        children: [
                          const Text(
                            'Landspítali',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'Landspítali er lifandi og fjölbreyttur vinnustaður..',
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.person),
                              SizedBox(width: 8),
                              Text('4000+'),
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 16,
                                backgroundColor: Colors.grey.shade300,
                              ),
                              const SizedBox(width: 8),
                              const Text('Laus störf'),
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
        ],
      ),
    );
  }
}
