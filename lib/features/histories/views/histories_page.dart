import 'package:financio/commons/widgets/simple_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:financio/utils/formatter.dart';

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

  @override
  Widget build(BuildContext context) {
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
                  onPressed: (() async {
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
                  }),
                  child: Column(children: [
                    Text(date.start.toLocalDate()),
                    Text(date.end.toLocalDate()),
                  ]),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: const [
                Expanded(
                  child: SimpleCardWidget(
                    title: "Total Income",
                    body: "Rp250.000",
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: SimpleCardWidget(
                    title: "Total Income",
                    body: "Rp250.000",
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
