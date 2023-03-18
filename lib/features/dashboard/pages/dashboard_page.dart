import 'package:financio/colors.dart';
import 'package:financio/core/providers/dashboard_providers.dart';
import 'package:financio/features/dashboard/action_section/views/income_button.dart';
import 'package:financio/features/dashboard/action_section/views/spend_button.dart';
import 'package:financio/features/dashboard/allocation_section/views/allocations_section.dart';
import 'package:financio/features/dashboard/latest_transaction_section/views/latest_transaction_section.dart';
import 'package:financio/features/dashboard/wallet_section/views/wallet_section.dart';
import 'package:financio/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends ConsumerState<DashboardPage> {
  @override
  void initState() {
    super.initState();
    ref.read(dashboardDataProvider.notifier).initialize();
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(dashboardDataProvider);

    return Scaffold(
      bottomNavigationBar: WidgetUtils.createNavigationBar(context),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height - 58,
          ),
          child: Container(
            color: Theme.of(context).colorScheme.surface,
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 48),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: surfaceColor),
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WalletSection(total: data.total ?? 0),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          IncomeButton(),
                          SizedBox(width: 8),
                          SpendButton(),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 36),
                AllocationsSection(allocations: data.allocations ?? []),
                const SizedBox(height: 36),
                LatestTransactionsSection(histories: data.histories ?? []),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
