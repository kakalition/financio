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

  Future<int> add(Allocations allocation) {
    return _collection.isar.writeTxn(() => _collection.put(allocation));
  }

  Future<int> edit(Allocations allocation) {
    return _collection.put(allocation);
  }
}
