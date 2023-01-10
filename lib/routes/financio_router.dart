import 'package:financio/features/dashboard/pages/dashboard_page.dart';
import 'package:financio/features/histories/views/histories_page.dart';
import 'package:financio/features/wallets/views/wallets_page.dart';
import 'package:flutter/material.dart';
import "package:go_router/go_router.dart";

class FinancioRouter {
  static GoRouter getRouter() {
    return GoRouter(
      initialLocation: "/wallets",
      routes: [
        ShellRoute(
          builder: ((context, state, child) {
            return child;
          }),
          routes: [
            GoRoute(
              path: "/dashboard",
              builder: ((context, state) => const DashboardPage()),
            ),
            GoRoute(
              path: "/wallets",
              builder: ((context, state) => const WalletsPage()),
            ),
            GoRoute(
              path: "/histories",
              builder: ((context, state) => const HistoriesPage()),
            )
          ],
        ),
      ],
    );
  }

  static int calculateNavigationIndex(BuildContext context) {
    final GoRouter route = GoRouter.of(context);
    final String location = route.location;
    if (location.startsWith('/dashboard')) {
      return 0;
    } else if (location.startsWith('/wallets')) {
      return 1;
    } else {
      return 2;
    }
  }

  static void onNavigationItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/dashboard');
        break;
      case 1:
        GoRouter.of(context).go('/wallets');
        break;
      // case 2:
      //   GoRouter.of(context).go('/allocations');
      //   break;
      default:
        GoRouter.of(context).go('/histories');
        break;
    }
  }
}
