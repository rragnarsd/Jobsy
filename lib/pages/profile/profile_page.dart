import 'package:codehatch/l10n/app_localizations.dart';
import 'package:codehatch/pages/profile/widgets/about_section.dart';
import 'package:codehatch/pages/profile/widgets/education_section.dart';
import 'package:codehatch/pages/profile/widgets/job_section.dart';
import 'package:codehatch/pages/profile/widgets/language_section.dart';
import 'package:codehatch/pages/profile/widgets/link_section.dart';
import 'package:codehatch/pages/profile/widgets/profile_action_button.dart';
import 'package:codehatch/pages/profile/widgets/profile_section.dart';
import 'package:codehatch/pages/profile/widgets/reference_section.dart';
import 'package:codehatch/pages/profile/widgets/skill_section.dart';
import 'package:codehatch/providers/auth_provider.dart';
import 'package:codehatch/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    final authProvider = context.watch<AuthUserProvider>();
    final user = authProvider.currentUser;
    final profile = authProvider.userProfile;
    return Scaffold(
      appBar: AppBar(
        title: Text('${AppLocalizations.of(context)!.profile} (100%)'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: JobsyColors.whiteColor),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: JobsyColors.whiteColor),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: JobsyColors.whiteColor),
            onPressed: () => context.push('/profile/settings'),
          ),
        ],
      ),

      body: CustomScrollView(
        slivers: [
          ProfileSection(user: user, profile: profile),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  ProfileIconActionButton(text: local.download_profile),
                  const SizedBox(width: 16),
                  ProfileIconActionButton(text: '${local.attachments} (4)'),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 8)),
          SliverToBoxAdapter(
            child: Divider(
              color: JobsyColors.greyColor.withValues(alpha: 0.3),
              thickness: 1,
              endIndent: 16,
              indent: 16,
            ),
          ),
          const AboutSection(),
          const JobSection(),
          const EducationSection(),
          const SkillSection(),
          const LanguageSection(),
          const ReferenceSection(),
          const LinkSection(),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}
