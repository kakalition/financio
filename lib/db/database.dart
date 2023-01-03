import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:financio/db/budgetplans.dart';
import 'package:financio/db/categories.dart';
import 'package:financio/db/daos/histories_dao.dart';
import 'package:financio/db/daos/wallets_dao.dart';
import 'package:financio/db/histories.dart';
import 'package:financio/db/wallets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part "database.g.dart";

class DatabaseWrapper {
  static Database? _database;

  static Database getInstance() {
    _database ??= Database();

    return _database!;
  }
}

@DriftDatabase(
    tables: [Categories, Wallets, Histories, BudgetPlans], daos: [WalletsDao, HistoriesDao])
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 2;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, "db.sqlite"));

    return NativeDatabase.createInBackground(file);
  });
}
