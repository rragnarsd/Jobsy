import 'package:codehatch/utils/colors.dart';
import 'package:flutter/material.dart';

class AppIconElevatedButton extends StatelessWidget {
  const AppIconElevatedButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: JobsyColors.primaryColor,
        padding: const EdgeInsets.all(16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
      ),
      label: Text(text, style: theme.textTheme.titleLarge),
      icon: Icon(icon, size: 24, color: JobsyColors.whiteColor),
    );
  }
}

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    required this.child,
    required this.onPressed,
  });

  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: JobsyColors.primaryColor,
        padding: const EdgeInsets.all(16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
      ),
      child: child,
    );
  }
}
