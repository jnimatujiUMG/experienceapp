import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../domain/entities/onboarding_entity.dart';
import 'dots_indicator.dart';
import 'onboarding_button.dart';

class OnboardingContent extends StatelessWidget {
  final OnboardingEntity item;
  final int currentIndex;
  final int total;

  const OnboardingContent({
    super.key,
    required this.item,
    required this.currentIndex,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 25,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: List.generate(
              total,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: DotsIndicator(
                  isActive: index == currentIndex,
                ),
              ),
            ),
          ),

          const SizedBox(height: 28),

          Text(
            item.title,
            style: const TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),

          const SizedBox(height: 18),

          Text(
            item.description,
            style: const TextStyle(
              fontSize: 15,
              color: AppColors.textGrey,
              height: 1.5,
            ),
          ),

          const Spacer(),

          OnboardingButton(
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}