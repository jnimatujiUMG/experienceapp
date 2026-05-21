import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_network_image.dart';
import '../../../explore/domain/entities/product_entity.dart';

import '../widgets/add_to_bag_button.dart';
import '../widgets/color_selector.dart';
import '../widgets/size_selector.dart';

class ProductDetailPage extends StatefulWidget {

  final ProductEntity product;

  const ProductDetailPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailPage> createState() =>
      _ProductDetailPageState();
}

class _ProductDetailPageState
    extends State<ProductDetailPage> {

  int selectedSize = 0;

  int selectedColor = 0;

  @override
  Widget build(BuildContext context) {

    final product = widget.product;

    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [

            // IMAGE
            Expanded(
              flex: 5,
              child: Stack(
                children: [

                  Container(
                    color: const Color(0xFFDCE3EE),
                    width: double.infinity,
                    child: CustomNetworkImage(
                      imageUrl: product.imageUrl,
                    ),
                  ),

                  Positioned(
                    top: 20,
                    left: 20,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.close,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // CONTENT
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,
                      children: [

                        Expanded(
                          child: Text(
                            product.title,
                            style: const TextStyle(
                              fontSize: 34,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ),

                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            product.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    Text(
                      '\$ ${product.price}',
                      style: const TextStyle(
                        fontSize: 28,
                      ),
                    ),

                    const SizedBox(height: 24),

                    Text(
                      product.description,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 30),

                    const Text(
                      'Size',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: List.generate(
                        product.sizes.length,
                        (index) {

                          return SizeSelector(
                            size:
                                product.sizes[index],

                            selected:
                                selectedSize == index,

                            onTap: () {
                              setState(() {
                                selectedSize =
                                    index;
                              });
                            },
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 24),

                    const Text(
                      'Color',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: List.generate(
                        product.colors.length,
                        (index) {

                          return ColorSelector(
                            color:
                                product.colors[index],

                            selected:
                                selectedColor ==
                                    index,

                            onTap: () {
                              setState(() {
                                selectedColor =
                                    index;
                              });
                            },
                          );
                        },
                      ), // ← Aquí estaba el error: punto y coma cambiado a coma
                    ), // ← Cierre correcto del Row

                    const Spacer(),

                    const AddToBagButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}