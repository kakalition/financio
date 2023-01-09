import 'package:financio/utils/widgets.dart';
import 'package:financio/commons/widgets/primary_button.dart';
import 'package:financio/financio_proviers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class IncomeSheet extends ConsumerStatefulWidget {
  const IncomeSheet({super.key});

  @override
  IncomeSheetState createState() => IncomeSheetState();
}

class IncomeSheetState extends ConsumerState {
  double total = 0;
  String note = "";
  int? targetWalletId;

  @override
  Widget build(BuildContext context) {
    final wallets = ref.watch(walletsProvider);
    final transactionRepository = ref.watch(transactionRepositoryProvider);

    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Income Form",
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
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
            border: OutlineInputBorder(),
            labelText: "Total Income",
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          onChanged: (value) => setState(() {
            note = value;
          }),
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
            border: OutlineInputBorder(),
            labelText: "Note",
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
              hint: const Text("Target Wallet"),
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
          text: "Save",
          onTap: () {
            transactionRepository.whenData((repo) async {
              await repo.allocateToWallet(targetWalletId!, total, note);
            });

            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                    "Total income has been allocated from specified wallet."),
              ),
            );
          },
        )
      ]),
    );
  }
}
