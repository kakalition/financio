import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SimpleCardWidget extends StatelessWidget {
  final String title;
  final String body;
  const SimpleCardWidget({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            body,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              color: Colors.grey[800],
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
