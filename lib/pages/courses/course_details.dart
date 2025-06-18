import 'package:codehatch/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class CourseDetailsPage extends StatelessWidget {
  const CourseDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return Scaffold(
      bottomNavigationBar: const CourseBottomBar(),
      body: CustomScrollView(
        slivers: [
          const CourseSliverBar(),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                const CourseHandle(),
                const CourseHeader(),
                const CourseWorkplaceTile(),
                const CourseType(),
                CourseDivider(text: local.about_course),
                const CourseInfo(),
                const CourseCategory(),
                CourseDivider(text: '${local.more_from} X'),
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
  const CourseCategory({super.key});

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
              Container(
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
                    local.full_time,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CourseInfo extends StatelessWidget {
  const CourseInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          'Námskeiðið er fyrir þá sem vilja læra að vinna með fjarkar. Það eru margar áhugaverðar upplýsingar sem þú getur fengið út úr námskeiðinu.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}

class CourseType extends StatelessWidget {
  const CourseType({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final local = AppLocalizations.of(context)!;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 12,
                  children: [
                    const Icon(Icons.school, size: 16, color: Colors.grey),
                    Text(
                      local.course_type,
                      style: theme.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Text('Fjarkennsla', style: theme.textTheme.bodyLarge),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Divider(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 12,
                  children: [
                    const Icon(Icons.school, size: 16, color: Colors.grey),
                    Text(
                      local.price,
                      style: theme.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Text('9.000 kr', style: theme.textTheme.bodyLarge),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CourseWorkplaceTile extends StatelessWidget {
  const CourseWorkplaceTile({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset('assets/logo2.png', width: 60, height: 60),
                const SizedBox(width: 16),
                Text('Landspítali', style: theme.textTheme.titleLarge),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.keyboard_arrow_right),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseHeader extends StatelessWidget {
  const CourseHeader({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sambönd sem kæfa',
            style: theme.textTheme.headlineMedium!.copyWith(
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
  const CourseSliverBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 220,
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.share))],
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.arrow_back),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset('assets/dummy.png', fit: BoxFit.cover),
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
