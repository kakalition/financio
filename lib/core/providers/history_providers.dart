import 'package:financio/commons/enums/histories_filter.dart';
import 'package:financio/core/db/collections/histories.dart';
import 'package:financio/financio_proviers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:tuple/tuple.dart';
import 'package:financio/utils/formatter.dart';

final historiesSnapshotState = FutureProvider.autoDispose
    .family<List<Histories>, Tuple3>((ref, tuple) async {
  final isar = await ref.watch(isarProvider.future);

  final total = tuple.item1 ?? 1000;
  final filter = tuple.item2 ?? HistoriesFilter.dateDescending;
  final DateTimeRange? range = tuple.item3;

  if (range != null) {
    final query = isar.histories.where().filter().dateBetween(
          range.start.changeTimeToLowerBound(),
          range.end.changeTimeToUpperBound(),
        );
    if (filter == HistoriesFilter.dateAscending) {
      return query.sortByDate().limit(total).findAll();
    } else {
      return query.sortByDateDesc().limit(total).findAll();
    }
  }

  final query = isar.histories.where();

  if (filter == HistoriesFilter.dateAscending) {
    return query.sortByDate().limit(total).findAll();
  } else {
    return query.sortByDateDesc().limit(total).findAll();
  }
});

final historiesState = StreamProvider.autoDispose
    .family<List<Histories>, Tuple3>((ref, tuple) async* {
  final isar = await ref.watch(isarProvider.future);

  final total = tuple.item1 ?? 1000;
  final filter = tuple.item2 ?? HistoriesFilter.dateDescending;
  final range = tuple.item3 ??
      DateTimeRange(
        start: DateTime.now(),
        end: DateTime.now(),
      );

  final query = isar.histories.where().filter().dateBetween(
        range.start.changeTimeToLowerBound(),
        range.end.changeTimeToUpperBound(),
      );

  if (filter == HistoriesFilter.dateAscending) {
    yield* query.sortByDate().limit(total).watch(fireImmediately: true);
  } else {
    yield* query.sortByDateDesc().limit(total).watch(fireImmediately: true);
  }
});
