import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';

class DotsIndicator extends StatelessWidget {
  final bool isActive;

  const DotsIndicator({
    super.key,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isActive ? 22 : 10,
      height: 10,
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.primary
            : AppColors.dotInactive,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}