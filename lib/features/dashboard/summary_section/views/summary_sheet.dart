import 'package:financio/core/db/collections/histories.dart';
import 'package:financio/financio_proviers.dart';
import 'package:financio/utils/formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class SummarySheet extends ConsumerStatefulWidget {
  final DateTime date;
  const SummarySheet({super.key, required this.date});

  @override
  SummarySheetState createState() => SummarySheetState();
}

class SummarySheetState extends ConsumerState {
  @override
  Widget build(BuildContext context) {
    final statefulWidget = widget as SummarySheet;
    final histories = ref.watch(historiesForSummaryProvider(statefulWidget.date));

    return histories.when(
        loading: () => const CircularProgressIndicator(),
        data: (data) =>
            SummarySheetContent(statefulWidget: statefulWidget, data: data),
        error: (error, stacktrace) => Text(error.toString()));
  }
}

class SummarySheetContent extends StatelessWidget {
  const SummarySheetContent(
      {super.key, required this.statefulWidget, required this.data});

  final SummarySheet statefulWidget;
  final List<Histories> data;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ringkasan ${statefulWidget.date.toIndonesianDate()}",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[900],
                ),
              ),
              const SizedBox(height: 24),
              Text(data.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
