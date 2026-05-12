import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../controllers/onboarding_controller.dart';
import '../widgets/onboarding_content.dart';
import '../widgets/onboarding_image_slider.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() =>
      _OnboardingPageState();
}

class _OnboardingPageState
    extends State<OnboardingPage> {

  final OnboardingController controller =
      OnboardingController();

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {

    final item = controller.pages[currentPage];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            Expanded(
              flex: 6,
              child: Container(
                color: AppColors.backgroundTop,
                child: OnboardingImageSlider(
                  controller: controller,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                ),
              ),
            ),

            Expanded(
              flex: 4,
              child: OnboardingContent(
                item: item,
                currentIndex: currentPage,
                total: controller.pages.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}