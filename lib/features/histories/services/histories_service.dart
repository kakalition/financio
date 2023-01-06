import 'package:collection/collection.dart';
import 'package:financio/utils/formatter.dart';
import 'package:financio/utils/widgets.dart';
import 'package:financio/core/db/repositories/history_repository.dart';
import 'package:flutter/material.dart';

class HistoriesService {
  final HistoryRepository historyRepository;

  HistoriesService(this.historyRepository);

  Future<List<Widget>> getRangedDateElement(DateTimeRange range) async {
    final list = await historyRepository.getRanged(range);
    final grouped = groupBy(list, ((p0) => p0.date?.toLocalDate()));
    final elements = <Widget>[];

    grouped.forEach(
      (key, value) => elements.add(
        Column(
          children: [
            Text(key ?? ""),
            const SizedBox(height: 16),
            ...value.toColumnChildren()
          ],
        ),
      ),
    );

    return elements;
  }
}
