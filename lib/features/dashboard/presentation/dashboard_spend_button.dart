import 'package:financio/features/dashboard/presentation/spend_dialog.dart';
import 'package:flutter/material.dart';

class DashboardSpendButton extends StatelessWidget {
  const DashboardSpendButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton.icon(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => const SpendDialog(),
        ),
        icon: const Icon(Icons.arrow_upward, size: 16),
        label: const Text("Spend"),
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.grey[900],
          foregroundColor: Colors.grey[50],
          padding: const EdgeInsets.all(12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }
}
