import '../entities/cart_item_entity.dart';

abstract class CartRepository {

  Future<List<CartItemEntity>> getCartItems();

  Future<void> addToCart(
    CartItemEntity item,
  );

  Future<void> updateQuantity(
    String productId,
    int quantity,
  );

  Future<void> removeItem(
    String productId,
  );
}