import 'package:financio/features/dashboard/presentation/dashboard_page.dart';
import 'package:financio/features/mainpage/presentations/main_page.dart';
import 'package:flutter/material.dart';
import "package:go_router/go_router.dart";

class FinancioRouter {
  static GoRouter getRouter() {
    return GoRouter(
      initialLocation: "/dashboard",
      routes: [
        ShellRoute(
            builder: ((context, state, child) {
              return MainPage(body: child);
            }),
            routes: [
              GoRoute(
                path: "/dashboard",
                pageBuilder: ((context, state) {
                  return MaterialPage(
                      child: const DashboardPage(), key: state.pageKey);
                }),
              ),
              GoRoute(
                path: "/wallets",
                pageBuilder: ((context, state) {
                  return MaterialPage(child: Container(), key: state.pageKey);
                }),
              ),
              GoRoute(
                path: "/allocations",
                pageBuilder: ((context, state) {
                  return MaterialPage(child: Container(), key: state.pageKey);
                }),
              ),
              GoRoute(
                path: "/histories",
                pageBuilder: ((context, state) {
                  return MaterialPage(child: Container(), key: state.pageKey);
                }),
              )
            ]),
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
