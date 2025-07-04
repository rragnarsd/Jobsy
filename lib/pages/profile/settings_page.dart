import 'package:codehatch/l10n/app_localizations.dart';
import 'package:codehatch/pages/profile/widgets/profile_action_button.dart';
import 'package:codehatch/providers/auth_provider.dart';
import 'package:codehatch/utils/colors.dart';
import 'package:codehatch/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: JobsyColors.whiteColor),
          onPressed: () => context.pop(),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SettingsSection(
            title: local.language,
            tiles: [
              SettingsTileGroup(
                tiles: [
                  SettingsTile(
                    title: local.change_language,
                    subtitle: local.english,
                    leading: const Icon(
                      Icons.language,
                      color: JobsyColors.primaryColor,
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: JobsyColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SettingsSection(
            title: local.theme,
            tiles: [
              SettingsTileGroup(
                tiles: [
                  SettingsTile(
                    title: local.dark_theme,
                    leading: const Icon(
                      Icons.settings,
                      color: JobsyColors.primaryColor,
                    ),
                    trailing: Switch(
                      padding: EdgeInsets.zero,
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ],
          ),
          SettingsSection(
            title: local.notification_settings,
            tiles: [
              SettingsTileGroup(
                tiles: [
                  SettingsTile(
                    title: local.new_job,
                    subtitle: local.push_sms,
                    leading: const Icon(
                      Icons.watch_later,
                      color: JobsyColors.primaryColor,
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: JobsyColors.primaryColor,
                    ),
                  ),
                  Divider(
                    color: JobsyColors.greyColor.withValues(alpha: 0.3),
                    thickness: 1,
                  ),
                  SettingsTile(
                    title: local.application_updates,
                    subtitle: local.push_emails_sms,
                    leading: const Icon(
                      Icons.message,
                      color: JobsyColors.primaryColor,
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: JobsyColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SettingsSection(
            title: local.help_support,
            tiles: [
              SettingsTileGroup(
                tiles: [
                  SettingsTile(
                    title: local.help_centre,
                    leading: const Icon(
                      Icons.question_mark,
                      color: JobsyColors.primaryColor,
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: JobsyColors.primaryColor,
                    ),
                  ),
                  Divider(
                    color: JobsyColors.greyColor.withValues(alpha: 0.3),
                    thickness: 1,
                  ),
                  SettingsTile(
                    title: local.send_email,
                    leading: const Icon(
                      Icons.message,
                      color: JobsyColors.primaryColor,
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: JobsyColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SettingsSection(
            title: local.user,
            tiles: [
              SettingsTileGroup(
                tiles: [
                  SettingsTile(
                    title: local.log_out,
                    leading: const Icon(
                      Icons.logout,
                      color: JobsyColors.primaryColor,
                    ),
                    onTap: () => _logout(context, local, theme),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: JobsyColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }

  void _logout(BuildContext context, AppLocalizations local, ThemeData theme) {
    WoltModalSheet.show(
      context: context,
      barrierDismissible: true,
      pageListBuilder: (context) => [
        SliverWoltModalSheetPage(
          backgroundColor: JobsyColors.scaffoldColor,
          hasTopBarLayer: false,
          mainContentSliversBuilder: (context) => [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 32),
                    const Icon(
                      Icons.info,
                      size: 64,
                      color: JobsyColors.primaryColor,
                    ),
                    const SizedBox(height: 8),
                    Text(local.log_out, style: theme.textTheme.titleLarge),
                    const SizedBox(height: 4),
                    Text(
                      local.sure_to_logout,
                      style: theme.textTheme.bodyLarge,
                    ),
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
                          text: local.log_out,
                          color: JobsyColors.primaryColor,
                          onPressed: () {
                            context.read<AuthUserProvider>().signOut();
                            _logoutSuccess(context, local);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _logoutSuccess(BuildContext context, AppLocalizations local) {
    context.showToast(
      title: local.have_been_logged_out,
      type: ToastType.success,
      textColor: JobsyColors.whiteColor,
      duration: const Duration(seconds: 5),
    );
  }
}

class SettingsSection extends StatelessWidget {
  const SettingsSection({required this.title, required this.tiles, super.key});

  final String title;
  final List<Widget> tiles;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(title, style: theme.textTheme.titleLarge),
          ),
          ...tiles,
        ],
      ),
    );
  }
}

class SettingsTileGroup extends StatelessWidget {
  const SettingsTileGroup({required this.tiles, super.key});

  final List<Widget> tiles;

  @override
  Widget build(BuildContext context) {
    return Card(child: Column(children: tiles));
  }
}

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    super.key,
  });

  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      title: Text(title, style: theme.textTheme.bodyLarge),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: JobsyColors.greyColor,
              ),
            )
          : null,
      leading: leading,
      trailing: trailing,
      onTap: onTap,
    );
  }
}
