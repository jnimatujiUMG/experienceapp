import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/custom_network_image.dart';

import '../../domain/entities/product_entity.dart';

class ProductCard
    extends StatelessWidget {

  final ProductEntity product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap: () {

        context.push(
          '/product-detail',
          extra: product,
        );
      },

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color:
                    const Color(0xFFDCE3EE),

                borderRadius:
                    BorderRadius.circular(
                  22,
                ),
              ),

              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(
                  22,
                ),

                child: CustomNetworkImage(
                  imageUrl:
                      product.imageUrl,
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          Text(
            product.title,

            maxLines: 1,

            overflow:
                TextOverflow.ellipsis,

            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            '\$ ${product.price}',

            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}