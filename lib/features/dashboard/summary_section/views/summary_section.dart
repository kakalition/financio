import 'package:financio/colors.dart';
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
                (e) => Text(
                  e,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Theme.of(context).colorScheme.primary,
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
          height: 32,
          width: 32,
        ));
        continue;
      }

      dayCount++;
      if (dayCount == totalDays) break;

      children.add(
        Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4), color: surfaceColor2),
          child: Center(
            child: Text(
              dayCount.toString(),
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
      );
    }

    while (children.length < 7) {
      children.add(const SizedBox(
        height: 32,
        width: 32,
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
