import 'package:codehatch/l10n/app_localizations.dart';
import 'package:codehatch/pages/profile/widgets/profile_header.dart';
import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          ProfileHeader(
            text: AppLocalizations.of(context)!.about_you,
            onEditTap: () {},
          ),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: SizedBox(
                height: 80,
                width: double.infinity,
                child: Text('Texti um þig og þína reynslu'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
