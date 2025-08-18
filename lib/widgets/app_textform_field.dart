import 'package:codehatch/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    this.controller,
    this.labelText,
    this.hintText,
    this.inputFormatter,
    this.keyboardType,
    this.validator,
    this.textInputAction,
    this.prefixIcon,
    this.suffix,
    this.obscureText = false,
    this.isMultiline = false,
    this.maxLines,
    this.readOnly,
    this.onSaved,
    this.autovalidateMode,
    super.key,
  });

  final String? labelText;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatter;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final Widget? suffix;
  final bool obscureText;
  final bool isMultiline;
  final int? maxLines;
  final bool? readOnly;
  final Function(String?)? onSaved;
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatter,
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      textInputAction: textInputAction,
      obscureText: obscureText,
      maxLines: isMultiline ? maxLines : 1,
      readOnly: readOnly ?? false,
      onSaved: onSaved,
      autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: JobsyColors.whiteColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: JobsyColors.greyColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: JobsyColors.primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: JobsyColors.errorColor),
        ),
        hintText: hintText,
        labelText: labelText,
        labelStyle: const TextStyle(color: JobsyColors.whiteColor),
        hintStyle: const TextStyle(color: JobsyColors.whiteColor),
        errorStyle: const TextStyle(color: JobsyColors.whiteColor),
      ),
    );
  }
}
