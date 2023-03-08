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
      ..isPrimary = false
      ..createdDate = DateTime.now();

    return _collection.isar.writeTxn(() => _collection.put(wallet));
  }

  Future<void> movesMoney(int fromWallet, int targetWallet, double total) {
    return _collection.isar.writeTxn(() async {
      Wallets? from = await _collection.get(fromWallet);
      if (from == null) throw Exception("Wallet not found.");

      Wallets? to = await _collection.get(targetWallet);
      if (to == null) throw Exception("Wallet not found.");

      from.total = from.total! - total;
      to.total = to.total! + total;

      _collection.put(from);
      _collection.put(to);
    });
  }

  Future<int> edit(Wallets wallet) {
    return _collection.put(wallet);
  }

  Future<void> delete(int id) {
    return _collection.isar.writeTxn(() => _collection.delete(id));
  }

  Future<int> toPrimary(int id) {
    return _collection.isar.writeTxn(() async {
      final wallets =
          await _collection.filter().isPrimaryEqualTo(true).findAll();

      wallets.forEach((element) {
        element.isPrimary = false;
        _collection.put(element);
      });

      final wallet = await _collection.get(id);
      if (wallet == null) throw Exception("Wallet not found.");

      wallet.isPrimary = true;
      return _collection.put(wallet);
    });
  }
}
