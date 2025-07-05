import 'package:codehatch/l10n/app_localizations.dart';
import 'package:codehatch/models/profile_model.dart';
import 'package:codehatch/pages/profile/widgets/profile_action_button.dart';
import 'package:codehatch/pages/profile/widgets/profile_add_btn.dart';
import 'package:codehatch/pages/profile/widgets/profile_header.dart';
import 'package:codehatch/providers/reference_provider.dart';
import 'package:codehatch/utils/colors.dart' show JobsyColors;
import 'package:codehatch/utils/extensions.dart';
import 'package:codehatch/utils/validators.dart';
import 'package:codehatch/widgets/app_dismissible_item.dart';
import 'package:codehatch/widgets/app_textform_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class ReferenceSection extends StatefulWidget {
  const ReferenceSection({super.key});

  @override
  State<ReferenceSection> createState() => _ReferenceSectionState();
}

class _ReferenceSectionState extends State<ReferenceSection> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _jobTitleController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ReferenceProvider>().loadReferences();
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _jobTitleController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return Consumer<ReferenceProvider>(
      builder: (context, referenceProvider, child) {
        return SliverList(
          delegate: SliverChildListDelegate([
            ProfileHeader(text: local.references),
            if (referenceProvider.isLoading)
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(child: CircularProgressIndicator()),
                ),
              )
            else if (referenceProvider.references.isEmpty)
              SizedBox(
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      local.no_reference_added,
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
                  children: List.generate(
                    referenceProvider.references.length * 2 - 1,
                    (index) {
                      if (index.isOdd) {
                        return Divider(
                          color: JobsyColors.greyColor.withValues(alpha: 0.3),
                          thickness: 1,
                        );
                      }
                      final reference =
                          referenceProvider.references[index ~/ 2];

                      return AppDismissibleItem(
                        itemKey: Key(reference.id.toString()),
                        onDismissed: (direction) =>
                            referenceProvider.deleteReference(reference.id),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                backgroundColor: JobsyColors.greyColor,
                                radius: 16,
                                child: Icon(Icons.person, size: 16),
                              ),
                              const SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    reference.name,
                                    style: theme.textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    reference.jobTitle,
                                    style: theme.textTheme.bodyLarge!.copyWith(
                                      color: JobsyColors.greyColor,
                                    ),
                                  ),
                                  Text(
                                    reference.email,
                                    style: theme.textTheme.bodyMedium!.copyWith(
                                      color: JobsyColors.primaryColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            if (referenceProvider.error != null)
              Card(
                color: Colors.red.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    referenceProvider.error!,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ProfileAddBtn(
              title: local.add_reference,
              onPressed: () => _addReference(context, local, theme),
            ),
          ]),
        );
      },
    );
  }

  void _addReference(
    BuildContext context,
    AppLocalizations local,
    ThemeData theme,
  ) {
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
                    children: [
                      ..._buildEditFields(theme, local, context),
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
                                _saveReference(context, local);
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

  void clearControllers() {
    _nameController.clear();
    _jobTitleController.clear();
    _emailController.clear();
  }

  Future<void> _saveReference(
    BuildContext context,
    AppLocalizations local,
  ) async {
    final referenceProvider = context.read<ReferenceProvider>();
    try {
      final newReference = ReferenceModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: _nameController.text.trim(),
        jobTitle: _jobTitleController.text.trim(),
        email: _emailController.text.trim(),
      );
      await referenceProvider.addReference(newReference);
      if (context.mounted) {
        context.pop();
        context.showToast(
          title: local.reference_successfully_added,
          type: ToastType.success,
          textColor: JobsyColors.whiteColor,
          duration: const Duration(seconds: 5),
        );
      }
    } catch (e) {
      if (context.mounted) {
        context.showToast(
          title: '${local.reference_add_failed}: $e',
          type: ToastType.error,
          textColor: JobsyColors.whiteColor,
          duration: const Duration(seconds: 5),
        );
      }
    }
  }

  List<Widget> _buildEditFields(
    ThemeData theme,
    AppLocalizations local,
    BuildContext context,
  ) {
    return [
      AppTextFormField(
        controller: _nameController,
        labelText: local.name,
        prefixIcon: const Icon(Icons.person),
        validator: (value) => value?.nameError,
        textInputAction: TextInputAction.next,
      ),
      const SizedBox(height: 16),
      AppTextFormField(
        controller: _jobTitleController,
        labelText: local.job_title,
        prefixIcon: const Icon(Icons.work),
        validator: (value) => value?.jobTitleError,
        textInputAction: TextInputAction.next,
      ),
      const SizedBox(height: 16),
      AppTextFormField(
        controller: _emailController,
        labelText: local.email,
        prefixIcon: const Icon(Icons.email),
        validator: (value) => value?.emailError,
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.emailAddress,
      ),
      const SizedBox(height: 16),
    ];
  }
}
