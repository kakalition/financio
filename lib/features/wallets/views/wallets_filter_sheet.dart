import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletsFilterSheet extends StatelessWidget {
  const WalletsFilterSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Filter",
          style: GoogleFonts.poppins(
            fontSize: 36,
            fontWeight: FontWeight.w500,
            color: Colors.grey[900],
          ),
        ),
        const SizedBox(height: 24),
        const Text("Wallet Name"),
        TextField(),
        ElevatedButton(onPressed: () {}, child: Text("Apply"))
      ]),
    );
  }
}
