import 'package:financio/commons/widgets/primary_button.dart';
import 'package:financio/features/histories/providers/histories_providers.dart';
import 'package:financio/utils/formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoriesFilterSheet extends ConsumerStatefulWidget {
  const HistoriesFilterSheet({super.key});

  @override
  HistoriesFilterSheetState createState() => HistoriesFilterSheetState();
}

class HistoriesFilterSheetState extends ConsumerState {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  @override
  void initState() {
    super.initState();

    final filterState = ref.read(filterProvider);
    startDate = filterState.dateRange.start;
    endDate = filterState.dateRange.end;
  }

  @override
  Widget build(BuildContext context) {
    final filterState = ref.watch(filterProvider);

    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Filter Histories",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.grey[900],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          "Date Range",
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.grey[900],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () async {
                  final newStartDate = await showDatePicker(
                    context: context,
                    initialDate: filterState.dateRange.start,
                    firstDate: DateTime(2020),
                    lastDate: DateTime.now(),
                  );

                  if (newStartDate == null) return;
                  setState(() {
                    startDate = newStartDate;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500]!),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(startDate.toLocalDate()),
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Text("-"),
            const SizedBox(width: 8),
            Expanded(
              child: InkWell(
                onTap: () async {
                  final newEndDate = await showDatePicker(
                    context: context,
                    initialDate: filterState.dateRange.start,
                    firstDate: DateTime(2020),
                    lastDate: DateTime.now(),
                  );

                  if (newEndDate == null) return;
                  setState(() {
                    endDate = newEndDate;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500]!),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(endDate.toLocalDate()),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        PrimaryButton(
            text: "Apply Filter",
            onTap: () {
              ref
                  .read(filterProvider.notifier)
                  .changeDate(DateTimeRange(start: startDate, end: endDate));
              Navigator.of(context).pop();
            })
      ]),
    );
  }
}
