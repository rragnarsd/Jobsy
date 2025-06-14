import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.text,
    this.onEditTap,
    this.trailingText,
  });

  final String text;
  final VoidCallback? onEditTap;
  final String? trailingText;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: theme.textTheme.titleLarge!.copyWith(fontSize: 18),
              ),
              if (onEditTap != null)
                GestureDetector(
                  onTap: onEditTap,
                  child: Row(
                    children: [
                      Text(
                        trailingText ?? 'Edit',
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: const Color(0xFFFF7200),
                        ),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_right,
                        color: Color(0xFFFF7200),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
