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
        selectedItemColor: const Color(0xffFF6D00),
        unselectedItemColor: Colors.grey.shade300,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Heim'),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Vinnustaðir',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Námskeið'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Innhólf'),
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
