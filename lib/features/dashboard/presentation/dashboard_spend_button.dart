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
          builder: (context) {
            return AlertDialog(
              actions: [
                TextButton(
                  onPressed: () => {},
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () => {},
                  child: const Text("Save"),
                )
              ],
              title: const Text("Spend money"),
              content: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                padding: const EdgeInsets.only(top: 16),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  const TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                      border: OutlineInputBorder(),
                      labelText: "Total Spending",
                    ),
                  ),
                  const SizedBox(height: 8),
                  const TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                      border: OutlineInputBorder(),
                      labelText: "Note",
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.grey[400]!, width: 1)),
                    child: DropdownButton(
                      underline: Container(height: 0),
                      isExpanded: true,
                      hint: const Text("Deduct from"),
                      onChanged: (string) => {},
                      items: const [
                        DropdownMenuItem(
                          value: "Main Bank",
                          child: Text("Main Bank"),
                        )
                      ],
                    ),
                  ),
                ]),
              ),
            );
          },
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
