import 'package:financio/routes/financio_router.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  final Widget body;
  const MainPage({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: 'Histories',
          ),
        ],
        currentIndex: FinancioRouter.calculateNavigationIndex(context),
        onTap: (value) => FinancioRouter.onNavigationItemTapped(value, context),
      ),
    );
  }
}
