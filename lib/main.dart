import 'package:flutter/material.dart';
import 'package:experienceapp/core/theme/app_theme.dart';
import 'package:experienceapp/features/onboarding/presentation/pages/onboaarding_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const OnboardingPage(),
    );
  }
}
