import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:financio/db/budgetplans.dart';
import 'package:financio/db/categories.dart';
import 'package:financio/db/daos/wallets_dao.dart';
import 'package:financio/db/histories.dart';
import 'package:financio/db/wallets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part "database.g.dart";

@DriftDatabase(
    tables: [Categories, Wallets, Histories, BudgetPlans], daos: [WalletsDao])
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
