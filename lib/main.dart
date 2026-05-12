import 'package:flutter/material.dart';
import 'package:experienceapp/core/theme/app_theme.dart';
import 'package:experienceapp/features/onboarding/presentation/pages/onboaarding_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const OnboardingPage(),
    );
  }
}