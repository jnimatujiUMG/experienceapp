import 'package:flutter/material.dart';

import '../../domain/entities/product_entity.dart';
import '../widgets/banner_slider.dart';
import '../widgets/product_card.dart';
import '../widgets/section_header.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Productos completos con toda la información
    final products = [
      ProductEntity(
        id: '1',
        title: 'Amazing T-Shirt',
        description:
            'The perfect T-shirt for when you want to feel comfortable but still stylish.',
        price: 12,
        imageUrl: null,
        sizes: ['XS', 'S', 'M', 'L', 'XL'],
        colors: [
          Colors.black,
          Colors.grey,
          Colors.blue,
          Colors.white,
        ],
      ),
      ProductEntity(
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
          Colors.blueGrey,
        ],
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),

              // TOP BAR
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.search, size: 30),
                    Row(
                      children: [
                        const Icon(
                          Icons.favorite_border,
                          size: 30,
                        ),
                        const SizedBox(width: 18),
                        Stack(
                          children: [
                            const Icon(
                              Icons.shopping_bag_outlined,
                              size: 30,
                            ),
                            Positioned(
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                ),
                                child: const Text(
                                  '9',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // SLIDER
              const BannerSlider(),

              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    const SectionHeader(
                      title: 'Perfect for you',
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: products.map((product) {
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 12,
                            ),
                            child: SizedBox(
                              height: 250,
                              child: ProductCard(
                                product: product,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 40),
                    const SectionHeader(
                      title: 'For this summer',
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: products.map((product) {
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 12,
                            ),
                            child: SizedBox(
                              height: 250,
                              child: ProductCard(
                                product: product,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}