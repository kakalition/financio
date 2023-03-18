import 'package:financio/core/db/collections/allocations.dart';
import 'package:flutter/material.dart';
import 'package:financio/utils/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AllocationsSection extends StatelessWidget {
  final List<Allocations> allocations;
  const AllocationsSection({super.key, required this.allocations});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Alokasi",
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Column(
          children: allocations.toAllocationChildren(),
        )
      ],
    );
  }
}
