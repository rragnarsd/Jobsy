import 'package:codehatch/providers/auth_provider.dart';
import 'package:codehatch/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            title: 'Language',
            tiles: [
              SettingsTileGroup(
                tiles: [
                  const SettingsTile(
                    title: 'Change Language',
                    subtitle: 'English',
                    leading: Icon(
                      Icons.language,
                      color: JobsyColors.primaryColor,
                    ),
                    trailing: Icon(
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
                    title: 'Machine Translation',
                    subtitle:
                        'Automatically translate all job information to english',
                    leading: const Icon(
                      Icons.translate,
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
            title: 'Theme',
            tiles: [
              SettingsTileGroup(
                tiles: [
                  SettingsTile(
                    title: 'Dark Theme / Light Theme',
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
            title: 'Notification Settings',
            tiles: [
              SettingsTileGroup(
                tiles: [
                  const SettingsTile(
                    title: 'New Job Matches',
                    subtitle: 'Push, SMS',
                    leading: Icon(
                      Icons.watch_later,
                      color: JobsyColors.primaryColor,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: JobsyColors.primaryColor,
                    ),
                  ),
                  Divider(
                    color: JobsyColors.greyColor.withValues(alpha: 0.3),
                    thickness: 1,
                  ),
                  const SettingsTile(
                    title: 'Application Updates',
                    subtitle: 'Push, emails, SMS',
                    leading: Icon(
                      Icons.message,
                      color: JobsyColors.primaryColor,
                    ),
                    trailing: Icon(
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
            title: 'Help & Support',
            tiles: [
              SettingsTileGroup(
                tiles: [
                  const SettingsTile(
                    title: 'Help Centre',
                    leading: Icon(
                      Icons.question_mark,
                      color: JobsyColors.primaryColor,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: JobsyColors.primaryColor,
                    ),
                  ),
                  Divider(
                    color: JobsyColors.greyColor.withValues(alpha: 0.3),
                    thickness: 1,
                  ),
                  const SettingsTile(
                    title: 'Send Us An Email',
                    leading: Icon(
                      Icons.message,
                      color: JobsyColors.primaryColor,
                    ),
                    trailing: Icon(
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
            title: 'User',
            tiles: [
              SettingsTileGroup(
                tiles: [
                  const SettingsTile(
                    title: 'Manage Account',
                    leading: Icon(
                      Icons.person,
                      color: JobsyColors.primaryColor,
                    ),
                    trailing: Icon(
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
                    title: 'Log out',
                    leading: const Icon(
                      Icons.logout,
                      color: JobsyColors.primaryColor,
                    ),
                    onTap: () {
                      context.read<AuthUserProvider>().signOut();
                    },
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
