import 'package:e_commerce_app/core/models/products.dart';
import 'package:e_commerce_app/core/services/product_service.dart';
import 'package:e_commerce_app/features/product/provider/product_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_provider.g.dart';

/// Provide ProductService
@riverpod
ProductService productService(Ref ref) {
  return ProductService();
}

/// Provide ProductRepository
@riverpod
ProductRepository productRepository(Ref ref) {
  return ProductRepositoryImpl(service: ref.watch(productServiceProvider));
}

/// Product list notifier
@riverpod
class ProductListNotifier extends _$ProductListNotifier {
  @override
  Future<List<Product>> build() async {
    final repo = ref.watch(productRepositoryProvider);
    return repo.getProducts();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(productRepositoryProvider);
      return repo.getProducts();
    });
  }
}

@riverpod
Future<Product> productById(Ref ref, int id) async {
  final repo = ref.watch(productRepositoryProvider);
  return repo.getProduct(id);
}
