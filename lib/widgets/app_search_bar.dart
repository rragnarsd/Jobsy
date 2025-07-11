import 'package:codehatch/utils/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Container(
        color: JobsyColors.blackColor,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: JobsyColors.scaffoldColor,
                  hintText: 'search'.tr(),
                  hintStyle: TextStyle(
                    color: JobsyColors.greyColor.withValues(alpha: 0.6),
                    fontSize: 16,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: JobsyColors.primaryColor,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(34),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.tune, size: 20),
              label: Text(
                'sort_search'.tr(),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: JobsyColors.greyColor,
                ),
              ),
              style: TextButton.styleFrom(
                foregroundColor: JobsyColors.greyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
