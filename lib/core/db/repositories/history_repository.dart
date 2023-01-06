import 'package:financio/core/db/collections/histories.dart';
import 'package:isar/isar.dart';

class HistoryRepository {
  final IsarCollection<Histories> _collection;

  HistoryRepository(this._collection);

  Future<List<Histories>> get() async {
    final data = _collection.isar.txn(() {
      return _collection.where().findAll();
    });

    return await data;
  }

  Future<List<Histories>> getLatest() async {
    final data = _collection.isar.txn(() {
      return _collection.where().sortByDateDesc().limit(10).findAll();
    });

    return await data;
  }

  Future<int> add(bool isSpending, String note) {
    final history = Histories()
      ..note = note
      ..isSpending = isSpending
      ..date = DateTime.now();
    return _collection.isar.writeTxn(() => _collection.put(history));
  }

  Future<int> edit(Histories history) {
    return _collection.put(history);
  }
}