import 'package:codehatch/l10n/app_localizations.dart';
import 'package:codehatch/providers/workplace_provider.dart';
import 'package:codehatch/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppTodayDivider extends StatelessWidget {
  const AppTodayDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final workplaceProvider = context.watch<WorkplaceProvider>();
    final todayJobsCount = workplaceProvider.getTodayJobsCount();

    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverToBoxAdapter(
        child: DividerItem(
          text: '${AppLocalizations.of(context)!.new_today} ($todayJobsCount)',
        ),
      ),
    );
  }
}

class AppOlderDivider extends StatelessWidget {
  const AppOlderDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final workplaceProvider = context.watch<WorkplaceProvider>();
    final olderJobsCount = workplaceProvider.getOlderJobsCount();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DividerItem(
        text: '${AppLocalizations.of(context)!.older_jobs}($olderJobsCount)',
      ),
    );
  }
}

class DividerItem extends StatelessWidget {
  const DividerItem({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            endIndent: 16,
            color: JobsyColors.greyColor.withValues(alpha: 0.3),
          ),
        ),
        Text(text, style: Theme.of(context).textTheme.bodyMedium),
        Expanded(
          child: Divider(
            indent: 16,
            color: JobsyColors.greyColor.withValues(alpha: 0.3),
          ),
        ),
      ],
    );
  }
}
