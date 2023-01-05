import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DummyExpense {
  int day;
  int total;

  DummyExpense(this.day, this.total);
}

class ExpenseGraphWidget extends StatelessWidget {
  var totalExpenses = [
    DummyExpense(1, 15000),
    DummyExpense(2, 19000),
    DummyExpense(3, 17000),
    DummyExpense(4, 11000),
    DummyExpense(5, 12000),
    DummyExpense(6, 19000),
    DummyExpense(7, 15000),
    DummyExpense(8, 19000),
    DummyExpense(9, 17000),
    DummyExpense(10, 11000),
    DummyExpense(11, 12000),
    DummyExpense(12, 19000),
    DummyExpense(13, 15000),
    DummyExpense(14, 19000),
    DummyExpense(15, 17000),
    DummyExpense(16, 11000),
    DummyExpense(17, 12000),
    DummyExpense(18, 19000),
    DummyExpense(19, 15000),
    DummyExpense(20, 19000),
    DummyExpense(21, 17000),
    DummyExpense(22, 11000),
    DummyExpense(23, 12000),
    DummyExpense(24, 19000),
    DummyExpense(25, 19000),
    DummyExpense(26, 19000),
    DummyExpense(27, 19000),
    DummyExpense(28, 19000),
    DummyExpense(29, 2000),
    DummyExpense(30, 19000),
  ];

  ExpenseGraphWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var totalExpense = totalExpenses.map((e) => e.total).toList();
    totalExpense.sort((a, b) => b - a);
    var highestExpense = totalExpense[0];

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[100],
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "November Expense Graph",
            style: GoogleFonts.poppins(
                fontSize: 36,
                fontWeight: FontWeight.w500,
                color: Colors.grey[800]),
          ),
          const SizedBox(height: 48),
          SizedBox(
            height: 400,
            child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(width: 32),
                scrollDirection: Axis.horizontal,
                itemCount: totalExpenses.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                        child: FractionallySizedBox(
                          heightFactor:
                              totalExpenses[index].total / highestExpense,
                          child: Container(
                            width: 28,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(128),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        totalExpenses[index].day.toString(),
                        style: GoogleFonts.poppins(fontSize: 18),
                      )
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
