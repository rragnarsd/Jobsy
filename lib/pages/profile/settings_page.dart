import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
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
                    leading: Icon(Icons.language, color: Color(0xFFFF7200)),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Color(0xFFFF7200),
                    ),
                  ),
                  const Divider(color: Colors.grey, thickness: 0.5),
                  SettingsTile(
                    title: 'Machine Translation',
                    subtitle:
                        'Automatically translate all job information to english',
                    leading: const Icon(
                      Icons.translate,
                      color: Color(0xFFFF7200),
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
                      color: Color(0xFFFF7200),
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
          const SettingsSection(
            title: 'Notification Settings',
            tiles: [
              SettingsTileGroup(
                tiles: [
                  SettingsTile(
                    title: 'New Job Matches',
                    subtitle: 'Push, SMS',
                    leading: Icon(Icons.watch_later, color: Color(0xFFFF7200)),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Color(0xFFFF7200),
                    ),
                  ),
                  Divider(color: Colors.grey, thickness: 0.5),
                  SettingsTile(
                    title: 'Application Updates',
                    subtitle: 'Push, emails, SMS',
                    leading: Icon(Icons.message, color: Color(0xFFFF7200)),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Color(0xFFFF7200),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SettingsSection(
            title: 'Help & Support',
            tiles: [
              SettingsTileGroup(
                tiles: [
                  SettingsTile(
                    title: 'Help Centre',
                    leading: Icon(
                      Icons.question_mark,
                      color: Color(0xFFFF7200),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Color(0xFFFF7200),
                    ),
                  ),
                  Divider(color: Colors.grey, thickness: 0.5),
                  SettingsTile(
                    title: 'Send Us An Email',
                    leading: Icon(Icons.message, color: Color(0xFFFF7200)),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Color(0xFFFF7200),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SettingsSection(
            title: 'User',
            tiles: [
              SettingsTileGroup(
                tiles: [
                  SettingsTile(
                    title: 'Manage Account',
                    leading: Icon(Icons.person, color: Color(0xFFFF7200)),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Color(0xFFFF7200),
                    ),
                  ),
                  Divider(color: Colors.grey, thickness: 0.5),
                  SettingsTile(
                    title: 'Log out',
                    leading: Icon(Icons.logout, color: Color(0xFFFF7200)),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Color(0xFFFF7200),
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
              style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey),
            )
          : null,
      leading: leading,
      trailing: trailing,
      onTap: onTap,
    );
  }
}
