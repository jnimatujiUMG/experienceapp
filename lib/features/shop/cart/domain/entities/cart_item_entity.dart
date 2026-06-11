class CartItemEntity {

  final String productId;

  final String title;

  final String? imageUrl;

  final double price;

  final int quantity;

  final String selectedSize;

  final String selectedColor;

  const CartItemEntity({
    required this.productId,
    required this.title,
    this.imageUrl,
    required this.price,
    required this.quantity,
    required this.selectedSize,
    required this.selectedColor,
  });

  double get total =>
      price * quantity;
}