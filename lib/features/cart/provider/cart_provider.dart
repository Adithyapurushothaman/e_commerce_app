import 'package:e_commerce_app/domain/database/app_database.dart';
import 'package:e_commerce_app/features/cart/cart_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_provider.g.dart';

@riverpod
AppDatabase appDatabase(Ref ref) => AppDatabase();

@riverpod
CartRepository cartRepository(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return CartRepository(db.cartDao);
}

final selectedCartItemsProvider = StateProvider<Set<int>>((ref) => {});

@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  Stream<List<CartItem>> build() {
    return ref.watch(cartRepositoryProvider).watchItems();
  }

  Future<void> addToCart(
    int productId,
    String title,
    double price,
    String image,
  ) async {
    await ref
        .read(cartRepositoryProvider)
        .addToCart(productId, title, price, image);
  }

  Future<void> updateQuantity(int id, int qty) async {
    await ref.read(cartRepositoryProvider).updateQuantity(id, qty);
  }

  Future<void> remove(int id) async {
    await ref.read(cartRepositoryProvider).remove(id);
  }

  Future<void> clear() async {
    await ref.read(cartRepositoryProvider).clear();
  }
}
