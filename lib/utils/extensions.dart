import 'package:codehatch/utils/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toastification/toastification.dart';

extension DateFormatting on DateTime {
  String toShortFormattedDate() {
    final formatter = DateFormat('d. MMM yyyy');
    return formatter.format(this);
  }
}

extension AppSharedPrefs on SharedPreferences {
  Future<void> saveString(String key, String value) async {
    await setString(key, value);
  }

  String? getStringOrDefault(String key, [String fallback = '']) {
    return getString(key) ?? fallback;
  }
}

extension TimeAgoExtension on DateTime {
  String get timeAgo {
    final now = DateTime.now();
    final duration = now.difference(this);

    if (duration.inDays >= 365) {
      final years = (duration.inDays / 365).round();
      return '$years year${years > 1 ? 's' : ''} ago';
    }

    if (duration.inDays >= 30) {
      final months = (duration.inDays / 30).round();
      return '$months month${months > 1 ? 's' : ''} ago';
    }

    if (duration.inDays >= 7) {
      final weeks = (duration.inDays / 7).round();
      return '$weeks week${weeks > 1 ? 's' : ''} ago';
    }

    if (duration.inDays >= 1) {
      return '${duration.inDays} day${duration.inDays > 1 ? 's' : ''} ago';
    }

    if (duration.inHours >= 1) {
      return '${duration.inHours} hour${duration.inHours > 1 ? 's' : ''} ago';
    }

    if (duration.inMinutes >= 10) {
      final rounded = ((duration.inMinutes / 10).round()) * 10;
      return '$rounded minute${rounded > 1 ? 's' : ''} ago';
    }

    if (duration.inMinutes >= 5) return 'A few minutes ago';

    return 'Just now';
  }
}

extension CategoryFormat on String {
  String toTitleCaseWithSpaces() {
    final spaced = replaceAllMapped(
      RegExp(r'([a-z])([A-Z])'),
      (match) => '${match.group(1)} ${match.group(2)}',
    );

    return spaced[0].toUpperCase() + spaced.substring(1);
  }
}

enum ToastType { success, error, info, warning }

extension ToastTypeProperties on ToastType {
  Color get primaryColor => switch (this) {
    ToastType.success => JobsyColors.successColor,
    ToastType.error => JobsyColors.errorColor,
    ToastType.info => Colors.blue,
    ToastType.warning => Colors.orange,
  };

  IconData get icon => switch (this) {
    ToastType.success => Icons.check_circle,
    ToastType.error => Icons.error,
    ToastType.info => Icons.info,
    ToastType.warning => Icons.warning,
  };

  ToastificationType get toastificationType => switch (this) {
    ToastType.success => ToastificationType.success,
    ToastType.error => ToastificationType.error,
    ToastType.info => ToastificationType.info,
    ToastType.warning => ToastificationType.warning,
  };

  Duration get defaultDuration => switch (this) {
    ToastType.success => const Duration(seconds: 3),
    ToastType.error => const Duration(seconds: 5),
    ToastType.info || ToastType.warning => const Duration(seconds: 4),
  };
}

extension ToastificationExtension on BuildContext {
  void showToast({
    required String title,
    required ToastType type,
    Color? backgroundColor,
    Color? textColor,
    Duration? duration,
    Alignment alignment = Alignment.bottomCenter,
  }) {
    final toastColor = textColor ?? JobsyColors.blackColor;
    toastification.show(
      context: this,
      style: ToastificationStyle.fillColored,
      primaryColor: type.primaryColor,
      backgroundColor: backgroundColor ?? JobsyColors.whiteColor,
      foregroundColor: toastColor,
      title: Text(
        title,
        style: Theme.of(this).textTheme.bodyMedium?.copyWith(color: toastColor),
      ),
      type: type.toastificationType,
      icon: Icon(type.icon, color: toastColor),
      alignment: alignment,
      autoCloseDuration: duration ?? type.defaultDuration,
    );
  }
}

enum LanguageProficiency {
  beginner,
  basicSkills,
  intermediate,
  advanced,
  expert,
}

extension LanguageProficiencyExtension on LanguageProficiency {
  String getLabel() => switch (this) {
    LanguageProficiency.beginner => 'beginner'.tr(),
    LanguageProficiency.basicSkills => 'basic_skills'.tr(),
    LanguageProficiency.intermediate => 'intermediate'.tr(),
    LanguageProficiency.advanced => 'advanced'.tr(),
    LanguageProficiency.expert => 'expert'.tr(),
  };

  String getEnglishValue() => switch (this) {
    LanguageProficiency.beginner => 'beginner',
    LanguageProficiency.basicSkills => 'basic_skills',
    LanguageProficiency.intermediate => 'intermediate',
    LanguageProficiency.advanced => 'advanced',
    LanguageProficiency.expert => 'expert',
  };
}

LanguageProficiency languageProficiencyFromEnglishValue(String value) =>
    switch (value) {
      'beginner' => LanguageProficiency.beginner,
      'basic_skills' => LanguageProficiency.basicSkills,
      'intermediate' => LanguageProficiency.intermediate,
      'advanced' => LanguageProficiency.advanced,
      'expert' => LanguageProficiency.expert,
      _ => LanguageProficiency.beginner, // fallback
    };

enum CourseTypes { onSite, remote }

extension CourseTypesExtension on CourseTypes {
  String get displayName => switch (this) {
    CourseTypes.onSite => 'On-site',
    CourseTypes.remote => 'Remote',
  };
}

enum JobStatus { inProgress, active, ended }

extension JobStatusExtension on JobStatus {
  String get displayName => switch (this) {
    JobStatus.inProgress => 'In Progress',
    JobStatus.active => 'Active',
    JobStatus.ended => 'Ended',
  };

  Color get color => switch (this) {
    JobStatus.inProgress => Colors.orange,
    JobStatus.active => Colors.green,
    JobStatus.ended => Colors.grey,
  };
}

enum JobPerks { activity, workingHours, health, food, commute, entertainment }

extension JobPerksExtension on JobPerks {
  String get displayName => switch (this) {
    JobPerks.activity => 'Activity',
    JobPerks.workingHours => 'Working Hours',
    JobPerks.health => 'Health',
    JobPerks.food => 'Food',
    JobPerks.commute => 'Commute',
    JobPerks.entertainment => 'Entertainment',
  };
}
