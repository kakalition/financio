import 'package:drift/drift.dart';
import 'package:financio/db/database.dart';

class WalletController {
  Database db;

  WalletController(this.db);

  Future<List<Wallet>> getWallets() async {
    return await db.select(db.wallets).get();
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
}
