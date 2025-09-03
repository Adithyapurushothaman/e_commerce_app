import 'package:dio/dio.dart';
import 'package:e_commerce_app/domain/data/models/products.dart';

class ProductService {
  final Dio _dio = Dio(BaseOptions(baseUrl: "https://fakestoreapi.com"));

  Future<List<Product>> fetchProducts() async {
    final res = await _dio.get("/products");
    final list = (res.data as List).cast<Map<String, dynamic>>();
    return list.map(Product.fromJson).toList();
  }

  Future<Product> fetchProduct(int id) async {
    final res = await _dio.get("/products/$id");
    return Product.fromJson(res.data as Map<String, dynamic>);
  }
}
