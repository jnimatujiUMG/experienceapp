import '../../domain/entities/cart_item_entity.dart';
import '../../domain/repositories/cart_repository.dart';

import '../datasources/cart_local_datasource.dart';
import '../models/cart_item_model.dart';

class CartRepositoryImpl
    implements CartRepository {

  final CartLocalDatasource datasource;

  CartRepositoryImpl(this.datasource);

  @override
  Future<List<CartItemEntity>>
      getCartItems() {

    return datasource.getCartItems();
  }

  @override
  Future<void> addToCart(
    CartItemEntity item,
  ) async {

    final items =
        await datasource.getCartItems();

    final index = items.indexWhere(
      (e) =>
          e.productId == item.productId &&
          e.selectedSize ==
              item.selectedSize,
    );

    if (index >= 0) {

      final existing = items[index];

      items[index] = CartItemModel(
        productId: existing.productId,
        title: existing.title,
        imageUrl: existing.imageUrl,
        price: existing.price,
        quantity:
            existing.quantity + 1,
        selectedSize:
            existing.selectedSize,
        selectedColor:
            existing.selectedColor,
      );

    } else {

      items.add(
        CartItemModel(
          productId: item.productId,
          title: item.title,
          imageUrl: item.imageUrl,
          price: item.price,
          quantity: item.quantity,
          selectedSize:
              item.selectedSize,
          selectedColor:
              item.selectedColor,
        ),
      );
    }

    await datasource.saveCartItems(items);
  }

  @override
  Future<void> updateQuantity(
    String productId,
    int quantity,
  ) async {

    final items =
        await datasource.getCartItems();

    final index = items.indexWhere(
      (e) => e.productId == productId,
    );

    if (index >= 0) {

      final item = items[index];

      items[index] = CartItemModel(
        productId: item.productId,
        title: item.title,
        imageUrl: item.imageUrl,
        price: item.price,
        quantity: quantity,
        selectedSize:
            item.selectedSize,
        selectedColor:
            item.selectedColor,
      );
    }

    await datasource.saveCartItems(items);
  }

  @override
  Future<void> removeItem(
    String productId,
  ) async {

    final items =
        await datasource.getCartItems();

    items.removeWhere(
      (e) => e.productId == productId,
    );

    await datasource.saveCartItems(items);
  }
}