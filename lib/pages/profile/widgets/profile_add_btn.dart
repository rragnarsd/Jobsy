import 'package:codehatch/utils/colors.dart';
import 'package:flutter/material.dart';

class ProfileAddBtn extends StatelessWidget {
  const ProfileAddBtn({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          backgroundColor: JobsyColors.cardColor,
        ),
        child: Row(
          spacing: 8,
          children: [
            const Icon(Icons.add, size: 24, color: JobsyColors.primaryColor),
            Text(
              title,
              style: theme.textTheme.bodyLarge!.copyWith(
                color: JobsyColors.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
