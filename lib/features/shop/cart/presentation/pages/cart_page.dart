import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../cart/presentation/providers/cart_provider.dart';


import 'lib/features/shop/explore/presentation/providers/products_providers.dart';
import '../widgets/banner_slider.dart';
import '../widgets/product_card.dart';
import '../widgets/section_header.dart';

class ExplorePage extends ConsumerWidget {

  const ExplorePage({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {

    final products =
        ref.watch(productsProvider);

    final cartItems =
        ref.watch(cartProvider);

    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(

          child: Column(
            children: [

              const SizedBox(height: 20),

              // TOP BAR
              Padding(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 20,
                ),

                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment
                          .spaceBetween,

                  children: [

                    const Icon(
                      Icons.search,
                      size: 30,
                    ),

                    Row(
                      children: [

                        const Icon(
                          Icons.favorite_border,
                          size: 30,
                        ),

                        const SizedBox(
                          width: 18,
                        ),

                        // CART ICON
                        GestureDetector(

                          onTap: () {
                            context.push(
                              '/cart',
                            );
                          },

                          child: Stack(
                            children: [

                              const Padding(
                                padding:
                                    EdgeInsets.all(
                                  2,
                                ),
                                child: Icon(
                                  Icons
                                      .shopping_bag_outlined,
                                  size: 30,
                                ),
                              ),

                              if (cartItems
                                  .isNotEmpty)

                                Positioned(
                                  right: 0,

                                  child: Container(
                                    padding:
                                        const EdgeInsets
                                            .all(4),

                                    decoration:
                                        const BoxDecoration(
                                      color:
                                          Colors.blue,
                                      shape: BoxShape
                                          .circle,
                                    ),

                                    child: Text(
                                      cartItems.length
                                          .toString(),

                                      style:
                                          const TextStyle(
                                        color:
                                            Colors
                                                .white,

                                        fontSize:
                                            10,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // BANNER
              const BannerSlider(),

              const SizedBox(height: 30),

              Padding(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 20,
                ),

                child: Column(
                  children: [

                    const SectionHeader(
                      title: 'Perfect for you',
                    ),

                    const SizedBox(height: 20),

                    // PRODUCTS
                    products.when(

                      data: (items) {

                        return GridView.builder(

                          shrinkWrap: true,

                          physics:
                              const NeverScrollableScrollPhysics(),

                          itemCount: items.length,

                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(

                            crossAxisCount: 2,

                            crossAxisSpacing: 14,

                            mainAxisSpacing: 14,

                            childAspectRatio: 0.58,
                          ),

                          itemBuilder:
                              (context, index) {

                            final product =
                                items[index];

                            return ProductCard(
                              product: product,
                            );
                          },
                        );
                      },

                      loading: () {

                        return const Padding(
                          padding:
                              EdgeInsets.all(30),

                          child:
                              CircularProgressIndicator(),
                        );
                      },

                      error: (error, stack) {

                        return Text(
                          error.toString(),
                        );
                      },
                    ),

                    const SizedBox(height: 30),
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