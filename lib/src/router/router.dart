import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safebump/src/feature/on_boarding/view/on_boarding_view.dart';
import 'package:safebump/src/router/coordinator.dart';
import 'package:safebump/src/router/route_name.dart';

class AppRouter {
  final router = GoRouter(
    navigatorKey: AppCoordinator.navigatorKey,
    initialLocation: AppRouteNames.home.path,
    debugLogDiagnostics: kDebugMode,
    routes: <RouteBase>[
      GoRoute(
        parentNavigatorKey: AppCoordinator.navigatorKey,
        path: AppRouteNames.home.path,
        name: AppRouteNames.home.name,
        builder: (_, __) => const OnBoardingView(),
      )
    ],
    errorBuilder: (_, __) => Container(),
  );
}
