import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/product_repository.dart';

import '../datasources/product_local_datasource.dart';
import '../mappers/product_mapper.dart';

class ProductRepositoryImpl
    implements ProductRepository {

  final ProductLocalDatasource datasource;

  ProductRepositoryImpl(this.datasource);

  @override
  Future<List<ProductEntity>> getProducts() async {
    final models = await datasource.getProducts();
    return ProductMapper.toEntityList(models);
  }
}