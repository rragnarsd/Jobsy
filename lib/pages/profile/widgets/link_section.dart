import 'package:codehatch/l10n/app_localizations.dart';
import 'package:codehatch/models/profile_model.dart';
import 'package:codehatch/pages/profile/widgets/profile_action_button.dart';
import 'package:codehatch/pages/profile/widgets/profile_add_btn.dart';
import 'package:codehatch/pages/profile/widgets/profile_header.dart';
import 'package:codehatch/providers/link_provider.dart';
import 'package:codehatch/utils/colors.dart';
import 'package:codehatch/utils/extensions.dart';
import 'package:codehatch/utils/validators.dart';
import 'package:codehatch/widgets/app_textform_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class LinkSection extends StatefulWidget {
  const LinkSection({super.key});

  @override
  State<LinkSection> createState() => _LinkSectionState();
}

class _LinkSectionState extends State<LinkSection> {
  final TextEditingController _siteController = TextEditingController();
  final TextEditingController _mediaController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LinkProvider>().loadLinks();
    });
  }

  @override
  void dispose() {
    _siteController.dispose();
    _mediaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return Consumer<LinkProvider>(
      builder: (context, linkProvider, child) {
        return SliverList(
          delegate: SliverChildListDelegate([
            ProfileHeader(text: local.links),
            if (linkProvider.isLoading)
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(child: CircularProgressIndicator()),
                ),
              )
            else if (linkProvider.links.isEmpty)
              SizedBox(
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      local.no_link_added,
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: JobsyColors.greyColor,
                      ),
                    ),
                  ),
                ),
              )
            else
              Card(
                child: Column(
                  children: List.generate(linkProvider.links.length * 2 - 1, (
                    index,
                  ) {
                    if (index.isOdd) {
                      return Divider(
                        color: JobsyColors.greyColor.withValues(alpha: 0.3),
                        thickness: 1,
                      );
                    }
                    final link = linkProvider.links[index ~/ 2];
                    return Dismissible(
                      key: Key(link.id.toString()),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: JobsyColors.errorColor,
                        ),
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 16.0),
                        child: const Icon(
                          Icons.delete,
                          color: JobsyColors.whiteColor,
                        ),
                      ),
                      onDismissed: (direction) =>
                          linkProvider.deleteLink(link.id),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: JobsyColors.greyColor,
                              radius: 16,
                              child: Icon(Icons.link),
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  link.site,
                                  style: theme.textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  link.media,
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    color: JobsyColors.greyColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            if (linkProvider.error != null)
              Card(
                color: Colors.red.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    linkProvider.error!,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ProfileAddBtn(
              title: local.add_link,
              onPressed: () => _addLink(context, local, theme),
            ),
          ]),
        );
      },
    );
  }

  void _addLink(BuildContext context, AppLocalizations local, ThemeData theme) {
    clearControllers();
    WoltModalSheet.show(
      context: context,
      pageListBuilder: (bottomSheetContext) => [
        SliverWoltModalSheetPage(
          backgroundColor: JobsyColors.scaffoldColor,
          trailingNavBarWidget: IconButton(
            padding: const EdgeInsets.all(16),
            icon: const Icon(Icons.close),
            onPressed: Navigator.of(bottomSheetContext).pop,
          ),
          mainContentSliversBuilder: (context) => [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ..._buildEditFields(theme, local, context),
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
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _saveLink(context, local);
                              }
                            },
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

  List<Widget> _buildEditFields(
    ThemeData theme,
    AppLocalizations local,
    BuildContext context,
  ) {
    return [
      AppTextFormField(
        controller: _siteController,
        labelText: local.link_site,
        prefixIcon: const Icon(Icons.link),
        validator: (value) => value?.siteError,
      ),
      const SizedBox(height: 16),
      AppTextFormField(
        controller: _mediaController,
        labelText: local.link_media,
        prefixIcon: const Icon(Icons.language),
        validator: (value) => value?.mediaError,
      ),
    ];
  }

  void clearControllers() {
    _siteController.clear();
    _mediaController.clear();
  }

  Future<void> _saveLink(BuildContext context, AppLocalizations local) async {
    final linkProvider = context.read<LinkProvider>();
    try {
      final newLink = LinkModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        site: _siteController.text.trim(),
        media: _mediaController.text.trim(),
      );
      await linkProvider.addLink(newLink);
      if (context.mounted) {
        context.pop();
        context.showToast(
          title: local.link_succesfully_added,
          type: ToastType.success,
          textColor: JobsyColors.whiteColor,
          duration: const Duration(seconds: 5),
        );
      }
    } catch (e) {
      if (context.mounted) {
        context.showToast(
          title: '${local.link_add_failed}: $e',
          type: ToastType.error,
          textColor: JobsyColors.whiteColor,
          duration: const Duration(seconds: 5),
        );
      }
    }
  }
}
