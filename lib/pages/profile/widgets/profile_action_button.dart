import 'package:codehatch/utils/colors.dart';
import 'package:flutter/material.dart';

class ProfileActionButton extends StatelessWidget {
  const ProfileActionButton({
    super.key,
    this.onPressed,
    required this.text,
    required this.color,
  });

  final VoidCallback? onPressed;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.all(16),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
        ),
        child: Center(child: Text(text, style: theme.textTheme.bodyLarge)),
      ),
    );
  }
}

class ProfileIconActionButton extends StatelessWidget {
  const ProfileIconActionButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.download, color: JobsyColors.primaryColor),
        label: Text(text, style: theme.textTheme.bodyMedium),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          backgroundColor: JobsyColors.cardColor,
        ),
      ),
    );
  }
}
