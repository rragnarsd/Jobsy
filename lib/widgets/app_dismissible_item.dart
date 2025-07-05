import 'package:codehatch/utils/colors.dart';
import 'package:flutter/material.dart';

class AppDismissibleItem extends StatelessWidget {
  const AppDismissibleItem({
    super.key,
    required this.itemKey,
    required this.child,
    required this.onDismissed,
  });

  final Key itemKey;
  final Widget child;
  final Function(DismissDirection)? onDismissed;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: itemKey,
      direction: DismissDirection.endToStart,
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: JobsyColors.errorColor,
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16.0),
        child: const Icon(Icons.delete, color: JobsyColors.whiteColor),
      ),
      onDismissed: onDismissed,
      child: child,
    );
  }
}
