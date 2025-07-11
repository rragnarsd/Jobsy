import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension DateRangeValidator on BuildContext {
  String? validateDateRange(DateTime? start, DateTime? end) {
    if (start == null || end == null) return 'start_end_validation'.tr();
    if (end.isBefore(start)) return 'end_date_validation'.tr();
    return null;
  }
}

extension StringValidators on String {
  static final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$');
  static final RegExp _nameRegex = RegExp(r'^[a-zA-Z\s]{2,}$');
  static final RegExp _yearRegex = RegExp(r'^[0-9]{4}$');
  static final RegExp _generalTextRegex = RegExp(r'^[a-zA-Z0-9\s&.,\-]{2,}$');

  bool _matches(RegExp regex) => regex.hasMatch(trim());

  bool get isValidEmail => _matches(_emailRegex);

  bool get isValidPassword => trim().length >= 6;

  bool get isValidName => _matches(_nameRegex);

  bool get isValidPhone {
    final cleaned = replaceAll(RegExp(r'[^\d\+]'), '');
    final isValid = RegExp(r'^\+?\d{7,15}$').hasMatch(cleaned);

    return isValid;
  }

  String? get proficiencyError => isEmpty ? 'language_level'.tr() : null;

  bool isValidGenericField(RegExp regex) => _matches(regex);

  bool get isValidCompany => _matches(_generalTextRegex);

  bool get isValidPosition => _matches(_generalTextRegex);

  bool get isValidSchool => _matches(_generalTextRegex);

  bool get isValidField => _matches(_generalTextRegex);

  bool get isValidDegree => _matches(_generalTextRegex);

  bool get isValidLanguage => _matches(_generalTextRegex);

  bool get isValidLanguageProficiency => _matches(_generalTextRegex);

  bool get isValidJobTitle => _matches(_generalTextRegex);

  bool get isValidSite => _matches(_generalTextRegex);

  bool get isValidMedia => _matches(_generalTextRegex);

  bool get isValidStartDate => _matches(_yearRegex);

  bool get isValidEndDate => _matches(_yearRegex);

  bool get isValidAbout => trim().length >= 10;

  String? _errorMessage({
    required String emptyMessage,
    required bool isValid,
    String? invalidMessage,
  }) {
    if (isEmpty) return emptyMessage;
    if (!isValid && invalidMessage != null) return invalidMessage;
    return null;
  }

  String? get emailError => _errorMessage(
    emptyMessage: 'email_required'.tr(),
    isValid: isValidEmail,
    invalidMessage: 'invalid_email'.tr(),
  );

  String? get passwordError => _errorMessage(
    emptyMessage: 'password_required'.tr(),
    isValid: isValidPassword,
    invalidMessage: 'invalid_password'.tr(),
  );

  String? get nameError => _errorMessage(
    emptyMessage: 'name_required'.tr(),
    isValid: isValidName,
    invalidMessage: 'invalid_name'.tr(),
  );

  String? get phoneError => _errorMessage(
    emptyMessage: 'phone_required'.tr(),
    isValid: isValidPhone,
    invalidMessage: 'invalid_phone'.tr(),
  );

  String? get companyError => _errorMessage(
    emptyMessage: 'company_required'.tr(),
    isValid: isValidCompany,
    invalidMessage: 'invalid_company'.tr(),
  );

  String? get positionError => _errorMessage(
    emptyMessage: 'position_required'.tr(),
    isValid: isValidPosition,
    invalidMessage: 'invalid_position'.tr(),
  );

  String? get dateError => isEmpty ? 'Please select a date' : null;

  String? get aboutError => _errorMessage(
    emptyMessage: 'about_yourself'.tr(),
    isValid: isValidAbout,
    invalidMessage: 'about_yourself_invalid'.tr(),
  );

  String? get schoolError => _errorMessage(
    emptyMessage: 'school_required'.tr(),
    isValid: isValidSchool,
    invalidMessage: 'invalid_school'.tr(),
  );

  String? get fieldError => _errorMessage(
    emptyMessage: 'field_required'.tr(),
    isValid: isValidField,
    invalidMessage: 'field_invalid'.tr(),
  );

  String? get degreeError => _errorMessage(
    emptyMessage: 'degree_required'.tr(),
    isValid: isValidDegree,
    invalidMessage: 'degree_invalid'.tr(),
  );

  String? get startDateError => _errorMessage(
    emptyMessage: 'start_date_required'.tr(),
    isValid: isValidStartDate,
    invalidMessage: 'start_date_invalid'.tr(),
  );

  String? get endDateError => _errorMessage(
    emptyMessage: 'end_date_required'.tr(),
    isValid: isValidEndDate,
    invalidMessage: 'end_date_invalid'.tr(),
  );

  String? get languageError => _errorMessage(
    emptyMessage: 'language_required'.tr(),
    isValid: isValidLanguage,
    invalidMessage: 'language_invalid'.tr(),
  );

  String? get jobTitleError => _errorMessage(
    emptyMessage: 'job_title_required'.tr(),
    isValid: isValidJobTitle,
    invalidMessage: 'job_title_invalid'.tr(),
  );

  String? get siteError => _errorMessage(
    emptyMessage: 'link_site_required'.tr(),
    isValid: isValidSite,
    invalidMessage: 'link_site_invalid'.tr(),
  );

  String? get mediaError => _errorMessage(
    emptyMessage: 'link_media_required'.tr(),
    isValid: isValidMedia,
    invalidMessage: 'link_media_invalid'.tr(),
  );
}
