import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductLocalDatasource {

  Future<List<ProductModel>> getProducts() async {

    await Future.delayed(
      const Duration(seconds: 1),
    );

    return [

      ProductModel(
        id: '1',

        title: 'Amazing T-Shirtjhjkhgf',

        description:
            'The perfect T-shirt for casual outfits.',

        price: 12,

        imageUrl: null,

        sizes: ['XS', 'S', 'M', 'L', 'XL'],

        colors: [
          Colors.black,
          Colors.grey,
          Colors.blue,
        ],

        isFavorite: true,
      ),

      ProductModel(
        id: '2',

        title: 'Fabolous Pants',

        description:
            'Modern pants for casual and elegant outfits.',

        price: 15,

        imageUrl: null,

        sizes: ['S', 'M', 'L'],

        colors: [
          Colors.black,
          Colors.brown,
        ],

        isFavorite: false,
      ),
    ];
  }
}