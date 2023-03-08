import 'package:financio/commons/enums/wallets_filter.dart';
import 'package:financio/commons/widgets/primary_button.dart';
import 'package:financio/core/db/repositories/wallet_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:financio/financio_proviers.dart';
import 'package:financio/utils/widgets.dart';

class MovesMoneySheet extends ConsumerStatefulWidget {
  int id;
  MovesMoneySheet({super.key, required this.id});

  @override
  MovesMoneySheetState createState() => MovesMoneySheetState();
}

class MovesMoneySheetState extends ConsumerState<MovesMoneySheet> {
  double total = 0;
  String note = "";
  int? targetWalletId;

  @override
  Widget build(BuildContext context) {
    final wallets = ref.watch(walletsProvider);
    final walletRepository = ref.watch(walletRepositoryProvider);

    return Wrap(
      children: [
        Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pindahkan Uang",
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[900],
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
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
                    labelText: "Total Uang",
                  ),
                ),
                const SizedBox(height: 24),
                PrimaryButton(
                  text: "Pindahkan",
                  onTap: () {
                    walletRepository.whenData((repo) async {
                      await repo.movesMoney(widget.id, targetWalletId!, total);
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Uang berhasil dipindahkan.",
                        ),
                      ),
                    );

                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
