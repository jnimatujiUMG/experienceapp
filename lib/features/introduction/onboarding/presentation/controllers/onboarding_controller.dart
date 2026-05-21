import 'package:flutter/material.dart';
import '../../domain/entities/onboarding_entity.dart';
import '../../../../../core/constants/app_assets.dart';

class OnboardingController {
  final PageController pageController = PageController();

  int currentPage = 0;

  final List<OnboardingEntity> pages = [
    OnboardingEntity(
      image: AppAssets.ob1,
      title: 'Create a prototype in just\na few minutes',
      description:
          'Enjoy these pre-made components and worry only about creating the best product ever.',
      imageWidth: 280,
      imageHeight: 280,
    ),
    OnboardingEntity(
      image: AppAssets.ob2,
      title: 'Design modern mobile\napplications',
      description:
          'Create beautiful interfaces quickly and professionally.',
      imageWidth: 280,
      imageHeight: 280,
    ),
    OnboardingEntity(
      image: AppAssets.ob3,
      title: 'Start your journey\nwith Flutter',
      description:
          'Build fast and scalable apps with clean architecture.',
      imageWidth: 280,
      imageHeight: 280,
    ),
  ];
}