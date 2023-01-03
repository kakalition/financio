import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:financio/core/db/daos/histories_dao.dart';
import 'package:financio/core/db/daos/wallets_dao.dart';
import 'package:financio/core/db/tables/allocations.dart';
import 'package:financio/core/db/tables/histories.dart';
import 'package:financio/core/db/tables/wallets.dart';
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
    tables: [Wallets, Allocations, Histories], daos: [WalletsDao, HistoriesDao])
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, "db.sqlite"));

    return NativeDatabase.createInBackground(file);
  });
}
