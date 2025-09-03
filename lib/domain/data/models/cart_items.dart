import 'package:drift/drift.dart';

class CartItems extends Table {
  IntColumn get id => integer().autoIncrement()(); // Primary key
  IntColumn get productId => integer()(); // Product ID from API
  TextColumn get title => text()(); // Product title
  RealColumn get price => real()(); // Product price
  IntColumn get quantity => integer().withDefault(const Constant(1))();
  TextColumn get image => text()(); // Product image
}
