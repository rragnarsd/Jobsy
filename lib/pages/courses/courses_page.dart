import 'package:codehatch/pages/courses/course_description_page.dart';
import 'package:codehatch/widgets/app_search_bar.dart';
import 'package:flutter/material.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  bool _showSearch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Námskeið (122)'),
        leading: const Padding(
          padding: EdgeInsets.all(16.0),
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
          const CoursesList(),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
        ],
      ),
    );
  }
}

class CoursesList extends StatelessWidget {
  const CoursesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => CoursesCard(index: index),
        childCount: 10,
      ),
    );
  }
}

class CoursesCard extends StatelessWidget {
  const CoursesCard({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CourseDescriptionPage()),
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                spacing: 16,
                children: [
                  Placeholder(
                    fallbackHeight: 80,
                    fallbackWidth: 80,
                    color: Colors.grey.shade300,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Námskeiðsheiti',
                        style: theme.textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Opni háskólinn í HR',
                        style: theme.textTheme.bodyMedium,
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
                      icon: Icons.calendar_today,
                      text: '01.01.2023',
                    ),
                    VerticalDivider(
                      color: Colors.grey.shade500,
                      indent: 3,
                      endIndent: 3,
                    ),
                    const IconTextRow(icon: Icons.money, text: '26.000 kr'),
                    VerticalDivider(
                      color: Colors.grey.shade500,
                      indent: 3,
                      endIndent: 3,
                    ),
                    const IconTextRow(
                      icon: Icons.location_on,
                      text: 'Staðarnám',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconTextRow extends StatelessWidget {
  const IconTextRow({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 4),
        Text(
          text,
          style: theme.textTheme.bodyMedium!.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
