import 'package:flutter/material.dart';

class CustomNetworkImage
    extends StatelessWidget {

  final String? imageUrl;

  const CustomNetworkImage({
    super.key,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {

    if (imageUrl == null ||
        imageUrl!.isEmpty) {

      return Container(
        color: const Color(0xFFDCE3EE),

        child: const Center(
          child: Icon(
            Icons.image_outlined,
            size: 45,
            color: Colors.blue,
          ),
        ),
      );
    }

    return Image.network(
      imageUrl!,
      fit: BoxFit.cover,

      errorBuilder:
          (context, error, stackTrace) {

        return Container(
          color: const Color(0xFFDCE3EE),

          child: const Center(
            child: Icon(
              Icons.image_outlined,
              size: 45,
              color: Colors.blue,
            ),
          ),
        );
      },
    );
  }
}