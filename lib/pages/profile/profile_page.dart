import 'package:codehatch/pages/profile/widgets/about_section.dart';
import 'package:codehatch/pages/profile/widgets/education_section.dart';
import 'package:codehatch/pages/profile/widgets/job_section.dart';
import 'package:codehatch/pages/profile/widgets/language_section.dart';
import 'package:codehatch/pages/profile/widgets/link_section.dart';
import 'package:codehatch/pages/profile/widgets/profile_action_btn.dart';
import 'package:codehatch/pages/profile/widgets/profile_section.dart';
import 'package:codehatch/pages/profile/widgets/reference_section.dart';
import 'package:codehatch/pages/profile/widgets/skill_section.dart';
import 'package:codehatch/pages/profile/widgets/verification_section.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prófill (100%)'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),

      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProfileSection(),
                const ProfileActionButtons(),
                const Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  endIndent: 16,
                  indent: 16,
                ),
                const AboutSection(),
                const VerificationSection(),
                const JobSection(),
                const EducationSection(),
                SkillSection(),
                const LanguageSection(),
                const ReferenceSection(),
                const LinkSection(),
              ],
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
        ],
      ),
    );
  }
}
