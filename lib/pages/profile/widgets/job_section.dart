import 'package:codehatch/models/profile_model.dart';
import 'package:codehatch/pages/profile/widgets/profile_action_button.dart';
import 'package:codehatch/pages/profile/widgets/profile_add_btn.dart';
import 'package:codehatch/pages/profile/widgets/profile_header.dart';
import 'package:codehatch/providers/job_provider.dart';
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

//TODO - Add edit functionality

class JobSection extends StatefulWidget {
  const JobSection({super.key});

  @override
  State<JobSection> createState() => _JobSectionState();
}

class _JobSectionState extends State<JobSection> {
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<JobProvider>().loadJobExperience();
    });
  }

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    _companyController.dispose();
    _positionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<JobProvider>(
      builder: (context, jobProvider, child) {
        return SliverList(
          delegate: SliverChildListDelegate([
            ProfileHeader(text: 'job_experience'.tr()),

            if (jobProvider.isLoading)
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(child: CircularProgressIndicator()),
                ),
              )
            else if (jobProvider.jobExperience.isEmpty)
              SizedBox(
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'no_job_added'.tr(),
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
                    jobProvider.jobExperience.length * 2 - 1,
                    (index) {
                      if (index.isOdd) {
                        return Divider(
                          color: JobsyColors.greyColor.withValues(alpha: 0.3),
                          thickness: 1,
                        );
                      }

                      final job = jobProvider.jobExperience[index ~/ 2];

                      return AppDismissibleItem(
                        itemKey: Key(job.id.toString()),
                        onDismissed: (direction) =>
                            jobProvider.deleteJobExperience(job.id),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  spacing: 2,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      job.jobTitle,
                                      style: theme.textTheme.bodyLarge,
                                    ),
                                    Text(
                                      job.companyName,
                                      style: theme.textTheme.bodyLarge!
                                          .copyWith(
                                            color: JobsyColors.greyColor,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    job.startDate.toShortFormattedDate(),
                                    style: theme.textTheme.bodyMedium!.copyWith(
                                      color: JobsyColors.greyColor,
                                    ),
                                  ),
                                  Text(
                                    job.endDate.toShortFormattedDate(),
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
            if (jobProvider.error != null)
              Card(
                color: Colors.red.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    jobProvider.error!,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ProfileAddBtn(
              title: 'add_job'.tr(),
              onPressed: () => _addJob(context, theme),
            ),
          ]),
        );
      },
    );
  }

  void _addJob(BuildContext context, ThemeData theme) {
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
                                _saveJobExperience(context);
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
    _startDateController.clear();
    _endDateController.clear();
    _companyController.clear();
    _positionController.clear();
    _startDate = null;
    _endDate = null;
  }

  Future<void> _saveJobExperience(BuildContext context) async {
    final rangeError = context.validateDateRange(_startDate, _endDate);
    if (rangeError != null) {
      context.showToast(
        title: rangeError,
        type: ToastType.error,
        textColor: JobsyColors.whiteColor,
        duration: const Duration(seconds: 5),
      );
      return;
    }

    final jobProvider = context.read<JobProvider>();

    try {
      await jobProvider.addJobExperience(
        JobExperienceModel(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          jobTitle: _positionController.text.trim(),
          companyName: _companyController.text.trim(),
          startDate: _startDate!,
          endDate: _endDate!,
        ),
      );

      if (context.mounted) {
        context.pop();
        context.showToast(
          title: 'job_successfully_added'.tr(),
          type: ToastType.success,
          textColor: JobsyColors.whiteColor,
          duration: const Duration(seconds: 5),
        );
      }
    } catch (e) {
      if (context.mounted) {
        context.showToast(
          title: '${'job_add_failed'.tr()}: $e',
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
        controller: _companyController,
        labelText: 'which_company'.tr(),
        prefixIcon: const Icon(Icons.business),
        validator: (value) => value?.companyError,
        textInputAction: TextInputAction.next,
      ),
      const SizedBox(height: 16),
      AppTextFormField(
        controller: _positionController,
        labelText: 'which_position'.tr(),
        prefixIcon: const Icon(Icons.work),
        validator: (value) => value?.jobTitleError,
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
                  validator: (value) => value?.startDateError,
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
                  validator: (value) => value?.endDateError,
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
