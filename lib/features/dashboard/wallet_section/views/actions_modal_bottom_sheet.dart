import 'package:financio/features/dashboard/wallet_section/views/delete_confirmation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActionsModalBottomSheet extends StatelessWidget {
  final String title;
  final int id;

  const ActionsModalBottomSheet({
    super.key,
    required this.title,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Divider(height: 1),
        ListTile(
          title: Text(
            "Moves money",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              color: Colors.grey[800],
            ),
          ),
          onTap: (() {}),
        ),
        ListTile(
          title: Text(
            "Edit wallet",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              color: Colors.grey[800],
            ),
          ),
          onTap: (() {}),
        ),
        ListTile(
          title: Text(
            "Delete wallet",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              color: Colors.grey[800],
            ),
          ),
          onTap: (() {
            Navigator.of(context).pop();
            showDialog(
              context: context,
              builder: (context) => DeleteConfirmationDialog(id: id),
            );
          }),
        ),
      ],
    );
  }
}
