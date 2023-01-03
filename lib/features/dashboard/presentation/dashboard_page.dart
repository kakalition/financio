import 'package:financio/db/database.dart';
import 'package:financio/features/dashboard/presentation/LatestTransactionsSection.dart';
import 'package:financio/features/dashboard/presentation/dashboard_income_button.dart';
import 'package:financio/features/dashboard/presentation/dashboard_spend_button.dart';
import 'package:financio/features/dashboard/presentation/wallet_section.dart';
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
                DashboardIncomeButton(),
                SizedBox(width: 8),
                DashboardSpendButton(),
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

class AllocationTile extends StatelessWidget {
  final Wallet wallet;
  const AllocationTile({super.key, required this.wallet});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(children: [Text(wallet.name), Text(wallet.total.toRupiah())]),
    );
  }
}

class AllocationsSection extends ConsumerWidget {
  const AllocationsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.read(FinancioProvider.allocations);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Allocations",
          style: GoogleFonts.poppins(
            fontSize: 36,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        data.when(
          data: (data) => Column(
            children: data.toAllocationChildren(),
          ),
          loading: () => const Text("Loading"),
          error: (error, stackTrace) => const Text("Error"),
        )
      ],
    );
  }
}
