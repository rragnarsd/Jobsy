import 'package:codehatch/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF9F9F9),
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFFF7200)),
      ),
      home: const HomePage(),
    );
  }
}
