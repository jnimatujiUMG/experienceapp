import '../../domain/entities/product_entity.dart';
import '../models/product_model.dart';

class ProductMapper {
  static ProductEntity toEntity(ProductModel model) {
    return ProductEntity(
      id: model.id,
      title: model.title,
      description: model.description,
      price: model.price,
      imageUrl: model.imageUrl,
      sizes: model.sizes,
      colors: model.colors,
      isFavorite: model.isFavorite,
    );
  }

  static List<ProductEntity> toEntityList(List<ProductModel> models) {
    return models.map((model) => toEntity(model)).toList();
  }
}
