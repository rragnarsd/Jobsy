import 'package:codehatch/l10n/app_localizations.dart';
import 'package:codehatch/utils/colors.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.text,
    this.onEditTap,
    this.trailingText,
  });

  final String text;
  final VoidCallback? onEditTap;
  final String? trailingText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: theme.textTheme.titleLarge!.copyWith(fontSize: 18),
              ),
              if (onEditTap != null)
                GestureDetector(
                  onTap: onEditTap,
                  child: Row(
                    children: [
                      Text(
                        trailingText ?? local.edit,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: JobsyColors.primaryColor,
                        ),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_right,
                        color: JobsyColors.primaryColor,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
