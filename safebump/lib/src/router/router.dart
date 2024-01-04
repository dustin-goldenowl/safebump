import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safebump/src/router/coordinator.dart';
import 'package:safebump/src/router/route_name.dart';

class AppRouter {
  final router = GoRouter(
    navigatorKey: AppCoordinator.navigatorKey,
    initialLocation: AppRouteNames.dashboard.path,
    debugLogDiagnostics: kDebugMode,
    routes: <RouteBase>[
    ],
    errorBuilder: (_, __) => Container(),
  );
}