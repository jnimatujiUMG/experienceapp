import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_network_image.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 250,
      child: PageView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {

          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const CustomNetworkImage(),
            ),
          );
        },
      ),
    );
  }
}