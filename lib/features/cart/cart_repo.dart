import 'package:e_commerce_app/domain/data/dao/cart_dao.dart';
import 'package:e_commerce_app/domain/database/app_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepository {
  final CartDao dao;

  CartRepository(this.dao);

  Future<List<CartItem>> getItems() => dao.getAll();
  Stream<List<CartItem>> watchItems() => dao.watchAll();

  Future<void> addToCart(
    int productId,
    String title,
    double price,
    String image,
  ) async {
    await dao.add(
      CartItemsCompanion.insert(
        productId: productId,
        title: title,
        price: price,
        image: image,
      ),
    );
    await _updateLastUpdated();
  }

  Future<void> updateQuantity(int id, int qty) async {
    await dao.updateQuantity(id, qty);
    await _updateLastUpdated();
  }

  Future<void> remove(int id) async {
    await dao.remove(id);
    await _updateLastUpdated();
  }

  Future<void> clear() async {
    await dao.clear();
    await _updateLastUpdated();
  }

  // ✅ SharedPreferences metadata
  Future<void> _updateLastUpdated() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      "cart_last_updated",
      DateTime.now().toIso8601String(),
    );
  }

  Future<String?> getLastUpdated() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("cart_last_updated");
  }
}
