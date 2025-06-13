import 'package:codehatch/pages/courses_page.dart';
import 'package:codehatch/pages/home_page.dart';
import 'package:codehatch/pages/inbox_page.dart';
import 'package:codehatch/pages/workplaces.dart';
import 'package:codehatch/root.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home',
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return Root(navigationShell);
      },
      branches: [
        // Branch 0: Vaktin
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),
        // Branch 2: Vinnustaðir
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/workplaces',
              builder: (context, state) => const Workplaces(),
            ),
          ],
        ),
        // Branch 3: Námskeið
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/courses',
              builder: (context, state) => const CoursesPage(),
            ),
          ],
        ),
        // Branch 4: Innhólf
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/inbox',
              builder: (context, state) => const InboxPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
