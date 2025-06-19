import 'package:codehatch/models/course_model.dart';
import 'package:codehatch/models/job_model.dart';
import 'package:codehatch/models/workplace_model.dart';
import 'package:codehatch/pages/courses/course_details.dart';
import 'package:codehatch/pages/courses/courses_page.dart';
import 'package:codehatch/pages/home/home_page.dart';
import 'package:codehatch/pages/home/job_description_page.dart';
import 'package:codehatch/pages/home/workplace_page.dart';
import 'package:codehatch/pages/inbox/inbox_page.dart';
import 'package:codehatch/pages/profile/profile_page.dart';
import 'package:codehatch/pages/workplaces/workplaces.dart';
import 'package:codehatch/root.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
//TODO - Add animations

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home',
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return Root(navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/workplaces',
              builder: (context, state) => const Workplaces(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/courses',
              builder: (context, state) => const CoursesPage(),
            ),
          ],
        ),
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
    GoRoute(path: '/profile', builder: (context, state) => const ProfilePage()),
    GoRoute(
      path: '/job-description',
      builder: (context, state) {
        final job = state.extra as JobModel;
        return JobDescriptionPage(job: job);
      },
    ),
    GoRoute(
      path: '/workplace-details',
      builder: (context, state) {
        final workplace = state.extra as WorkplaceModel;
        return WorkplacePage(workplace: workplace);
      },
    ),
    GoRoute(
      path: '/courses-details',
      builder: (context, state) {
        final course = state.extra as CourseModel;
        return CourseDetailsPage(course: course);
      },
    ),
  ],
);
