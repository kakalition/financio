import 'dart:io';

import 'package:financio/color_schemes.g.dart';
import 'package:financio/routes/financio_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  // runApp(Provider(
  //   create: (context) => Database(),
  //   child: const Financio(),
  //   dispose: (context, value) => value.close(),
  // ));
  runApp(const ProviderScope(child: Financio()));
}

class Financio extends StatelessWidget {
  const Financio({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: FinancioRouter.getRouter(),
      title: 'Financio',
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
    );
  }
}
