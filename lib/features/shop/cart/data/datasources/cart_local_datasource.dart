import 'dart:convert';

import '../../../../../core/services/local_storage_service.dart';
import '../models/cart_item_model.dart';

class CartLocalDatasource {

  final LocalStorageService storage;

  CartLocalDatasource(this.storage);

  static const _key = 'cart_items';

  Future<List<CartItemModel>> getCartItems() async {

    final jsonString =
        await storage.getString(_key);

    if (jsonString == null) {
      return [];
    }

    final decoded =
        jsonDecode(jsonString) as List;

    return decoded
        .map(
          (e) => CartItemModel.fromJson(e),
        )
        .toList();
  }

  Future<void> saveCartItems(
    List<CartItemModel> items,
  ) async {

    final jsonString = jsonEncode(
      items.map((e) => e.toJson()).toList(),
    );

    await storage.saveString(
      _key,
      jsonString,
    );
  }
}