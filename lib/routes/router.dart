import 'package:financio/features/dashboard/presentation/dashboard_page.dart';
import "package:go_router/go_router.dart";

class Router {
  static GoRouter getFinancioRouter() {
    return GoRouter(routes: [
      GoRoute(
        path: "/",
        builder: (context, state) {
          return DashboardPage();
        },
      )
    ]);
  }
}
