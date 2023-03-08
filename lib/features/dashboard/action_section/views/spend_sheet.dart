import 'package:financio/utils/widgets.dart';
import 'package:financio/commons/widgets/primary_button.dart';
import 'package:financio/features/histories/providers/histories_providers.dart';
import 'package:financio/financio_proviers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class SpendSheet extends ConsumerStatefulWidget {
  const SpendSheet({super.key});

  @override
  SpendSheetState createState() => SpendSheetState();
}

class SpendSheetState extends ConsumerState {
  double total = 0;
  String note = "";
  int? allocationId;

  @override
  Widget build(BuildContext context) {
    final allocations = ref.watch(allocationsStream);
    final transactionRepository = ref.watch(transactionRepositoryProvider);

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Form Pengeluaran",
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[900],
            ),
          ),
          const SizedBox(height: 24),
          TextField(
            onChanged: (value) => setState(() {
              total = double.parse(value);
            }),
            decoration: const InputDecoration(
              isDense: true,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              border: OutlineInputBorder(),
              labelText: "Total Pengeluaran",
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            onChanged: ((value) => setState(() {
                  note = value;
                })),
            decoration: const InputDecoration(
              isDense: true,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              border: OutlineInputBorder(),
              labelText: "Catatan",
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey[400]!, width: 1)),
            child: allocations.when(
              data: (data) => DropdownButton(
                underline: Container(height: 0),
                isExpanded: true,
                hint: const Text("Kurangi dari alokasi"),
                onChanged: (value) => setState(() {
                  allocationId = value;
                }),
                value: allocationId,
                items: data.toDropdownItems(),
              ),
              error: ((error, stackTrace) => const Text("Errors")),
              loading: () => const Text("Loading"),
            ),
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            text: "Simpan",
            onTap: () {
              transactionRepository.whenData((repo) async {
                await repo.deductFromAllocation(allocationId!, total, note);
              });

              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "Total sisa alokasi telah dikurangi sebanyak total pengeluaran.",
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
