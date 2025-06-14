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
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          backgroundColor: const Color(0xFF141414),
        ),
        child: Row(
          spacing: 8,
          children: [
            const Icon(Icons.add, size: 24, color: Color(0xFFFF7200)),
            Text(
              title,
              style: theme.textTheme.bodyLarge!.copyWith(
                color: const Color(0xFFFF7200),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
