import 'package:codehatch/models/profile_model.dart';
import 'package:codehatch/pages/profile/widgets/profile_action_button.dart';
import 'package:codehatch/pages/profile/widgets/profile_add_btn.dart';
import 'package:codehatch/pages/profile/widgets/profile_header.dart';
import 'package:codehatch/providers/education_provider.dart';
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

class EducationSection extends StatefulWidget {
  const EducationSection({super.key});

  @override
  State<EducationSection> createState() => _EducationSectionState();
}

class _EducationSectionState extends State<EducationSection> {
  final TextEditingController _schoolController = TextEditingController();
  final TextEditingController _degreeController = TextEditingController();
  final TextEditingController _fieldController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<EducationProvider>().loadEducation();
    });
  }

  @override
  void dispose() {
    _schoolController.dispose();
    _degreeController.dispose();
    _fieldController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<EducationProvider>(
      builder: (context, educationProvider, child) {
        return SliverList(
          delegate: SliverChildListDelegate([
            ProfileHeader(text: 'education'.tr()),
            if (educationProvider.isLoading)
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(child: CircularProgressIndicator()),
                ),
              )
            else if (educationProvider.education.isEmpty)
              SizedBox(
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'no_education_added'.tr(),
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
                    educationProvider.education.length * 2 - 1,
                    (index) {
                      if (index.isOdd) {
                        return Divider(
                          color: JobsyColors.greyColor.withValues(alpha: 0.3),
                          thickness: 1,
                        );
                      }
                      final education = educationProvider.education[index ~/ 2];

                      return AppDismissibleItem(
                        itemKey: Key(education.id.toString()),
                        onDismissed: (direction) =>
                            educationProvider.deleteEducation(education.id),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                spacing: 2,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    education.field,
                                    style: theme.textTheme.bodyLarge,
                                  ),
                                  Text(
                                    education.school,
                                    style: theme.textTheme.bodyLarge!.copyWith(
                                      color: JobsyColors.greyColor,
                                    ),
                                  ),
                                  Text(
                                    education.degree,
                                    style: theme.textTheme.bodyLarge!.copyWith(
                                      color: JobsyColors.greyColor,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    education.yearStart,
                                    style: theme.textTheme.bodyMedium!.copyWith(
                                      color: JobsyColors.greyColor,
                                    ),
                                  ),
                                  Text(
                                    education.yearEnd,
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
                    },
                  ),
                ),
              ),
            if (educationProvider.error != null)
              Card(
                color: Colors.red.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    educationProvider.error!,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ProfileAddBtn(
              title: 'add_education'.tr(),
              onPressed: () => _addEducation(context, theme),
            ),
          ]),
        );
      },
    );
  }

  void _addEducation(BuildContext context, ThemeData theme) {
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
                      ..._buildEditFields(theme, context),
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
                                _saveEducation(context);
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
    _schoolController.clear();
    _degreeController.clear();
    _fieldController.clear();
    _startDateController.clear();
    _endDateController.clear();
    _startDate = null;
    _endDate = null;
  }

  Future<void> _saveEducation(BuildContext context) async {
    final educationProvider = context.read<EducationProvider>();
    try {
      final newEducation = EducationModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        school: _schoolController.text.trim(),
        field: _fieldController.text.trim(),
        degree: _degreeController.text.trim(),
        yearStart: _startDateController.text.trim(),
        yearEnd: _endDateController.text.trim(),
      );
      await educationProvider.addEducation(newEducation);
      if (context.mounted) {
        context.pop();
        context.showToast(
          title: 'education_successfully_added'.tr(),
          type: ToastType.success,
          textColor: JobsyColors.whiteColor,
          duration: const Duration(seconds: 5),
        );
      }
    } catch (e) {
      if (context.mounted) {
        context.showToast(
          title: '${'education_add_failed'.tr()}: $e',
          type: ToastType.error,
          textColor: JobsyColors.whiteColor,
          duration: const Duration(seconds: 5),
        );
      }
    }
  }

  List<Widget> _buildEditFields(ThemeData theme, BuildContext context) {
    return [
      AppTextFormField(
        controller: _schoolController,
        labelText: 'school'.tr(),
        prefixIcon: const Icon(Icons.school),
        validator: (value) => value?.schoolError,
        textInputAction: TextInputAction.next,
      ),
      const SizedBox(height: 16),
      AppTextFormField(
        controller: _fieldController,
        labelText: 'field'.tr(),
        prefixIcon: const Icon(Icons.school),
        validator: (value) => value?.fieldError,
        textInputAction: TextInputAction.next,
      ),
      const SizedBox(height: 16),
      AppTextFormField(
        controller: _degreeController,
        labelText: 'degree'.tr(),
        prefixIcon: const Icon(Icons.school),
        validator: (value) => value?.degreeError,
        textInputAction: TextInputAction.next,
      ),
      const SizedBox(height: 16),
      Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => _selectStartDate(context),
              child: AbsorbPointer(
                child: AppTextFormField(
                  controller: _startDateController,
                  labelText: 'start_date'.tr(),
                  prefixIcon: const Icon(Icons.calendar_month),
                  validator: (value) =>
                      context.validateDateRange(_startDate, _endDate),
                  // validator: (value) => value?.startDateError,
                  textInputAction: TextInputAction.next,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: GestureDetector(
              onTap: () => _selectEndDate(context),
              child: AbsorbPointer(
                child: AppTextFormField(
                  controller: _endDateController,
                  labelText: 'end_date'.tr(),
                  prefixIcon: const Icon(Icons.calendar_month),
                  //TODO
                  validator: (value) =>
                      context.validateDateRange(_startDate, _endDate),
                  // validator: (value) => value?.endDateError,
                  textInputAction: TextInputAction.done,
                ),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 16),
    ];
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _startDate ?? DateTime.now(),
      firstDate: DateTime(1940),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: JobsyColors.primaryColor,
              onSurface: JobsyColors.whiteColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _startDate) {
      setState(() {
        _startDate = picked;
        _startDateController.text = picked.toShortFormattedDate();
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _endDate ?? (_startDate ?? DateTime.now()),
      firstDate: _startDate ?? DateTime(1940),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: JobsyColors.primaryColor,
              onSurface: JobsyColors.whiteColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _endDate = picked;
        _endDateController.text = picked.toShortFormattedDate();
      });
    }
  }
}
