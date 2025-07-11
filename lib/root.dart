import 'package:codehatch/utils/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Root extends StatelessWidget {
  const Root(this.navigationShell, {super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        showUnselectedLabels: true,
        selectedItemColor: JobsyColors.primaryColor,
        unselectedItemColor: JobsyColors.greyColor.withValues(alpha: 0.5),
        backgroundColor: JobsyColors.blackColor,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'home'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.business),
            label: 'workplaces'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.school),
            label: 'courses'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.message),
            label: 'inbox'.tr(),
          ),
        ],
        onTap: _onTap,
      ),
    );
  }

  void _onTap(index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
