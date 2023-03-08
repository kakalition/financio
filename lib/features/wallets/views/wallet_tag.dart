import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletTag extends StatelessWidget {
  final bool? isPrimary;
  const WalletTag({super.key, required this.isPrimary});

  @override
  Widget build(BuildContext context) {
    return isPrimary == true
        ? Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.cyan[500],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "Primary",
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.blue[900],
              ),
            ),
          )
        : Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.orange[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "Secondary",
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 81, 28, 0),
              ),
            ),
          );
  }
}
