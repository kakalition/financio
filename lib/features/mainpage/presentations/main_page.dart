import 'package:financio/color_schemes.g.dart';
import 'package:financio/routes/financio_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class MainPage extends StatelessWidget {
  final Widget Function(BuildContext) bodyBuilder;
  final Widget Function(BuildContext)? fabBuilder;
  const MainPage({super.key, required this.bodyBuilder, this.fabBuilder});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      home: Scaffold(
        floatingActionButton:
            fabBuilder != null ? Builder(builder: fabBuilder!) : null,
        body: Builder(builder: bodyBuilder),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.home),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.creditCard),
              label: 'Dompet',
            ),
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.clock),
              label: 'Riwayat',
            ),
          ],
          currentIndex: FinancioRouter.calculateNavigationIndex(context),
          onTap: (value) =>
              FinancioRouter.onNavigationItemTapped(value, context),
        ),
      ),
    );
  }
}
