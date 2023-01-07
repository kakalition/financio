import 'package:financio/core/db/collections/allocations.dart';
import 'package:financio/core/db/collections/histories.dart';
import 'package:financio/core/db/collections/wallets.dart';
import 'package:financio/core/db/repositories/allocation_repository.dart';
import 'package:financio/core/db/repositories/history_repository.dart';
import 'package:financio/core/db/repositories/transaction_repository.dart';
import 'package:financio/core/db/repositories/wallet_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "financio_proviers.g.dart";

@riverpod
Future<Isar> isar(IsarRef ref) async {
  final isar = await Isar.open([
    WalletsSchema,
    AllocationsSchema,
    HistoriesSchema,
  ]);

  ref.keepAlive();

  return isar;
}

@riverpod
Future<WalletRepository> walletRepository(WalletRepositoryRef ref) async {
  final isar = await ref.watch(isarProvider.future);
  final walletRepository = WalletRepository(isar.wallets);

  return walletRepository;
}

@riverpod
Future<List<Wallets>> wallets(WalletsRef ref) async {
  final walletRepository = await ref.watch(walletRepositoryProvider.future);
  final data = await walletRepository.get();

  return data;
}

final walletsStream = StreamProvider.autoDispose((ref) async* {
  final isar = await ref.watch(isarProvider.future);

  yield* isar.wallets.where().sortByName().watch(fireImmediately: true);
});

@riverpod
Future<AllocationRepository> allocationRepository(
    AllocationRepositoryRef ref) async {
  final isar = await ref.watch(isarProvider.future);
  final allocationRepository = AllocationRepository(isar.allocations);

  return allocationRepository;
}

@riverpod
Future<List<Allocations>> allocations(AllocationsRef ref) async {
  final allocationRepository =
      await ref.watch(allocationRepositoryProvider.future);
  final data = await allocationRepository.get();

  return data;
}

final allocationsStream = StreamProvider.autoDispose((ref) async* {
  final isar = await ref.watch(isarProvider.future);

  yield* isar.allocations.where().sortByName().watch(fireImmediately: true);
});

@riverpod
Future<HistoryRepository> historyRepository(HistoryRepositoryRef ref) async {
  final isar = await ref.watch(isarProvider.future);
  final historyRepository = HistoryRepository(isar.histories);

  return historyRepository;
}

@riverpod
Future<List<Histories>> histories(HistoriesRef ref) async {
  final historyRepository = await ref.watch(historyRepositoryProvider.future);
  final data = await historyRepository.get();

  return data;
}

@riverpod
Future<List<Histories>> latestHistories(LatestHistoriesRef ref) async {
  final historyRepository = await ref.watch(historyRepositoryProvider.future);
  final data = await historyRepository.getLatest();

  return data;
}

final latestHistoriesStream = StreamProvider.autoDispose((ref) async* {
  final isar = await ref.watch(isarProvider.future);

  yield* isar.histories
      .where()
      .sortByDateDesc()
      .limit(10)
      .watch(fireImmediately: true);
});

@riverpod
Future<List<Histories>> rangedHistories(
  LatestHistoriesRef ref,
  DateTimeRange dateTimeRange,
) async {
  final historyRepository = await ref.watch(historyRepositoryProvider.future);
  final data = await historyRepository.getRanged(dateTimeRange);

  return data;
}

@riverpod
Future<TransactionRepository> transactionRepository(
    TransactionRepositoryRef ref) async {
  final isar = await ref.watch(isarProvider.future);
  final repository = TransactionRepository(isar);

  return repository;
}

class FinancioProvider {
  // static final db = FutureProvider.autoDispose((ref) async {
  //   final db = await Isar.open([
  //     WalletsSchema,
  //     AllocationsSchema,
  //     HistoriesSchema,
  //   ]);

  //   ref.onDispose(() => db.close());

  //   return db;
  // });

  // static final walletRepository = Provider.autoDispose((ref) {
  //   final isar = ref.watch(FinancioProvider.db);
  //   final walletRepository = WalletRepository(isar.wallets);

  //   return walletRepository;
  // });

  // static final wallets = FutureProvider((ref) {
  //   final walletRepository = ref.read(FinancioProvider.walletRepository);

  //   return walletRepository.get();
  // });

  // static final allocationRepository = Provider((ref) {
  //   final isar = ref.read(FinancioProvider.db);
  //   final allocationRepository = AllocationRepository(isar.allocations);

  //   return allocationRepository;
  // });

  // static final historyRepository = Provider((ref) {
  //   final isar = ref.read(FinancioProvider.db);
  //   final historyRepository = HistoryRepository(isar.histories);

  //   return historyRepository;
  // });
}

// class WalletsStateNotifier extends StateNotifier<List<Wallets>> {
//   WalletRepository repository;
//   WalletsStateNotifier._create(this.repository, List<Wallets> data)
//       : super(data);

//   static WalletsStateNotifier create(WalletRepository repository) async {
//     final data = await repository.get();

//     return WalletsStateNotifier._create(repository, data);
//   }

//   void addWallet(Wallets wallet) async {
//     repository.add(wallet);
//     state = await repository.get();
//   }
// }

  // static Stream<List<Wallets>> walletsStreamGenerator(Isar isar) async* {
  //   yield await isar.wallets.where().findAll();

  //   print("init");
  //   await for (final _ in isar.wallets.watchLazy()) {
  //     print("yielded");
  //     yield await isar.wallets.where().findAll();
  //   }
  // }

  // static final walletsStream = StreamProvider((ref) {
  //   final isar = ref.read(FinancioProvider.db);

  //   return walletsStreamGenerator(isar);
  // });