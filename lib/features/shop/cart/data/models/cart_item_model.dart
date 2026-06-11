import '../../domain/entities/cart_item_entity.dart';

class CartItemModel extends CartItemEntity {

  const CartItemModel({
    required super.productId,
    required super.title,
    super.imageUrl,
    required super.price,
    required super.quantity,
    required super.selectedSize,
    required super.selectedColor,
  });

  factory CartItemModel.fromJson(
    Map<String, dynamic> json,
  ) {

    return CartItemModel(
      productId: json['productId'],

      title: json['title'],

      imageUrl: json['imageUrl'],

      price: json['price'],

      quantity: json['quantity'],

      selectedSize: json['selectedSize'],

      selectedColor: json['selectedColor'],
    );
  }

  Map<String, dynamic> toJson() {

    return {
      'productId': productId,
      'title': title,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
      'selectedSize': selectedSize,
      'selectedColor': selectedColor,
    };
  }
}