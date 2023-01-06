import 'package:financio/core/db/collections/histories.dart';
import 'package:financio/features/histories/views/histories_content.dart';
import 'package:financio/features/histories/views/histories_summaries.dart';
import 'package:financio/features/histories/views/sectioned_histories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:financio/utils/formatter.dart';
import 'package:financio/financio_proviers.dart';

class HistoriesPage extends ConsumerStatefulWidget {
  const HistoriesPage({super.key});

  @override
  HistoriesPageState createState() => HistoriesPageState();
}

class HistoriesPageState extends ConsumerState<HistoriesPage> {
  DateTimeRange date = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now(),
  );

  void onDateRangeClicked() async {
    final newDate = await showDateRangePicker(
          context: context,
          firstDate: DateTime(2020),
          lastDate: DateTime.now(),
          initialDateRange: date,
        ) ??
        date;

    setState(() {
      date = newDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    final histories = ref.watch(rangedHistoriesProvider(date));

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Histories",
                  style: GoogleFonts.poppins(
                      fontSize: 48, fontWeight: FontWeight.w500),
                ),
                TextButton(
                  onPressed: onDateRangeClicked,
                  child: Column(children: [
                    Text(date.start.toLocalDate()),
                    Text(date.end.toLocalDate()),
                  ]),
                ),
              ],
            ),
            const SizedBox(height: 24),
            histories.when(
              data: ((data) => HistoriesContent(histories: data)),
              error: (error, stackTrace) => Text(error.toString()),
              loading: () => const CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
