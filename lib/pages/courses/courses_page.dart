import 'package:codehatch/l10n/app_localizations.dart';
import 'package:codehatch/models/course_model.dart';
import 'package:codehatch/utils/enums.dart';
import 'package:codehatch/widgets/app_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        title: Text(
          '${AppLocalizations.of(context)!.courses} (${CourseModel.courses.length})',
        ),
        leading: Padding(
          padding: const EdgeInsets.all(16.0),
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
          if (_showSearch) const AppSearchBar(),
          CoursesList(courses: CourseModel.courses),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
        ],
      ),
    );
  }
}

class CoursesList extends StatelessWidget {
  const CoursesList({super.key, required this.courses});

  final List<CourseModel> courses;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => CoursesCard(course: courses[index]),
        childCount: courses.length,
      ),
    );
  }
}

class CoursesCard extends StatelessWidget {
  const CoursesCard({super.key, required this.course});

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: () => context.push('/courses-details', extra: course),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                spacing: 16,
                children: [
                  Image.asset(course.logoUrl, width: 80, height: 80),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course.title,
                        style: theme.textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        course.businessName,
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
                    IconTextRow(
                      icon: Icons.calendar_today,
                      text:
                          '${course.startDate.day.toString().padLeft(2, '0')}.${course.startDate.month.toString().padLeft(2, '0')}.${course.startDate.year}',
                    ),
                    VerticalDivider(
                      color: Colors.grey.shade500,
                      indent: 3,
                      endIndent: 3,
                    ),
                    IconTextRow(
                      icon: Icons.attach_money,
                      text: course.price.toStringAsFixed(0),
                    ),
                    VerticalDivider(
                      color: Colors.grey.shade500,
                      indent: 3,
                      endIndent: 3,
                    ),
                    IconTextRow(
                      icon: Icons.location_on,
                      text: course.type == CourseTypes.remote
                          ? CourseTypes.remote.displayName
                          : CourseTypes.onSite.displayName,
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
      spacing: 4,
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        Text(
          text,
          style: theme.textTheme.bodyMedium!.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
