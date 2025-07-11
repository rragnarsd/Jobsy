import 'package:codehatch/models/profile_model.dart';
import 'package:codehatch/pages/profile/widgets/profile_action_button.dart';
import 'package:codehatch/pages/profile/widgets/profile_add_btn.dart';
import 'package:codehatch/pages/profile/widgets/profile_header.dart';
import 'package:codehatch/providers/link_provider.dart';
import 'package:codehatch/utils/colors.dart';
import 'package:codehatch/utils/extensions.dart';
import 'package:codehatch/utils/validators.dart';
import 'package:codehatch/widgets/app_dismissible_item.dart';
import 'package:codehatch/widgets/app_textform_field.dart';
import 'package:easy_localization/easy_localization.dart';
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
    final theme = Theme.of(context);
    return Consumer<LinkProvider>(
      builder: (context, linkProvider, child) {
        return SliverList(
          delegate: SliverChildListDelegate([
            ProfileHeader(text: 'links'.tr()),
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
                      'no_link_added'.tr(),
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
                    return AppDismissibleItem(
                      itemKey: Key(link.id.toString()),
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
              title: 'add_link'.tr(),
              onPressed: () => _addLink(context, theme),
            ),
          ]),
        );
      },
    );
  }

  void _addLink(BuildContext context, ThemeData theme) {
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
                      ..._buildEditFields(theme, context),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          ProfileActionButton(
                            text: 'cancel'.tr(),
                            color: JobsyColors.greyColor.withValues(alpha: 0.2),
                            onPressed: () => context.pop(),
                          ),
                          const SizedBox(width: 16),
                          ProfileActionButton(
                            text: 'save'.tr(),
                            color: JobsyColors.primaryColor,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _saveLink(context);
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

  List<Widget> _buildEditFields(ThemeData theme, BuildContext context) {
    return [
      AppTextFormField(
        controller: _siteController,
        labelText: 'link_site'.tr(),
        prefixIcon: const Icon(Icons.link),
        validator: (value) => value?.siteError,
        textInputAction: TextInputAction.next,
      ),
      const SizedBox(height: 16),
      AppTextFormField(
        controller: _mediaController,
        labelText: 'link_media'.tr(),
        prefixIcon: const Icon(Icons.language),
        validator: (value) => value?.mediaError,
        textInputAction: TextInputAction.done,
      ),
    ];
  }

  void clearControllers() {
    _siteController.clear();
    _mediaController.clear();
  }

  Future<void> _saveLink(BuildContext context) async {
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
          title: 'link_succesfully_added'.tr(),
          type: ToastType.success,
          textColor: JobsyColors.whiteColor,
          duration: const Duration(seconds: 5),
        );
      }
    } catch (e) {
      if (context.mounted) {
        context.showToast(
          title: '${'link_add_failed'.tr()}: $e',
          type: ToastType.error,
          textColor: JobsyColors.whiteColor,
          duration: const Duration(seconds: 5),
        );
      }
    }
  }
}
