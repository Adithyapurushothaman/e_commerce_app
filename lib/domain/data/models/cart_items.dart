import 'package:drift/drift.dart';

class CartItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get productId => integer()();
  TextColumn get title => text()();
  RealColumn get price => real()();
  IntColumn get quantity => integer().withDefault(const Constant(1))();
  TextColumn get image => text()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {productId},
  ];
}
