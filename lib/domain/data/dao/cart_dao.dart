import 'package:drift/drift.dart';
import 'package:e_commerce_app/domain/data/models/cart_items.dart';
import 'package:e_commerce_app/domain/database/app_database.dart';

part 'cart_dao.g.dart';

@DriftAccessor(tables: [CartItems])
class CartDao extends DatabaseAccessor<AppDatabase> with _$CartDaoMixin {
  final AppDatabase db;
  CartDao(this.db) : super(db);

  Future<List<CartItem>> getAll() => select(cartItems).get();
  Stream<List<CartItem>> watchAll() => select(cartItems).watch();

  Future<int> add(CartItemsCompanion entry) =>
      into(cartItems).insertOnConflictUpdate(entry);

  Future<void> updateQuantity(int id, int qty) {
    return (update(cartItems)..where((t) => t.id.equals(id))).write(
      CartItemsCompanion(quantity: Value(qty)),
    );
  }

  Future<void> addOrIncrement(
    int productId,
    String title,
    double price,
    String image,
  ) async {
    try {
      // Try to find the existing cart row for this product
      final existing = await (select(
        cartItems,
      )..where((tbl) => tbl.productId.equals(productId))).getSingleOrNull();

      if (existing != null) {
        // ✅ If product exists → increment quantity
        await (update(cartItems)..where((t) => t.id.equals(existing.id))).write(
          CartItemsCompanion(quantity: Value(existing.quantity + 1)),
        );
      } else {
        // ✅ If product doesn’t exist → insert new row
        await into(cartItems).insert(
          CartItemsCompanion.insert(
            productId: productId,
            title: title,
            price: price,
            image: image,
          ),
        );
      }
    } on Exception {
      // ✅ In case of a unique constraint violation (e.g., race condition)
      // fallback: just increment the first match
      final existingList = await (select(
        cartItems,
      )..where((tbl) => tbl.productId.equals(productId))).get();
      if (existingList.isNotEmpty) {
        final existing = existingList.first;
        await (update(cartItems)..where((t) => t.id.equals(existing.id))).write(
          CartItemsCompanion(quantity: Value(existing.quantity + 1)),
        );
      } else {
        rethrow; // let it bubble up if truly unexpected
      }
    }
  }

  Future<int> remove(int id) =>
      (delete(cartItems)..where((t) => t.id.equals(id))).go();

  Future<void> clear() => delete(cartItems).go();
}
