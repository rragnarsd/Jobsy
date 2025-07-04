import 'package:flutter/material.dart';

extension DateRangeValidator on BuildContext {
  String? validateDateRange(DateTime? start, DateTime? end) {
    if (start == null || end == null) return 'Start and end dates are required';
    if (end.isBefore(start)) return 'End date cannot be before start date';
    return null;
  }
}

extension StringValidators on String {
  static final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$');
  static final RegExp _nameRegex = RegExp(r'^[a-zA-Z\s]{2,}$');
  //static final RegExp _phoneRegex = RegExp(r'^\+?\d{7,15}$');
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

  bool isValidGenericField(RegExp regex) => _matches(regex);

  bool get isValidCompany => _matches(_generalTextRegex);

  bool get isValidPosition => _matches(_generalTextRegex);

  bool get isValidSchool => _matches(_generalTextRegex);

  bool get isValidField => _matches(_generalTextRegex);

  bool get isValidDegree => _matches(_generalTextRegex);

  bool get isValidLanguage => _matches(_generalTextRegex);

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
    emptyMessage: 'Email is required',
    isValid: isValidEmail,
    invalidMessage: 'Invalid email',
  );

  String? get passwordError => _errorMessage(
    emptyMessage: 'Password is required',
    isValid: isValidPassword,
    invalidMessage: 'Password must be at least 6 characters',
  );

  String? get nameError => _errorMessage(
    emptyMessage: 'Name is required',
    isValid: isValidName,
    invalidMessage: 'Invalid name',
  );

  String? get phoneError => _errorMessage(
    emptyMessage: 'Phone number is required',
    isValid: isValidPhone,
    invalidMessage: 'Invalid phone number',
  );

  String? get companyError => _errorMessage(
    emptyMessage: 'Please enter company name',
    isValid: isValidCompany,
    invalidMessage: 'Invalid company name',
  );

  String? get positionError => _errorMessage(
    emptyMessage: 'Please enter job position',
    isValid: isValidPosition,
    invalidMessage: 'Invalid position',
  );

  String? get dateError => isEmpty ? 'Please select a date' : null;

  String? get aboutError => _errorMessage(
    emptyMessage: 'Please enter about yourself',
    isValid: isValidAbout,
    invalidMessage: 'About yourself must be at least 10 characters',
  );

  String? get schoolError => _errorMessage(
    emptyMessage: 'Please enter school name',
    isValid: isValidSchool,
    invalidMessage: 'Invalid school name',
  );

  String? get fieldError => _errorMessage(
    emptyMessage: 'Please enter field of study',
    isValid: isValidField,
    invalidMessage: 'Invalid field of study',
  );

  String? get degreeError => _errorMessage(
    emptyMessage: 'Please enter degree',
    isValid: isValidDegree,
    invalidMessage: 'Invalid degree',
  );

  String? get startDateError => _errorMessage(
    emptyMessage: 'Please enter start date',
    isValid: isValidStartDate,
    invalidMessage: 'Invalid start date',
  );

  String? get endDateError => _errorMessage(
    emptyMessage: 'Please enter end date',
    isValid: isValidEndDate,
    invalidMessage: 'Invalid end date',
  );

  String? get languageError => _errorMessage(
    emptyMessage: 'Please select a language',
    isValid: isValidLanguage,
    invalidMessage: 'Invalid language',
  );

  String? get jobTitleError => _errorMessage(
    emptyMessage: 'Please enter job title',
    isValid: isValidJobTitle,
    invalidMessage: 'Invalid job title',
  );

  String? get siteError => _errorMessage(
    emptyMessage: 'Please enter site',
    isValid: isValidSite,
    invalidMessage: 'Invalid site',
  );

  String? get mediaError => _errorMessage(
    emptyMessage: 'Please enter media',
    isValid: isValidMedia,
    invalidMessage: 'Invalid media',
  );
}
