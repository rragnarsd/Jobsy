import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codehatch/pages/profile/widgets/profile_action_button.dart';
import 'package:codehatch/providers/auth_provider.dart';
import 'package:codehatch/utils/colors.dart';
import 'package:codehatch/utils/extensions.dart';
import 'package:codehatch/utils/validators.dart';
import 'package:codehatch/widgets/app_textform_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({super.key, required this.user, this.profile});

  final User? user;
  final Map<String, dynamic>? profile;

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _birthDateController;
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() {
    _nameController = TextEditingController(
      text: widget.profile?['name'] ?? '',
    );

    final birthDateTimestamp = widget.profile?['dateOfBirth'];
    if (birthDateTimestamp != null) {
      _selectedDate = birthDateTimestamp.toDate();
      _birthDateController = TextEditingController(
        text: _selectedDate!.toShortFormattedDate(),
      );
    } else {
      _birthDateController = TextEditingController(text: '');
    }

    _emailController = TextEditingController(text: widget.user?.email ?? '');
    _phoneController = TextEditingController(
      text: widget.profile?['phoneNumber'] ?? '',
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _birthDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    final String email = widget.profile?['email'] ?? 'email'.tr();
    final String name = widget.profile?['name']?.toString().isNotEmpty == true
        ? widget.profile!['name']
        : 'N/A';
    final String phone =
        widget.profile?['phoneNumber']?.toString().isNotEmpty == true
        ? widget.profile!['phoneNumber']
        : 'N/A';

    final birthDateDisplay = _formatDateForDisplay(
      widget.profile?['dateOfBirth'],
    );

    return SliverToBoxAdapter(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...[
                      [Icons.person, name],
                      [Icons.email, email],
                      [Icons.cake, birthDateDisplay],
                      [Icons.phone, phone],
                    ].map(
                      (item) => Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Row(
                          children: [
                            Icon(
                              item[0] as IconData,
                              size: 20,
                              color: JobsyColors.greyColor,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              item[1] as String,
                              style: theme.textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.arrow_forward_ios, size: 16),
                onPressed: () => showEditsheet(context, theme),
                color: JobsyColors.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showEditsheet(BuildContext context, ThemeData theme) {
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
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ..._buildEditFields(theme),
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
                            onPressed: _saveChanges,
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

  String _formatDateForDisplay(dynamic birthDateData) {
    if (birthDateData == null) {
      return 'N/A';
    }

    DateTime? date;

    if (birthDateData is Timestamp) {
      date = birthDateData.toDate();
    } else if (birthDateData is String) {
      try {
        date = DateTime.parse(birthDateData);
      } catch (e) {
        return birthDateData.toString().isNotEmpty ? birthDateData : 'N/A';
      }
    }

    return date != null ? date.toShortFormattedDate() : 'N/A';
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
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

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _birthDateController.text = picked.toShortFormattedDate();
      });
    }
  }

  Future<void> _saveChanges() async {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) return;

    final authProvider = Provider.of<AuthUserProvider>(context, listen: false);

    final updatedProfile = {
      'name': _nameController.text,
      'phoneNumber': _phoneController.text,
      'email': _emailController.text,
      'dateOfBirth': _selectedDate != null
          ? Timestamp.fromDate(_selectedDate!)
          : null,
    };

    await authProvider.updateUserProfile(updatedProfile);

    if (mounted) context.pop();
  }

  List<Widget> _buildEditFields(ThemeData theme) {
    return [
      AppTextFormField(
        controller: _nameController,
        textInputAction: TextInputAction.next,
        prefixIcon: const Icon(Icons.person),
        labelText: 'name'.tr(),
        keyboardType: TextInputType.name,
        validator: (value) => value?.nameError,
      ),
      const SizedBox(height: 16),
      AppTextFormField(
        controller: _emailController,
        textInputAction: TextInputAction.next,
        prefixIcon: const Icon(Icons.email),
        labelText: 'email'.tr(),
        keyboardType: TextInputType.emailAddress,
        validator: (value) => value?.emailError,
      ),
      const SizedBox(height: 16),
      AppTextFormField(
        controller: _phoneController,
        textInputAction: TextInputAction.next,
        prefixIcon: const Icon(Icons.phone),
        labelText: 'phone_nr'.tr(),
        keyboardType: TextInputType.phone,
        inputFormatter: [
          FilteringTextInputFormatter.allow(RegExp(r'[\d\s\-\(\)\+]')),
        ],
        validator: (value) => value?.phoneError,
      ),
      const SizedBox(height: 16),
      GestureDetector(
        onTap: () => _selectDate(context),
        child: AbsorbPointer(
          child: AppTextFormField(
            controller: _birthDateController,
            textInputAction: TextInputAction.done,
            prefixIcon: const Icon(Icons.cake),
            labelText: 'date_of_birth'.tr(),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'date_of_birth'.tr();
              }
              return null;
            },
          ),
        ),
      ),
    ];
  }
}
