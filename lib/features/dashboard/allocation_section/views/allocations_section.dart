import 'package:financio/features/dashboard/allocation_section/views/allocation_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:financio/financio_proviers.dart';
import 'package:financio/utils/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AllocationsSection extends ConsumerWidget {
  const AllocationsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(allocationsStream);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Allocations",
          style: GoogleFonts.poppins(
            fontSize: 36,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        const AllocationMenu(),
        const SizedBox(height: 8),
        data.when(
          data: (data) => Column(
            children: data.toAllocationChildren(),
          ),
          loading: () => const Text("Loading"),
          error: (error, stackTrace) => const Text("Error"),
        )
      ],
    );
  }
}
