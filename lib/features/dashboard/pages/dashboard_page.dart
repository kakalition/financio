import 'package:financio/features/dashboard/action_section/presentations/income_button.dart';
import 'package:financio/features/dashboard/action_section/presentations/spend_button.dart';
import 'package:financio/features/dashboard/allocation_section/presentations/allocations_section.dart';
import 'package:financio/features/dashboard/latest_transaction_section/presentations/latest_transaction_section.dart';
import 'package:financio/features/dashboard/presentation/wallet_section%20copy.dart';
import 'package:financio/utils/widgets.dart';
import 'package:financio/utils/formatter.dart';
import 'package:financio/financio_proviers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

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
