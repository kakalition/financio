import 'package:financio/core/db/collections/wallets.dart';
import 'package:financio/features/dashboard/wallet_section/providers/money_providers.dart';
import 'package:financio/financio_proviers.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'aggregate_providers.g.dart';

@riverpod
Future<double> netWorth(NetWorthRef ref) async {
  final wallets = await ref.watch(walletsStream.future);
  final allocations = await ref.watch(allocationsStream.future);

  final walletsTotal = wallets.map((e) => e.total ?? 0);

  final totalOnWallets = walletsTotal.isNotEmpty
      ? walletsTotal.reduce((value, element) => value + element)
      : 0.0;

  final allocationsTotal = allocations.map((e) => e.total ?? 0);

  final totalOnAllocations = allocationsTotal.isNotEmpty
      ? allocationsTotal.reduce((value, element) => value + element)
      : 0.0;

  return totalOnWallets + totalOnAllocations;
}

@riverpod
Future<double> netWorthExcludingAllocation(
    NetWorthExcludingAllocationRef ref) async {
  final Isar isar = await ref.watch(isarProvider.future);

  final totalWallets = (await isar.wallets.where().findAll())
      .map((e) => e.total ?? 0)
      .reduce((value, element) => value + element);

  return totalWallets;
}
