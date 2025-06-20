import 'package:cached_network_image/cached_network_image.dart';
import 'package:codehatch/l10n/app_localizations.dart';
import 'package:codehatch/models/course_model.dart';
import 'package:codehatch/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CourseDetailsPage extends StatelessWidget {
  const CourseDetailsPage({super.key, required this.course});

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    return Scaffold(
      bottomNavigationBar: const CourseBottomBar(),
      body: CustomScrollView(
        slivers: [
          CourseSliverBar(course: course),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                const CourseHandle(),
                CourseHeader(course: course),
                CourseWorkplaceTile(course: course),
                CourseType(course: course),
                CourseDivider(text: local.about_course),
                CourseInfo(course: course),
                CourseCategory(course: course),
                CourseDivider(
                  text: '${local.more_from} ${course.businessName}',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CourseHandle extends StatelessWidget {
  const CourseHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 40,
        height: 4,
        margin: const EdgeInsets.only(bottom: 24),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}

class CourseDivider extends StatelessWidget {
  const CourseDivider({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const Expanded(child: Divider(endIndent: 16)),
          Text(text, style: theme.textTheme.bodyMedium),
          const Expanded(child: Divider(indent: 16)),
        ],
      ),
    );
  }
}

class CourseCategory extends StatelessWidget {
  const CourseCategory({super.key, required this.course});

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final local = AppLocalizations.of(context)!;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                local.categories,
                style: theme.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: course.categories
                    .map(
                      (category) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          child: Text(
                            category,
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CourseInfo extends StatelessWidget {
  const CourseInfo({super.key, required this.course});

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          course.courseInfo,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}

class CourseType extends StatelessWidget {
  const CourseType({super.key, required this.course});

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final formatter = DateFormat('d. MMM yyyy');
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CourseInfoRow(
              icon: Icons.school,
              iconSize: 22,
              label: local.course_type,
              value: course.type == CourseTypes.remote
                  ? CourseTypes.remote.displayName
                  : CourseTypes.onSite.displayName,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Divider(),
            ),
            CourseInfoRow(
              icon: Icons.attach_money,
              iconSize: 26,
              label: local.price,
              value: '\$${course.price.toStringAsFixed(0)}',
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Divider(),
            ),
            CourseInfoRow(
              icon: Icons.calendar_today,
              iconSize: 20,
              label: local.startDate,
              value: formatter.format(course.startDate),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Divider(),
            ),
            CourseInfoRow(
              icon: Icons.watch_later_outlined,
              iconSize: 22,
              label: local.duration,
              value: '${course.timeSpan}',
            ),
          ],
        ),
      ),
    );
  }
}

class CourseInfoRow extends StatelessWidget {
  const CourseInfoRow({
    super.key,
    required this.icon,
    required this.iconSize,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final double iconSize;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, size: iconSize, color: const Color(0xFFFF7200)),
            const SizedBox(width: 12),
            Text(
              label,
              style: theme.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        Text(value, style: theme.textTheme.bodyLarge),
      ],
    );
  }
}

class CourseWorkplaceTile extends StatelessWidget {
  const CourseWorkplaceTile({super.key, required this.course});

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: ListTile(
          title: Text(course.businessName, style: theme.textTheme.titleLarge),
          leading: Image.asset(course.logoUrl, width: 60, height: 60),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.keyboard_arrow_right),
          ),
        ),
      ),
    );
  }
}

class CourseHeader extends StatelessWidget {
  const CourseHeader({super.key, required this.course});

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            course.title,
            style: theme.textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const Divider(),
        ],
      ),
    );
  }
}

class CourseSliverBar extends StatelessWidget {
  const CourseSliverBar({super.key, required this.course});

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 160,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.share, color: Colors.white),
        ),
      ],
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.arrow_back, color: Colors.white),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: CachedNetworkImage(
          errorWidget: (_, __, ___) => const Icon(Icons.error),
          placeholder: (_, __) =>
              const Center(child: CircularProgressIndicator()),
          imageUrl: course.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class CourseBottomBar extends StatelessWidget {
  const CourseBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 32, left: 16, right: 16),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffFF6D00),
          padding: const EdgeInsets.all(16),
        ),
        child: Row(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.school, size: 24, color: Colors.white),
            Text(
              AppLocalizations.of(context)!.open_course,
              style: theme.textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
