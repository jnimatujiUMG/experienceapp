import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/services/local_storage_service.dart';

import '../../data/datasources/cart_local_datasource.dart';
import '../../data/repositories/cart_repository_impl.dart';

import '../../domain/entities/cart_item_entity.dart';

final cartProvider =
    StateNotifierProvider<
        CartNotifier,
        List<CartItemEntity>>((ref) {

  final storage =
      LocalStorageService();

  final datasource =
      CartLocalDatasource(storage);

  final repository =
      CartRepositoryImpl(datasource);

  return CartNotifier(repository);
});

class CartNotifier
    extends StateNotifier<List<CartItemEntity>> {

  final CartRepositoryImpl repository;

  CartNotifier(this.repository)
      : super([]) {

    loadCart();
  }

  Future<void> loadCart() async {

    state =
        await repository.getCartItems();
  }

  Future<void> addToCart(
    CartItemEntity item,
  ) async {

    await repository.addToCart(item);

    await loadCart();
  }

  Future<void> increase(
    CartItemEntity item,
  ) async {

    await repository.updateQuantity(
      item.productId,
      item.quantity + 1,
    );

    await loadCart();
  }

  Future<void> decrease(
    CartItemEntity item,
  ) async {

    if (item.quantity <= 1) {

      await repository.removeItem(
        item.productId,
      );

    } else {

      await repository.updateQuantity(
        item.productId,
        item.quantity - 1,
      );
    }

    await loadCart();
  }

  double get total {

    return state.fold(
      0,
      (sum, item) =>
          sum + item.total,
    );
  }
}