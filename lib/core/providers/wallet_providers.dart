import 'package:financio/commons/enums/wallets_filter.dart';
import 'package:financio/core/db/collections/wallets.dart';
import 'package:financio/financio_proviers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:tuple/tuple.dart';

final walletsState = StreamProvider.autoDispose
    .family<List<Wallets>, Tuple2<int?, WalletsFilter?>>((ref, tuple) async* {
  final isar = await ref.watch(isarProvider.future);

  final total = tuple.item1 ?? 1000;
  final filter = tuple.item2 ?? WalletsFilter.nameAscending;

  final query = isar.wallets.where();
  if (filter == WalletsFilter.nameAscending) {
    yield* query.sortByName().limit(total).watch(fireImmediately: true);
  } else if (filter == WalletsFilter.nameDescending) {
    yield* query.sortByNameDesc().limit(total).watch(fireImmediately: true);
  } else if (filter == WalletsFilter.totalAscending) {
    yield* query.sortByTotal().limit(total).watch(fireImmediately: true);
  } else {
    yield* query.sortByTotalDesc().limit(total).watch(fireImmediately: true);
  }
});
