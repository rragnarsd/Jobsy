import 'package:cached_network_image/cached_network_image.dart';
import 'package:codehatch/l10n/app_localizations.dart';
import 'package:codehatch/models/course_model.dart';
import 'package:codehatch/pages/home/job_description_page.dart';
import 'package:codehatch/providers/course_provider.dart';
import 'package:codehatch/utils/colors.dart';
import 'package:codehatch/utils/extensions.dart';
import 'package:codehatch/widgets/app_buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CourseDetailsPage extends StatelessWidget {
  const CourseDetailsPage({super.key, required this.course});

  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final courseProvider = context.watch<CourseProvider>();

    final coursesFromSameBusiness = courseProvider.getCoursesByBusinessName(
      course.businessName,
    );
    final hasMultipleCourses = coursesFromSameBusiness.length > 1;

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          top: 16,
          bottom: 32,
          left: 16,
          right: 16,
        ),
        child: AppIconElevatedButton(
          text: local.open_course,
          icon: Icons.school,
          onPressed: () {},
        ),
      ),
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
                if (hasMultipleCourses)
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
          color: JobsyColors.greyColor.withValues(alpha: 0.3),
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
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              endIndent: 16,
              color: JobsyColors.greyColor.withValues(alpha: 0.3),
            ),
          ),
          Text(text, style: theme.textTheme.bodyMedium),
          Expanded(
            child: Divider(
              indent: 16,
              color: JobsyColors.greyColor.withValues(alpha: 0.3),
            ),
          ),
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
    final theme = Theme.of(context);
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
                    .map((category) => JobTag(text: category))
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Divider(
                color: JobsyColors.greyColor.withValues(alpha: 0.3),
              ),
            ),
            CourseInfoRow(
              icon: Icons.attach_money,
              iconSize: 26,
              label: local.price,
              value: '\$${course.price.toStringAsFixed(0)}',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Divider(
                color: JobsyColors.greyColor.withValues(alpha: 0.3),
              ),
            ),
            CourseInfoRow(
              icon: Icons.calendar_today,
              iconSize: 20,
              label: local.startDate,
              value: course.startDate.toShortFormattedDate(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Divider(
                color: JobsyColors.greyColor.withValues(alpha: 0.3),
              ),
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
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, size: iconSize, color: JobsyColors.primaryColor),
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
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: ListTile(
          title: Text(course.businessName, style: theme.textTheme.titleLarge),
          leading: CachedNetworkImage(
            imageUrl: course.logoUrl,
            width: 60,
            height: 60,
            fit: BoxFit.fitWidth,
          ),
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
          Divider(color: JobsyColors.greyColor.withValues(alpha: 0.3)),
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
          icon: const Icon(Icons.share, color: JobsyColors.whiteColor),
        ),
      ],
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.arrow_back, color: JobsyColors.whiteColor),
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
