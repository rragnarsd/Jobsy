import 'package:codehatch/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toastification/toastification.dart';

extension DateFormatting on DateTime {
  String toShortFormattedDate() {
    final formatter = DateFormat('d. MMM yyyy');
    return formatter.format(this);
  }
}

extension StringValidators on String {
  bool get isValidEmail {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$');
    return emailRegex.hasMatch(trim());
  }

  bool get isValidPassword => trim().length >= 6;

  String? get emailError =>
      isEmpty ? 'Email is required' : (!isValidEmail ? 'Invalid email' : null);

  String? get passwordError => isEmpty
      ? 'Password is required'
      : (!isValidPassword ? 'Password must be at least 6 characters' : null);
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

enum ToastType { success, error, info, warning }

extension ToastTypeProperties on ToastType {
  Color get primaryColor {
    switch (this) {
      case ToastType.success:
        return JobsyColors.primaryColor;
      case ToastType.error:
        return JobsyColors.errorColor;
      case ToastType.info:
        return Colors.blue;
      case ToastType.warning:
        return Colors.orange;
    }
  }

  IconData get icon {
    switch (this) {
      case ToastType.success:
        return Icons.check_circle;
      case ToastType.error:
        return Icons.error;
      case ToastType.info:
        return Icons.info;
      case ToastType.warning:
        return Icons.warning;
    }
  }

  ToastificationType get toastificationType {
    switch (this) {
      case ToastType.success:
        return ToastificationType.success;
      case ToastType.error:
        return ToastificationType.error;
      case ToastType.info:
        return ToastificationType.info;
      case ToastType.warning:
        return ToastificationType.warning;
    }
  }

  Duration get defaultDuration {
    switch (this) {
      case ToastType.success:
        return const Duration(seconds: 3);
      case ToastType.error:
        return const Duration(seconds: 5);
      case ToastType.info:
      case ToastType.warning:
        return const Duration(seconds: 4);
    }
  }
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
