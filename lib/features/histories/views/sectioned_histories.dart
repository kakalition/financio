import 'package:collection/collection.dart';
import 'package:financio/features/histories/views/sectioned_histort_tile.dart';
import 'package:financio/utils/formatter.dart';
import 'package:financio/core/db/collections/histories.dart';
import 'package:flutter/material.dart';

class SectionedHistories extends StatelessWidget {
  final List<Histories> list;

  const SectionedHistories({super.key, required this.list});

  List<Widget> toElement(List<Histories> list) {
    final elements = <Widget>[];

    final grouped = groupBy(list, ((p0) => p0.date?.toLocalDate()));
    grouped.forEach(
      (key, value) => elements.add(SectionedHistoryTile(
        header: key ?? "",
        body: value,
      )),
    );

    return elements;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: toElement(list),
    );
  }
}
