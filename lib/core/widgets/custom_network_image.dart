import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final String? imageUrl;

  const CustomNetworkImage({
    super.key,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {

    if (imageUrl == null) {
      return _placeholder();
    }

    return CachedNetworkImage(
      imageUrl: imageUrl!,
      fit: BoxFit.cover,

      placeholder: (context, url) {
        return _placeholder();
      },

      errorWidget: (context, url, error) {
        return _placeholder();
      },
    );
  }

  Widget _placeholder() {
    return Container(
      color: const Color(0xFFDCE3EE),
      child: Center(
        child: Icon(
          Icons.image_outlined,
          color: Colors.blue.shade200,
          size: 40,
        ),
      ),
    );
  }
}