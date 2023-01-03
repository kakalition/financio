import 'package:drift/drift.dart';
import 'package:financio/core/db/database.dart';
import 'package:financio/core/db/tables/histories.dart';
import 'package:financio/core/db/tables/wallets.dart';

part 'wallets_dao.g.dart';

@DriftAccessor(tables: [Wallets, Histories])
class WalletsDao extends DatabaseAccessor<Database> with _$WalletsDaoMixin {
  WalletsDao(Database db) : super(db);

  Future<List<Wallet>> getWallets() async {
    final insert = db.select(db.wallets);
    insert.where((tbl) => tbl.type.equals("wallet"));
    final data = insert.get();

    return data;
  }

  Future<List<Wallet>> getAllocations() async {
    final insert = db.select(db.wallets);
    insert.where((tbl) => tbl.type.equals("allocation"));
    final data = insert.get();
    print(await data);
    return data;
  }

  Future<int> addWallet(String name, String type) {
    print(name);
    print(type);
    InsertStatement<$WalletsTable, Wallet> insert = db.into(db.wallets);
    return insert.insert(
      WalletsCompanion.insert(
        name: name,
        type: type,
        total: 0,
      ),
    );
  }

  Future<int> deleteWallet(int id) {
    DeleteStatement<$WalletsTable, Wallet> delete = db.delete(db.wallets);
    delete.where((tbl) => tbl.id.equals(id));
    return delete.go();
  }

  Future<void> allocateToWallet(int id, int total, String note) {
    return transaction(() async {
      await db.customStatement("""
        UPDATE 'wallets' 
        SET total = total + $total
        WHERE id = $id;
      """);

      await db.into(db.histories).insert(HistoriesCompanion(
          walletId: Value(id),
          isSpending: Value(0),
          total: Value(total),
          note: Value(note),
          date: Value(DateTime.now())));
    });
  }

  Future<void> deductFromAllocation(int id, int total, String note) {
    return transaction(() async {
      await db.customStatement("""
        UPDATE 'wallets' 
        SET total = total - $total
        WHERE id = $id;
      """);

      await db.into(db.histories).insert(HistoriesCompanion(
          walletId: Value(id),
          isSpending: Value(1),
          total: Value(total),
          note: Value(note),
          date: Value(DateTime.now())));
    });
  }
}
