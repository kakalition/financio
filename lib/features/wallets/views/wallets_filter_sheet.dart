import 'package:financio/commons/enums/wallets_filter.dart';
import 'package:financio/commons/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletsFilterSheet extends StatefulWidget {
  WalletsFilter filter;
  void Function(WalletsFilter) applyFilter;

  WalletsFilterSheet({
    super.key,
    required this.filter,
    required this.applyFilter,
  });

  @override
  State<WalletsFilterSheet> createState() => _WalletsFilterSheetState();
}

class _WalletsFilterSheetState extends State<WalletsFilterSheet> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Filter",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[900],
                ),
              ),
              const SizedBox(height: 24),
              RadioListTile(
                title: const Text('Nama A-Z'),
                contentPadding: const EdgeInsets.symmetric(vertical: 2),
                value: WalletsFilter.nameAscending,
                groupValue: widget.filter,
                onChanged: (WalletsFilter? value) {
                  setState(() {
                    widget.filter = value ?? widget.filter;
                  });
                },
              ),
              RadioListTile(
                title: const Text('Nama Z-A'),
                contentPadding: const EdgeInsets.symmetric(vertical: 2),
                value: WalletsFilter.nameDescending,
                groupValue: widget.filter,
                onChanged: (WalletsFilter? value) {
                  setState(() {
                    widget.filter = value ?? widget.filter;
                  });
                },
              ),
              RadioListTile(
                title: const Text('Total Terkecil'),
                contentPadding: const EdgeInsets.symmetric(vertical: 2),
                value: WalletsFilter.totalAscending,
                groupValue: widget.filter,
                onChanged: (WalletsFilter? value) {
                  setState(() {
                    widget.filter = value ?? widget.filter;
                  });
                },
              ),
              RadioListTile(
                title: const Text('Total Terbesar'),
                contentPadding: const EdgeInsets.symmetric(vertical: 2),
                value: WalletsFilter.totalDescending,
                groupValue: widget.filter,
                onChanged: (WalletsFilter? value) {
                  setState(() {
                    widget.filter = value ?? widget.filter;
                  });
                },
              ),
              const SizedBox(height: 24),
              PrimaryButton(
                text: "Terapkan",
                onTap: () {
                  widget.applyFilter(widget.filter);
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        )
      ],
    );
  }
}
