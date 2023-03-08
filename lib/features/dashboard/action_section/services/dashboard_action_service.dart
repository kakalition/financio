import 'package:financio/core/db/collections/allocations.dart';
import 'package:financio/core/db/collections/histories.dart';
import 'package:financio/core/db/collections/wallets.dart';
import 'package:financio/core/db/repositories/allocation_repository.dart';
import 'package:financio/core/db/repositories/history_repository.dart';
import 'package:financio/core/db/repositories/wallet_repository.dart';
import 'package:isar/isar.dart';

class DashboardActionService {
  final Isar _isar;
  final AllocationRepository _allocationRepository;
  final WalletRepository _walletRepository;
  final HistoryRepository _historyRepository;

  DashboardActionService(
    this._isar,
    this._allocationRepository,
    this._walletRepository,
    this._historyRepository,
  );

  void addIncome(Wallets wallet, double total, String note) {
    _isar.writeTxn(() {
      wallet.total = wallet.total ?? 0 + total;

      final history = Histories()
        ..isSpending = false
        ..note = note
        ..total = total
        ..date = DateTime.now();

      _walletRepository.edit(wallet);
      _historyRepository.add(false, note);

      return Future.value(true);
    });
  }

  void addExpense(Allocations allocation, double total, String note) {
    _isar.writeTxn(() {
      allocation.total = allocation.total ?? 0 - total;

      final history = Histories()
        ..isSpending = true
        ..note = note
        ..total = total
        ..date = DateTime.now();

      _allocationRepository.edit(allocation);
      _historyRepository.add(true, note);

      return Future.value(true);
    });
  }
}
