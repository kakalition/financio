import 'package:financio/colors.dart';
import 'package:financio/features/dashboard/wallet_section/views/new_wallet_dialog.dart';
import 'package:flutter/material.dart';

class WalletMenuWidget extends StatelessWidget {
  const WalletMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: surfaceColor,
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => const NewWalletDialog(),
          );
        },
        child: Container(
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
          ),
          child: Icon(Icons.add, color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
