import 'package:financio/db/database.dart';
import 'package:financio/features/dashboard/data/wallet_controller.dart';
import 'package:financio/features/dashboard/presentation/dashboard_income_button.dart';
import 'package:financio/features/dashboard/presentation/dashboard_spend_button.dart';
import 'package:financio/features/dashboard/presentation/wallet_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:financio/utils/formatter.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends ConsumerState<DashboardPage> {
  var dummyHistories = [
    DummyHistory("Transportation", "Shell Super", 30000, "16:12", false),
    DummyHistory("Food and Drink", "Oronamin C", 7000, "16:48", false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Financio")),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                Text(
                  "Latest Transactions",
                  style: GoogleFonts.poppins(
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Column(
                  children: dummyHistories.map<Widget>(
                    (e) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  e.category,
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color: Colors.grey[900],
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  e.total.toRupiah(),
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color: Colors.grey[900],
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  e.notes,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  e.time,
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ).toList(),
                ),
              ],
            ),
          ),
        ));
  }
}

class DummyHistory {
  var income = true;
  var category = "";
  var notes = "";
  var total = 0;
  var time = "";

  DummyHistory(this.category, this.notes, this.total, this.time, this.income);
}
