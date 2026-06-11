import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/widgets/custom_network_image.dart';

import '../../domain/entities/cart_item_entity.dart';

import '../providers/cart_provider.dart';
import 'cart_quantity.selector.dart';

class CartItemCard
    extends ConsumerWidget {

  final CartItemEntity item;

  const CartItemCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {

    return Padding(
      padding:
          const EdgeInsets.only(bottom: 24),

      child: Column(
        children: [

          Row(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              Container(
                width: 100,
                height: 100,

                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(
                    20,
                  ),
                ),

                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(
                    20,
                  ),

                  child: CustomNetworkImage(
                    imageUrl:
                        item.imageUrl,
                  ),
                ),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,

                  children: [

                    Text(
                      item.title,

                      style:
                          const TextStyle(
                        fontSize: 22,
                        fontWeight:
                            FontWeight
                                .bold,
                      ),
                    ),

                    const SizedBox(
                      height: 6,
                    ),

                    Text(
                      '${item.selectedColor} / ${item.selectedSize}',

                      style: TextStyle(
                        color:
                            Colors.grey
                                .shade600,
                      ),
                    ),

                    const SizedBox(
                      height: 18,
                    ),

                    CartQuantitySelector(

                      quantity:
                          item.quantity,

                      onDecrease: () {

                        ref
                            .read(
                              cartProvider
                                  .notifier,
                            )
                            .decrease(
                              item,
                            );
                      },

                      onIncrease: () {

                        ref
                            .read(
                              cartProvider
                                  .notifier,
                            )
                            .increase(
                              item,
                            );
                      },
                    ),
                  ],
                ),
              ),

              Text(
                '\$ ${item.total.toStringAsFixed(2)}',

                style: const TextStyle(
                  fontSize: 20,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          Divider(
            color: Colors.grey.shade300,
          ),
        ],
      ),
    );
  }
}