import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tfg_v2/ui/navigation/routes.dart';
import 'package:tfg_v2/ui/widgets/screens/splash/splash_screen.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

class TfgNavigator {
  final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: Routes.splash,
    routes: <RouteBase>[
      GoRoute(
        path: Routes.splash,
        builder: (BuildContext context, GoRouterState state) =>
            const SplashScreen(),
      ),
    ],
  );

  Future<void> navigateToSplash() {
    return router.push(Routes.splash);
  }

  void pop() {
    if (router.canPop()) router.pop();
  }
}
