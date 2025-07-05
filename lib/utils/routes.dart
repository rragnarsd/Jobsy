import 'package:codehatch/models/course_model.dart';
import 'package:codehatch/pages/auth/auth_page.dart';
import 'package:codehatch/pages/courses/course_details.dart';
import 'package:codehatch/pages/courses/courses_page.dart';
import 'package:codehatch/pages/home/home_page.dart';
import 'package:codehatch/pages/home/job_description_page.dart';
import 'package:codehatch/pages/home/workplace_page.dart';
import 'package:codehatch/pages/inbox/inbox_page.dart';
import 'package:codehatch/pages/workplaces/workplaces.dart';
import 'package:codehatch/providers/auth_provider.dart';
import 'package:codehatch/root.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
GoRouter createRouter(BuildContext context) {
  final authProvider = Provider.of<AuthUserProvider>(context, listen: false);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/auth',
    refreshListenable: authProvider,
    redirect: (context, state) {
      final isLoggedIn = authProvider.isLoggedIn;
      final isInitialized = authProvider.isInitialized;

      final isOnAuthPage = state.matchedLocation == '/auth';

      if (!isInitialized) return null;

      if (!isLoggedIn && !isOnAuthPage) {
        return '/auth';
      }

      if (isLoggedIn && isOnAuthPage) {
        return '/home';
      }

      return null;
    },

    routes: [
      GoRoute(path: '/auth', builder: (context, state) => const AuthPage()),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => Root(navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/workplaces',
                builder: (context, state) => const Workplaces(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/courses',
                builder: (context, state) => const CoursesPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/inbox',
                builder: (context, state) => const InboxPage(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/job-description/:jobId',
        builder: (context, state) {
          final jobId = state.pathParameters['jobId']!;
          return JobDescriptionPage(jobId: jobId);
        },
      ),
      GoRoute(
        path: '/workplace-details/:workplaceId',
        builder: (context, state) {
          final workplaceId = state.pathParameters['workplaceId']!;
          return WorkplacePage(workplaceId: workplaceId);
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
}
