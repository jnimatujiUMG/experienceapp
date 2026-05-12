import 'package:flutter/material.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingImageSlider extends StatelessWidget {
  final OnboardingController controller;
  final Function(int) onPageChanged;

  const OnboardingImageSlider({
    super.key,
    required this.controller,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: onPageChanged,
      itemCount: controller.pages.length,
      itemBuilder: (context, index) {
      final item = controller.pages[index];

      return Center(
        child: Image.asset(
          item.image,
          width: item.imageWidth,
          height: item.imageHeight,
          fit: BoxFit.contain,
        ),
      );
      },
    );
  }
}