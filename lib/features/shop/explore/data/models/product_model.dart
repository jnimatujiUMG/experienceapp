import 'package:flutter/material.dart';

import '../../domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {

  const ProductModel({
    required super.id,
    required super.title,
    required super.description,
    required super.price,
    super.imageUrl,
    required super.sizes,
    required super.colors,
    super.isFavorite,
  });

  factory ProductModel.fromJson(
    Map<String, dynamic> json,
  ) {

    return ProductModel(
      id: json['id'],

      title: json['title'],

      description: json['description'],

      price: json['price'].toDouble(),

      imageUrl: json['imageUrl'],

      sizes: List<String>.from(
        json['sizes'],
      ),

      colors: [
        Colors.black,
        Colors.blue,
      ],

      isFavorite:
          json['isFavorite'] ?? false,
    );
  }
}