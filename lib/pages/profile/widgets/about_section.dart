import 'package:codehatch/l10n/app_localizations.dart';
import 'package:codehatch/pages/profile/widgets/profile_action_button.dart';
import 'package:codehatch/pages/profile/widgets/profile_header.dart';
import 'package:codehatch/providers/auth_provider.dart';
import 'package:codehatch/utils/colors.dart';
import 'package:codehatch/utils/validators.dart';
import 'package:codehatch/widgets/app_textform_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  late TextEditingController _aboutController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final authProvider = Provider.of<AuthUserProvider>(context, listen: false);
    final profile = authProvider.userProfile;
    _aboutController = TextEditingController(text: profile?['aboutYou'] ?? '');
  }

  @override
  void dispose() {
    _aboutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Column(
        children: [
          ProfileHeader(
            text: AppLocalizations.of(context)!.about_you,
            onEditTap: () => _showEditModal(context, local),
          ),
          _aboutController.text.isEmpty
              ? SizedBox(
                  width: double.infinity,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        local.about_you_empty,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: JobsyColors.greyColor,
                        ),
                      ),
                    ),
                  ),
                )
              : Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: Text(_aboutController.text),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  void _showEditModal(BuildContext context, AppLocalizations local) {
    WoltModalSheet.show(
      context: context,
      enableDrag: true,
      pageListBuilder: (bottomSheetContext) => [
        SliverWoltModalSheetPage(
          trailingNavBarWidget: IconButton(
            padding: const EdgeInsets.all(16),
            icon: const Icon(Icons.close),
            onPressed: Navigator.of(bottomSheetContext).pop,
          ),
          backgroundColor: JobsyColors.scaffoldColor,
          mainContentSliversBuilder: (context) => [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextFormField(
                        isMultiline: true,
                        maxLines: 6,
                        controller: _aboutController,
                        labelText: local.about_yourself,
                        hintText: local.describe_experience,
                        validator: (value) => value?.aboutError,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          ProfileActionButton(
                            text: local.cancel,
                            color: JobsyColors.greyColor.withValues(alpha: 0.2),
                            onPressed: () => context.pop(),
                          ),
                          const SizedBox(width: 16),
                          ProfileActionButton(
                            text: local.save,
                            color: JobsyColors.primaryColor,
                            onPressed: _saveChanges,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _saveChanges() async {
    if (!_formKey.currentState!.validate()) return;

    final authProvider = Provider.of<AuthUserProvider>(context, listen: false);

    final updatedProfile = {'aboutYou': _aboutController.text};

    await authProvider.updateUserProfile(updatedProfile);
    setState(() {});

    if (mounted) context.pop();
  }
}
