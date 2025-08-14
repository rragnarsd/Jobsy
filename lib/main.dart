import 'package:codehatch/firebase_options.dart';
import 'package:codehatch/providers/application_provider.dart';
import 'package:codehatch/providers/auth_provider.dart';
import 'package:codehatch/providers/course_provider.dart';
import 'package:codehatch/providers/education_provider.dart';
import 'package:codehatch/providers/favorites_provider.dart';
import 'package:codehatch/providers/job_provider.dart';
import 'package:codehatch/providers/language_provider.dart';
import 'package:codehatch/providers/link_provider.dart';
import 'package:codehatch/providers/reference_provider.dart';
import 'package:codehatch/providers/skills_provider.dart';
import 'package:codehatch/providers/workplace_provider.dart';
import 'package:codehatch/utils/routes.dart';
import 'package:codehatch/utils/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final authProvider = AuthUserProvider();
  await authProvider.initAuth();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('is')],
      path: 'assets/translations',
      startLocale: const Locale('is'),
      fallbackLocale: const Locale('en'),
      useOnlyLangCode: true,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: authProvider),
          ChangeNotifierProvider(create: (_) => LanguageProvider()),
          ChangeNotifierProvider(create: (_) => WorkplaceProvider()),
          ChangeNotifierProvider(create: (_) => CourseProvider()),
          ChangeNotifierProvider(create: (_) => JobProvider()),
          ChangeNotifierProvider(create: (_) => EducationProvider()),
          ChangeNotifierProvider(create: (_) => ReferenceProvider()),
          ChangeNotifierProvider(create: (_) => LinkProvider()),
          ChangeNotifierProvider(create: (_) => SkillsProvider()),
          ChangeNotifierProvider(create: (_) => FavoritesProvider()),
          ChangeNotifierProvider(create: (_) => ApplicationProvider()),
        ],
        child: const JobsyWrapper(),
      ),
    ),
  );
}

class JobsyWrapper extends StatefulWidget {
  const JobsyWrapper({super.key});

  @override
  State<JobsyWrapper> createState() => _JobsyWrapperState();
}

class _JobsyWrapperState extends State<JobsyWrapper> {
  GoRouter? _router;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _router ??= createRouter(context);
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthUserProvider>(context);

    if (!authProvider.isInitialized) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (!context.localizationDelegates.isNotEmpty) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return MaterialApp.router(
      title: 'Jobsy',
      debugShowCheckedModeBanner: false,
      routerConfig: _router!,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: darkTheme,
    );
  }
}
