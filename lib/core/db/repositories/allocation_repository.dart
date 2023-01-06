import 'package:financio/core/db/collections/allocations.dart';
import 'package:financio/core/db/collections/wallets.dart';
import 'package:isar/isar.dart';

class AllocationRepository {
  final IsarCollection<Allocations> _collection;

  AllocationRepository(this._collection);

  Future<List<Allocations>> get() async {
    final data = _collection.isar.txn(() {
      return _collection.where().findAll();
    });

    return await data;
  }

  Future<int> add(String name, int initialTotal, int? deductionWalletId) {
    return _collection.isar.writeTxn(() async {
      final allocation = Allocations()
        ..name = name
        ..total = initialTotal
        ..lastAllocationDate = DateTime.now()
        ..totalLastAllocation = initialTotal
        ..createdDate = DateTime.now();

      final putFuture = await _collection.put(allocation);
      if (deductionWalletId == null) return putFuture;

      final wallet = await _collection.isar.wallets.get(deductionWalletId);
      if (wallet == null) throw Exception("Wallet not found");

      wallet.total = wallet.total! - initialTotal;

      return await _collection.isar.wallets.put(wallet);
    });
  }

  Future<int> edit(Allocations allocation) {
    return _collection.put(allocation);
  }
}
