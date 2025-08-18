import 'package:cached_network_image/cached_network_image.dart';
import 'package:codehatch/models/course_model.dart';
import 'package:codehatch/providers/course_provider.dart';
import 'package:codehatch/utils/colors.dart';
import 'package:codehatch/utils/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  @override
  void initState() {
    super.initState();
    context.read<CourseProvider>().initializeStreams();
  }

  @override
  Widget build(BuildContext context) {
    final courseProvider = context.watch<CourseProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text('${'courses'.tr()} (${courseProvider.courses.length})'),
        leadingWidth: 90,
        leading: Image.asset('assets/icon/jobsy.png'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_list, color: JobsyColors.whiteColor),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          CoursesList(courses: courseProvider.courses),
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
                  CachedNetworkImage(
                    imageUrl: course.logoUrl,
                    width: 60,
                    height: 60,
                    fit: BoxFit.fitWidth,
                  ),
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
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: JobsyColors.primaryColor,
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
                    IconTextRow(
                      icon: Icons.calendar_today,
                      text: course.startDate.toShortFormattedDate(),
                    ),
                    VerticalDivider(
                      color: JobsyColors.greyColor.withValues(alpha: 0.5),
                      indent: 3,
                      endIndent: 3,
                    ),
                    IconTextRow(
                      icon: Icons.attach_money,
                      text: course.price.toStringAsFixed(0),
                    ),
                    VerticalDivider(
                      color: JobsyColors.greyColor.withValues(alpha: 0.5),
                      indent: 3,
                      endIndent: 3,
                    ),
                    IconTextRow(
                      icon: Icons.location_on,
                      text: course.type.displayName,
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
        Icon(icon, size: 16, color: JobsyColors.greyColor),
        Text(
          text,
          style: theme.textTheme.bodyMedium!.copyWith(
            color: JobsyColors.greyColor,
          ),
        ),
      ],
    );
  }
}
