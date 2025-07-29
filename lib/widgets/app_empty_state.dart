import 'package:codehatch/utils/colors.dart';
import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
  });

  final IconData icon;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 64, color: JobsyColors.greyColor),
          const SizedBox(height: 16),
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: JobsyColors.greyColor),
          ),
          const SizedBox(height: 8),
          Text(
            subTitle,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: JobsyColors.greyColor),
          ),
        ],
      ),
    );
  }
}
