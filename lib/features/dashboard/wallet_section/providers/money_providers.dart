import 'package:financio/core/db/collections/allocations.dart';
import 'package:financio/core/db/collections/wallets.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:financio/financio_proviers.dart';

part 'money_providers.g.dart';

@riverpod
Future<double> netWorth(NetWorthRef ref) async {
  final Isar isar = await ref.watch(isarProvider.future);

  final totalWallets = (await isar.wallets.where().findAll())
      .map((e) => e.total ?? 0)
      .reduce((value, element) => value + element);

  final totalAllocations = (await isar.allocations.where().findAll())
      .map((e) => e.total ?? 0)
      .reduce((value, element) => value + element);

  return totalWallets + totalAllocations;
}

@riverpod
Future<double> netWorthExcludingAllocation(NetWorthExcludingAllocationRef ref) async {
  final Isar isar = await ref.watch(isarProvider.future);

  final totalWallets = (await isar.wallets.where().findAll())
      .map((e) => e.total ?? 0)
      .reduce((value, element) => value + element);

  return totalWallets;
}
