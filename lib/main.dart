import 'package:codehatch/firebase_options.dart';
import 'package:codehatch/l10n/app_localizations.dart';
import 'package:codehatch/providers/workplace_provider.dart';
import 'package:codehatch/utils/routes.dart';
import 'package:codehatch/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => WorkplaceProvider())],
      child: MaterialApp.router(
        title: 'Jobsy',
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: darkTheme,
      ),
    );
  }
}
