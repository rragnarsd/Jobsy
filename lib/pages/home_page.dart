import 'package:codehatch/pages/courses_page.dart';
import 'package:codehatch/pages/job_description_page.dart';
import 'package:codehatch/pages/profile/profile_page.dart';
import 'package:codehatch/widgets/app_search_bar.dart';
import 'package:flutter/material.dart';

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
        title: const Text('Laus störf (827)'),
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
            Text('Nýtt í dag (6)', style: theme.textTheme.bodyMedium),
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
        (context, index) => const JobCard(),
        childCount: 10,
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  const JobCard({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const JobDescriptionPage()),
      ),
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
                      Placeholder(
                        fallbackHeight: 60,
                        fallbackWidth: 60,
                        color: Colors.grey.shade300,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'SPA Supervisor',
                            style: theme.textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Hilton Reykjavík Spa',
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
                        const IconTextRow(
                          icon: Icons.work,
                          text: 'Fullt starf',
                        ),
                        VerticalDivider(
                          color: Colors.grey.shade300,
                          indent: 3,
                          endIndent: 3,
                        ),
                        const IconTextRow(
                          icon: Icons.location_on,
                          text: 'Reykjavík',
                        ),
                        VerticalDivider(
                          color: Colors.grey.shade300,
                          indent: 3,
                          endIndent: 3,
                        ),
                        const IconTextRow(
                          icon: Icons.calendar_today,
                          text: '27. jún.',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Positioned(
              top: 12,
              right: 12,
              child: Text(
                '20 mín',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
