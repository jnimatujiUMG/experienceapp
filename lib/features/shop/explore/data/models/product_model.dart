import 'package:flutter/material.dart';

//dejarlo todo como modelo
//sin extend a entidad
//conversion desde entidad crear un from model para mapeo de datos
class ProductModel {

  final String id;

  final String title;

  final String description;

  final double price;

  final String? imageUrl;

  final List<String> sizes;

  final List<Color> colors;

  final bool isFavorite;

  const ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    this.imageUrl,
    required this.sizes,
    required this.colors,
    this.isFavorite = false,
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