import 'package:financio/core/db/collections/histories.dart';
import 'package:financio/core/db/collections/allocations.dart';
import 'package:financio/core/db/collections/wallets.dart';
import 'package:isar/isar.dart';

class TransactionRepository {
  final Isar _isar;

  TransactionRepository(this._isar);

  Future<void> allocateToWallet(int walletId, int total, String note) async {
    return await _isar.writeTxn(() async {
      final wallet = await _isar.wallets.get(walletId);
      wallet?.total = wallet.total! + total;

      await _isar.wallets.put(wallet!);

      final history = Histories()
        ..isSpending = false
        ..total = total
        ..note = note
        ..walletName = wallet.name!
        ..date = DateTime.now();

      await _isar.histories.put(history);
    });
  }

  Future<void> deductFromAllocation(
    int allocationId,
    int total,
    String note,
  ) {
    return _isar.writeTxn(() async {
      final allocation = await _isar.allocations.get(allocationId);
      if (allocation == null) throw Exception("Allocation not found");

      allocation.total = allocation.total! - total;

      await _isar.allocations.put(allocation);

      final history = Histories()
        ..isSpending = true
        ..total = total
        ..note = note
        ..walletName = allocation.name!
        ..date = DateTime.now();

      await _isar.histories.put(history);
    });
  }
}
