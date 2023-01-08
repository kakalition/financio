import 'package:financio/features/dashboard/action_section/views/income_button.dart';
import 'package:financio/features/dashboard/action_section/views/spend_button.dart';
import 'package:financio/features/dashboard/allocation_section/views/allocations_section.dart';
import 'package:financio/features/dashboard/latest_transaction_section/views/latest_transaction_section.dart';
import 'package:financio/features/dashboard/wallet_section/views/wallet_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends ConsumerState<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 48),
            const WalletSection(),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                IncomeButton(),
                SizedBox(width: 8),
                SpendButton(),
              ],
            ),
            const SizedBox(height: 24),
            const AllocationsSection(),
            const SizedBox(height: 24),
            const LatestTransactionsSection(),
          ],
        ),
      ),
    );
  }
}
