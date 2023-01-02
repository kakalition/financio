import 'package:drift/drift.dart';
import 'package:financio/db/database.dart';
import 'package:financio/db/histories.dart';
import 'package:financio/db/wallets.dart';

part 'wallets_dao.g.dart';

@DriftAccessor(tables: [Wallets, Histories])
class WalletsDao extends DatabaseAccessor<Database> with _$WalletsDaoMixin {
  WalletsDao(Database db) : super(db);

  Future<List<Wallet>> getWallets() async {
    final data = await db.select(db.wallets).get();
    print(data);
    return data;
  }

  Future<int> addWallet(String name, String type) {
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
    print(id);
    print(total);
    print(note);

    return transaction(() async {
      await db.customStatement("""
        UPDATE 'wallets' 
        SET total = total + $total
        WHERE id = $id;
      """);

      await db.into(db.histories).insert(HistoriesCompanion(
          walletId: Value(id),
          total: Value(total),
          note: Value(note),
          date: Value(DateTime.now())));
    });
  }
}
