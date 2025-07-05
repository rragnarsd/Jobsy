import 'package:codehatch/l10n/app_localizations.dart';
import 'package:codehatch/pages/profile/widgets/profile_action_button.dart';
import 'package:codehatch/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ModalSheetItem extends StatelessWidget {
  const ModalSheetItem({
    super.key,
    required this.mainText,
    required this.subText,
    required this.onPressed,
    required this.btnText,
  });

  final String mainText;
  final String subText;
  final VoidCallback onPressed;
  final String btnText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context)!;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 32),
            const Icon(Icons.info, size: 64, color: JobsyColors.primaryColor),
            const SizedBox(height: 8),
            Text(mainText, style: theme.textTheme.titleLarge),
            const SizedBox(height: 4),
            Text(subText, style: theme.textTheme.bodyLarge),
            const SizedBox(height: 32),
            Row(
              children: [
                ProfileActionButton(
                  text: local.cancel,
                  color: JobsyColors.greyColor.withValues(alpha: 0.2),
                  onPressed: () => context.pop(),
                ),
                const SizedBox(width: 16),
                ProfileActionButton(
                  text: btnText,
                  color: JobsyColors.primaryColor,
                  onPressed: onPressed,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
