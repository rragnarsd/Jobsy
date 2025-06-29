import 'package:codehatch/firebase_options.dart';
import 'package:codehatch/l10n/app_localizations.dart';
import 'package:codehatch/providers/auth_provider.dart';
import 'package:codehatch/providers/course_provider.dart';
import 'package:codehatch/providers/job_provider.dart';
import 'package:codehatch/providers/workplace_provider.dart';
import 'package:codehatch/utils/routes.dart';
import 'package:codehatch/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final authProvider = AuthUserProvider();
  await authProvider.initAuth();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: authProvider),
        ChangeNotifierProvider(create: (_) => WorkplaceProvider()),
        ChangeNotifierProvider(create: (_) => CourseProvider()),
        ChangeNotifierProvider(create: (_) => JobProvider()),
      ],
      child: const JobsyWrapper(),
    ),
  );
}

class JobsyWrapper extends StatelessWidget {
  const JobsyWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final router = createRouter(context);

    return MaterialApp.router(
      title: 'Jobsy',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: darkTheme,
    );
  }
}
