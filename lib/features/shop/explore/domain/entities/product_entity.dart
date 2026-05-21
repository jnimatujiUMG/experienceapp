import 'package:flutter/material.dart';

class ProductEntity {

  final String id;

  final String title;

  final String description;

  final double price;

  final String? imageUrl;

  final List<String> sizes;

  final List<Color> colors;

  final bool isFavorite;

  const ProductEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    this.imageUrl,
    required this.sizes,
    required this.colors,
    this.isFavorite = false,
  });
}