import 'package:codehatch/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ProfileActionButtons extends StatelessWidget {
  const ProfileActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final local = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.download, color: Color(0xFFFF7200)),
              label: Text(
                local.download_profile,
                style: theme.textTheme.bodyMedium,
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                backgroundColor: const Color(0xFF141414),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.attach_file, color: Color(0xFFFF7200)),
              label: Text(
                '${local.attachments} (4)',
                style: theme.textTheme.bodyMedium,
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                backgroundColor: const Color(0xFF141414),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
