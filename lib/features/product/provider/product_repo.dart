import 'package:e_commerce_app/core/models/products.dart';
import 'package:e_commerce_app/core/services/product_service.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
  Future<Product> getProduct(int id);
}

class ProductRepositoryImpl implements ProductRepository {
  final ProductService service;
  ProductRepositoryImpl({required this.service});

  @override
  Future<List<Product>> getProducts() => service.fetchProducts();

  @override
  Future<Product> getProduct(int id) => service.fetchProduct(id);
}
