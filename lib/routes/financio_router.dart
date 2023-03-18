import 'package:financio/features/allocations/views/allocations_page.dart';
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
              pageBuilder: (context, state) => CustomTransitionPage<void>(
                child: const DashboardPage(),
                transitionsBuilder: (
                  context,
                  animation,
                  secondaryAnimation,
                  child,
                ) =>
                    FadeTransition(opacity: animation, child: child),
              ),
            ),
            GoRoute(
              path: "/wallets",
              pageBuilder: (context, state) => CustomTransitionPage<void>(
                child: const WalletsPage(),
                transitionsBuilder: (
                  context,
                  animation,
                  secondaryAnimation,
                  child,
                ) =>
                    FadeTransition(opacity: animation, child: child),
              ),
            ),
            GoRoute(
              path: "/allocations",
              pageBuilder: (context, state) => CustomTransitionPage<void>(
                child: const AllocationsPage(),
                transitionsBuilder: (
                  context,
                  animation,
                  secondaryAnimation,
                  child,
                ) =>
                    FadeTransition(opacity: animation, child: child),
              ),
            ),
            GoRoute(
              path: "/histories",
              pageBuilder: (context, state) => CustomTransitionPage<void>(
                child: const HistoriesPage(),
                transitionsBuilder: (
                  context,
                  animation,
                  secondaryAnimation,
                  child,
                ) =>
                    FadeTransition(opacity: animation, child: child),
              ),
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
    } else if (location.startsWith('/allocations')) {
      return 2;
    } else {
      return 3;
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
      case 2:
        GoRouter.of(context).go('/allocations');
        break;
      default:
        GoRouter.of(context).go('/histories');
        break;
    }
  }
}
