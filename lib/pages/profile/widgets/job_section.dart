import 'package:codehatch/l10n/app_localizations.dart';
import 'package:codehatch/pages/profile/widgets/profile_action_button.dart';
import 'package:codehatch/pages/profile/widgets/profile_add_btn.dart';
import 'package:codehatch/pages/profile/widgets/profile_header.dart';
import 'package:codehatch/providers/job_provider.dart';
import 'package:codehatch/utils/colors.dart';
import 'package:codehatch/utils/extensions.dart';
import 'package:codehatch/widgets/app_textform_field.dart';
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
    final local = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Consumer<JobProvider>(
      builder: (context, jobProvider, child) {
        return SliverList(
          delegate: SliverChildListDelegate([
            ProfileHeader(text: local.job_experience),

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
                      'No job experience added yet',
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

                      return Dismissible(
                        key: Key(job.id.toString()),
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
              title: local.add_job,
              onPressed: () => _addJob(context, local, theme),
            ),
          ]),
        );
      },
    );
  }

  void _addJob(BuildContext context, AppLocalizations local, ThemeData theme) {
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
                                _saveJobExperience(context, local);
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

  Future<void> _saveJobExperience(
    BuildContext context,
    AppLocalizations local,
  ) async {
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
        jobTitle: _positionController.text.trim(),
        companyName: _companyController.text.trim(),
        startDate: _startDate!,
        endDate: _endDate!,
      );

      if (context.mounted) {
        context.pop();
        context.showToast(
          title: local.job_successfully_added,
          type: ToastType.success,
          textColor: JobsyColors.whiteColor,
          duration: const Duration(seconds: 5),
        );
      }
    } catch (e) {
      if (context.mounted) {
        context.showToast(
          title: '${local.job_add_failed}: $e',
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
        controller: _companyController,
        labelText: local.which_company,
        prefixIcon: const Icon(Icons.business),
        validator: (value) => value?.companyError,
      ),
      const SizedBox(height: 16),
      AppTextFormField(
        controller: _positionController,
        labelText: local.which_position,
        prefixIcon: const Icon(Icons.work),
        validator: (value) => value?.positionError,
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
                  labelText: local.start_date,
                  prefixIcon: const Icon(Icons.calendar_month),
                  validator: (value) => value?.dateError,
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
                  labelText: local.end_date,
                  prefixIcon: const Icon(Icons.calendar_month),
                  validator: (value) => value?.dateError,
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
