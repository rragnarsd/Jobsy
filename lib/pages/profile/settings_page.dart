import 'package:cached_network_image/cached_network_image.dart';
import 'package:codehatch/providers/auth_provider.dart';
import 'package:codehatch/utils/colors.dart';
import 'package:codehatch/utils/extensions.dart';
import 'package:codehatch/widgets/app_modal_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'.tr()),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: JobsyColors.whiteColor),
          onPressed: () => context.pop(),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SettingsSection(
            title: 'language'.tr(),
            tiles: [
              SettingsTileGroup(
                tiles: [
                  SettingsTile(
                    title: 'change_language'.tr(),
                    leading: const Icon(
                      Icons.language,
                      color: JobsyColors.primaryColor,
                    ),
                    onTap: () => changeLanguage(context: context, theme: theme),
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
            title: 'theme'.tr(),
            tiles: [
              SettingsTileGroup(
                tiles: [
                  SettingsTile(
                    title: 'dark_theme'.tr(),
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
            title: 'notification_settings'.tr(),
            tiles: [
              SettingsTileGroup(
                tiles: [
                  SettingsTile(
                    title: 'new_job'.tr(),
                    subtitle: 'push_sms'.tr(),
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
                    title: 'application_updates'.tr(),
                    subtitle: 'push_emails_sms'.tr(),
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
            title: 'help_support'.tr(),
            tiles: [
              SettingsTileGroup(
                tiles: [
                  SettingsTile(
                    title: 'help_centre'.tr(),
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
                    title: 'send_email'.tr(),
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
            title: 'user'.tr(),
            tiles: [
              SettingsTileGroup(
                tiles: [
                  SettingsTile(
                    title: 'log_out'.tr(),
                    leading: const Icon(
                      Icons.logout,
                      color: JobsyColors.primaryColor,
                    ),
                    onTap: () => _logout(context: context, theme: theme),
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

  void changeLanguage({
    required BuildContext context,
    required ThemeData theme,
  }) {
    WoltModalSheet.show(
      context: context,
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
              child: ListTile(
                onTap: () {
                  context.setLocale(const Locale('en'));
                  Navigator.of(bottomSheetContext).pop();
                },
                visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                leading: CachedNetworkImage(
                  imageUrl:
                      'https://cdn.countryflags.com/thumbs/united-kingdom/flag-400.png',
                  height: 28,
                  width: 28,
                ),
                title: Text('English', style: theme.textTheme.bodyLarge),
              ),
            ),
            SliverToBoxAdapter(
              child: Divider(
                indent: 16,
                endIndent: 16,
                color: JobsyColors.greyColor.withValues(alpha: 0.3),
              ),
            ),
            SliverToBoxAdapter(
              child: ListTile(
                onTap: () {
                  context.setLocale(const Locale('is'));
                  Navigator.of(bottomSheetContext).pop();
                },
                visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                leading: CachedNetworkImage(
                  imageUrl:
                      'https://cdn.countryflags.com/thumbs/iceland/flag-400.png',
                  height: 28,
                  width: 28,
                ),
                title: Text('Icelandic', style: theme.textTheme.bodyLarge),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
          ],
        ),
      ],
    );
  }

  void _logout({required BuildContext context, required ThemeData theme}) {
    WoltModalSheet.show(
      context: context,
      barrierDismissible: true,
      pageListBuilder: (context) => [
        SliverWoltModalSheetPage(
          backgroundColor: JobsyColors.scaffoldColor,
          hasTopBarLayer: false,
          mainContentSliversBuilder: (context) => [
            ModalSheetItem(
              mainText: 'log_out'.tr(),
              subText: 'sure_to_logout'.tr(),
              btnText: 'log_out'.tr(),
              onPressed: () {
                context.read<AuthUserProvider>().signOut();
                _logoutSuccess(context);
              },
            ),
          ],
        ),
      ],
    );
  }

  void _logoutSuccess(BuildContext context) {
    context.showToast(
      title: 'have_been_logged_out'.tr(),
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
