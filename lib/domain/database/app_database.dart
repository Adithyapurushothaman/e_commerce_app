import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:e_commerce_app/domain/data/dao/cart_dao.dart';
import 'package:e_commerce_app/domain/data/models/cart_items.dart';
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [CartItems], daos: [CartDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File('${dbFolder.path}/app.sqlite');

    return NativeDatabase.createInBackground(file);
  });
}
