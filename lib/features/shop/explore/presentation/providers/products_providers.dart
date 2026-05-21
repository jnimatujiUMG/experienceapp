import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasources/product_local_datasource.dart';
//import '../../data/repositories/product_repository_impl.dart';
import '../../data/repositories/product_repository_impl.dart';

import '../../domain/entities/product_entity.dart';
import '../../domain/usecases/get_products_usecase.dart';

final productsProvider =
    FutureProvider<List<ProductEntity>>((ref) async {

  final datasource =
      ProductLocalDatasource();

  final repository =
      ProductRepositoryImpl(datasource);

  final usecase =
      GetProductsUseCase(repository);

  return usecase();
});