import 'package:financio/commons/widgets/primary_button.dart';
import 'package:financio/financio_proviers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class NewAllocationSheet extends ConsumerStatefulWidget {
  const NewAllocationSheet({super.key});

  @override
  NewAllocationSheetState createState() => NewAllocationSheetState();
}

class NewAllocationSheetState extends ConsumerState {
  String name = "";
  double total = 0;

  @override
  Widget build(BuildContext context) {
    final allocationRepository = ref.watch(allocationRepositoryProvider);

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Tambah Alokasi Baru",
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[900],
            ),
          ),
          const SizedBox(height: 24),
          TextField(
            onChanged: (value) => setState(() {
              name = value;
            }),
            decoration: const InputDecoration(
              isDense: true,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              border: OutlineInputBorder(),
              labelText: "Nama",
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            onChanged: (value) => setState(() {
              total = double.parse(value);
            }),
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              isDense: true,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              border: OutlineInputBorder(),
              labelText: "Total Alokasi",
            ),
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            text: "Simpan",
            onTap: () {
              allocationRepository.whenData((repo) async {
                await repo.add(name, total);
              });

              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "Alokasi berhasil dibuat.",
                  ),
                ),
              );
            },
          )
        ]),
      ),
    );
  }
}
