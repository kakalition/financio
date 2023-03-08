import 'package:financio/colors.dart';
import 'package:financio/core/db/collections/allocations.dart';
import 'package:financio/utils/formatter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllocationTile extends StatelessWidget {
  final Allocations allocation;
  const AllocationTile({super.key, required this.allocation});

  @override
  Widget build(BuildContext context) {
    final fractionValue = allocation.total! / allocation.totalLastAllocation!;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                allocation.name ?? "",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.grey[900],
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                allocation.total?.toRupiah() ?? "",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.grey[900],
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      height: 4,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: surfaceColor2,
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: fractionValue,
                      child: Container(
                        height: 4,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Text("${fractionValue * 100}%")
            ],
          )
        ],
      ),
    );
  }
}
