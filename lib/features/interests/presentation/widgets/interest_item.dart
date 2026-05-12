import 'package:flutter/material.dart';
import '../../domain/entities/interest_entity.dart';
import '../../../../../core/constants/app_colors.dart';

class InterestItem extends StatelessWidget {
  final InterestEntity item;
  final VoidCallback onTap;

  const InterestItem({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    final selected = item.selected;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 22,
        ),
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFFE8EEF9)
              : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.grey.shade300,
          ),
        ),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
          children: [

            Text(
              item.title,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),

            if (selected)
              const Icon(
                Icons.check,
                color: AppColors.primary,
              ),
          ],
        ),
      ),
    );
  }
}