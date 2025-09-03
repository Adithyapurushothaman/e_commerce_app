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

  Future<int> remove(int id) =>
      (delete(cartItems)..where((t) => t.id.equals(id))).go();

  Future<void> clear() => delete(cartItems).go();
}
