import 'package:financio/core/db/collections/histories.dart';
import 'package:financio/features/histories/providers/histories_filter_notifier.dart';
import 'package:financio/features/histories/providers/histories_filter_state.dart';
import 'package:financio/financio_proviers.dart';
import 'package:financio/utils/formatter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

final filterProvider =
    StateNotifierProvider<HistoriesFilterNotifier, HistoriesFilterState>((ref) {
  return HistoriesFilterNotifier();
});

final rangedHistoriesStream = StreamProvider.autoDispose((ref) async* {
  final filter = ref.watch(filterProvider);
  final isar = await ref.watch(isarProvider.future);

  yield* isar.histories
      .filter()
      .dateBetween(
        filter.dateRange.start.changeTimeToLowerBound(),
        filter.dateRange.end.changeTimeToUpperBound(),
      )
      .sortByDate()
      .watch(fireImmediately: true);
});
