import 'package:financio/commons/widgets/primary_button.dart';
import 'package:financio/financio_proviers.dart';
import 'package:financio/utils/widgets.dart';
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
  int? targetWalletId;

  @override
  Widget build(BuildContext context) {
    final allocationRepository = ref.watch(allocationRepositoryProvider);
    final wallets = ref.watch(walletsProvider);

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
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey[400]!, width: 1)),
            child: wallets.when(
              data: (data) => DropdownButton(
                underline: Container(height: 0),
                isExpanded: true,
                hint: const Text("Dompet Tujuan"),
                onChanged: (value) => setState(() {
                  targetWalletId = value ?? 1;
                }),
                value: targetWalletId,
                items: data.toDropdownItem(),
              ),
              error: (error, stackTrace) => const Text("Errors"),
              loading: () => const Text("Loading"),
            ),
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            text: "Simpan",
            onTap: () {
              allocationRepository.whenData((repo) async {
                await repo.add(name, total, targetWalletId);
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
