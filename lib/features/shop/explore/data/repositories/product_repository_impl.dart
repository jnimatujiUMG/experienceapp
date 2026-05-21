import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/product_repository.dart';

import '../datasources/product_local_datasource.dart';

class ProductRepositoryImpl
    implements ProductRepository {

  final ProductLocalDatasource datasource;

  ProductRepositoryImpl(this.datasource);

  @override
  Future<List<ProductEntity>> getProducts() {

    return datasource.getProducts();
  }
}