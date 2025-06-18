import 'package:codehatch/l10n/app_localizations.dart';
import 'package:codehatch/pages/profile/widgets/profile_header.dart';
import 'package:flutter/material.dart';

class VerificationSection extends StatelessWidget {
  const VerificationSection({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final local = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileHeader(text: local.verification, onEditTap: () {}),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Your name', style: theme.textTheme.bodyLarge),
                    Text('John Doe', style: theme.textTheme.bodyLarge),
                  ],
                ),
                const Divider(color: Colors.grey, thickness: 0.5, height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ID no.', style: theme.textTheme.bodyLarge),
                    Text('123456789', style: theme.textTheme.bodyLarge),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 6, bottom: 8),
                  child: Divider(color: Colors.grey, thickness: 0.5),
                ),
                Text(
                  'Your full name and social security number will be available...',
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
