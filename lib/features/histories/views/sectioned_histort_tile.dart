import 'package:financio/utils/widgets.dart';
import 'package:financio/core/db/collections/histories.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionedHistoryTile extends StatelessWidget {
  final String header;
  final List<Histories> body;

  const SectionedHistoryTile({
    super.key,
    required this.header,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            color: Colors.grey[900],
            fontSize: 36,
          ),
        ),
        const SizedBox(height: 16),
        ...body.toColumnChildren(),
        const SizedBox(height: 32),
      ],
    );
  }
}
