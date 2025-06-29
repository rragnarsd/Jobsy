import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codehatch/providers/auth_provider.dart';
import 'package:codehatch/utils/colors.dart';
import 'package:codehatch/utils/extensions.dart';
import 'package:codehatch/widgets/app_textform_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
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

  String _formatDateForDisplay(dynamic birthDateData) {
    if (birthDateData == null) return 'Fæðingardagur';

    DateTime? date;

    if (birthDateData is Timestamp) {
      date = birthDateData.toDate();
    } else if (birthDateData is String) {
      try {
        date = DateTime.parse(birthDateData);
      } catch (e) {
        return birthDateData;
      }
    }

    return date != null ? date.toShortFormattedDate() : 'Fæðingardagur';
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

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    final String email = widget.user?.email ?? 'Netfang';
    final String name = widget.profile?['name'] ?? 'Nafn';
    final String phone = widget.profile?['phoneNumber'] ?? 'Símanúmer';

    final birthDateDisplay = _formatDateForDisplay(
      widget.profile?['dateOfBirth'],
    );

    return SliverToBoxAdapter(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  WoltModalSheet.show(
                    context: context,
                    pageListBuilder: (bottomSheetContext) => [
                      SliverWoltModalSheetPage(
                        backgroundColor: JobsyColors.scaffoldColor,
                        navBarHeight: 32,
                        mainContentSliversBuilder: (context) => [
                          SliverList.separated(
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                  index == 0
                                      ? 'Take a photo'
                                      : 'Select from gallery',
                                  style: theme.textTheme.bodyLarge,
                                ),
                                leading: Icon(
                                  index == 0 ? Icons.camera_alt : Icons.image,
                                  color: JobsyColors.primaryColor,
                                ),
                                onTap: Navigator.of(bottomSheetContext).pop,
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                                  return Divider(
                                    color: JobsyColors.greyColor.withValues(
                                      alpha: 0.3,
                                    ),
                                    height: 1,
                                  );
                                },
                          ),
                        ],
                      ),
                    ],
                  );
                },
                child: const CircleAvatar(
                  radius: 32,
                  backgroundColor: JobsyColors.greyColor,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: theme.textTheme.titleLarge!.copyWith(fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    ...[
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
                onPressed: () => showModalSheet(context, theme),
                color: JobsyColors.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showModalSheet(BuildContext context, ThemeData theme) {
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ..._buildEditFields(theme),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: JobsyColors.greyColor.withValues(
                                alpha: 0.2,
                              ),
                              padding: const EdgeInsets.all(16),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                              ),
                            ),
                            onPressed: Navigator.of(bottomSheetContext).pop,
                            child: Center(
                              child: Text(
                                'Cancel',
                                style: theme.textTheme.bodyLarge,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: JobsyColors.primaryColor,
                              padding: const EdgeInsets.all(16),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                              ),
                            ),
                            onPressed: () {
                              _saveChanges();
                              context.pop();
                            },
                            child: Center(
                              child: Text(
                                'Save',
                                style: theme.textTheme.bodyLarge,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _saveChanges() async {
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
  }

  List<Widget> _buildEditFields(ThemeData theme) {
    return [
      AppTextFormField(
        controller: _nameController,
        textInputAction: TextInputAction.next,
        prefixIcon: const Icon(Icons.person),
        labelText: 'Name',
        keyboardType: TextInputType.name,
        validator: (value) => null,
      ),
      const SizedBox(height: 16),
      AppTextFormField(
        controller: _emailController,
        textInputAction: TextInputAction.next,
        prefixIcon: const Icon(Icons.email),
        labelText: 'Email',
        keyboardType: TextInputType.emailAddress,
        validator: (value) => null,
      ),
      const SizedBox(height: 16),
      AppTextFormField(
        controller: _phoneController,
        textInputAction: TextInputAction.next,
        prefixIcon: const Icon(Icons.phone),
        labelText: 'Phone Number',
        keyboardType: TextInputType.phone,
        validator: (value) => null,
      ),
      const SizedBox(height: 16),
      GestureDetector(
        onTap: () => _selectDate(context),
        child: AbsorbPointer(
          child: AppTextFormField(
            controller: _birthDateController,
            textInputAction: TextInputAction.done,
            prefixIcon: const Icon(Icons.cake),
            labelText: 'Birth Date',
            hintText: 'Tap to select date',
            validator: (value) => null,
          ),
        ),
      ),
    ];
  }
}
