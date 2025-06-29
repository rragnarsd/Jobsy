import 'package:codehatch/utils/colors.dart';
import 'package:flutter/material.dart';

ThemeData get darkTheme {
  return ThemeData(
    scaffoldBackgroundColor: JobsyColors.scaffoldColor,
    colorScheme: ColorScheme.fromSeed(seedColor: JobsyColors.primaryColor),
    datePickerTheme: DatePickerThemeData(
      yearStyle: const TextStyle(color: JobsyColors.whiteColor),
      backgroundColor: JobsyColors.cardColor,
      headerBackgroundColor: JobsyColors.cardColor,
      dayStyle: const TextStyle(color: JobsyColors.whiteColor, fontSize: 16),
      headerForegroundColor: JobsyColors.whiteColor,
      rangePickerHeaderBackgroundColor: JobsyColors.whiteColor,
      surfaceTintColor: JobsyColors.greyColor.withValues(alpha: 0.3),
      cancelButtonStyle: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(JobsyColors.whiteColor),
      ),
      confirmButtonStyle: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(JobsyColors.primaryColor),
      ),
    ),
    cardTheme: const CardThemeData(
      color: JobsyColors.cardColor,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w400,
        color: JobsyColors.whiteColor,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: JobsyColors.whiteColor,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: JobsyColors.whiteColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: JobsyColors.whiteColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: JobsyColors.whiteColor,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.black54,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: JobsyColors.whiteColor,
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: JobsyColors.whiteColor,
        fontSize: 16,
      ),
    ),
  );
}
