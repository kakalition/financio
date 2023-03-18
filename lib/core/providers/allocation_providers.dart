import 'package:financio/commons/enums/allocations_filter.dart';
import 'package:financio/core/db/collections/allocations.dart';
import 'package:financio/financio_proviers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:tuple/tuple.dart';

final allocationsState = StreamProvider.autoDispose
    .family<List<Allocations>, Tuple2<int?, AllocationsFilter?>>(
        (ref, tuple) async* {
  final isar = await ref.watch(isarProvider.future);

  final total = tuple.item1 ?? 1000;
  final filter = tuple.item2 ?? AllocationsFilter.nameAscending;

  final query = isar.allocations.where();
  if (filter == AllocationsFilter.nameAscending) {
    yield* query.sortByName().limit(total).watch(fireImmediately: true);
  } else if (filter == AllocationsFilter.nameDescending) {
    yield* query.sortByNameDesc().limit(total).watch(fireImmediately: true);
  } else if (filter == AllocationsFilter.totalAscending) {
    yield* query.sortByTotal().limit(total).watch(fireImmediately: true);
  } else {
    yield* query.sortByTotalDesc().limit(total).watch(fireImmediately: true);
  }
});
