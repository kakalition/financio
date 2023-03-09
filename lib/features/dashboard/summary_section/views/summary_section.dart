import 'package:financio/colors.dart';
import 'package:financio/features/dashboard/action_section/views/income_sheet.dart';
import 'package:financio/features/dashboard/summary_section/views/summary_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SummarySection extends ConsumerWidget {
  const SummarySection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = DateTime.now();
    final daysName = ['Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab', 'Min'];
    final calendarWidget = generateCalendar(context, date);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Ringkasan",
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Text(
              DateFormat("MMMM yyyy").format(date),
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w200,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: daysName
              .map(
                (e) => SizedBox(
                  height: 24,
                  width: 32,
                  child: Center(
                    child: Text(
                      e,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 12),
        ...calendarWidget,
      ],
    );
  }
}

List<Widget> generateCalendar(BuildContext context, DateTime date) {
  final result = <Widget>[];
  final firstDayInMonth = DateTime(date.year, date.month, 1);
  final firstDayLocation = firstDayInMonth.weekday - 1;
  final lastDayInMonth = DateTime(date.year, date.month + 1, 1);
  final totalDays = lastDayInMonth.difference(firstDayInMonth).inDays + 1;

  int dayCount = 0;

  while (dayCount != totalDays) {
    final children = <Widget>[];
    for (int i = 0; i < 7; i++) {
      if (result.isEmpty && i < firstDayLocation) {
        children.add(const SizedBox(
          height: 36,
          width: 36,
        ));
        continue;
      }

      dayCount++;
      if (dayCount == totalDays) break;

      children.add(
        DayTile(date: DateTime(date.year, date.month, dayCount)),
      );
    }

    while (children.length < 7) {
      children.add(const SizedBox(
        height: 36,
        width: 36,
      ));
    }

    result.add(Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: children,
    ));

    result.add(const SizedBox(
      height: 12,
    ));
  }

  return result;
}

class DayTile extends StatelessWidget {
  const DayTile({
    super.key,
    required this.date,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: surfaceColor2,
      borderRadius: BorderRadius.circular(4),
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: () {
          final currentDate = date;

          showModalBottomSheet(
            isScrollControlled: true,
            useRootNavigator: true,
            context: context,
            builder: (context) {
              return Wrap(children: [SummarySheet(date: currentDate)]);
            },
          );
        },
        child: SizedBox(
          height: 36,
          width: 36,
          child: Center(
            child: Text(
              date.day.toString(),
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
