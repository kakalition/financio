import 'package:financio/core/db/collections/wallets.dart';
import 'package:isar/isar.dart';

class WalletRepository {
  final IsarCollection<Wallets> _collection;

  WalletRepository(this._collection);

  Future<List<Wallets>> get() async {
    final data = _collection.isar.txn(() {
      return _collection.where().findAll();
    });

    return await data;
  }

  Future<int> add(String name) {
    Wallets wallet = Wallets()
      ..name = name
      ..total = 0
      ..createdDate = DateTime.now();

    return _collection.isar.writeTxn(() => _collection.put(wallet));
  }

  Future<int> edit(Wallets wallet) {
    return _collection.put(wallet);
  }

  Future<void> delete(int id) {
    return _collection.isar.writeTxn(() => _collection.delete(id));
  }
}
