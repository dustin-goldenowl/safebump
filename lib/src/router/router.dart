import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:safebump/src/feature/dashboard/bloc/dashboard_state.dart';
import 'package:safebump/src/feature/dashboard/view/dashboard_view.dart';
import 'package:safebump/src/feature/home/view/home_screen.dart';
import 'package:safebump/src/feature/forgot_password/logic/cubit/enter_mail_bloc.dart';
import 'package:safebump/src/feature/forgot_password/logic/cubit/reset_password_bloc.dart';
import 'package:safebump/src/feature/forgot_password/view/enter_mail_screen.dart';
import 'package:safebump/src/feature/forgot_password/view/reset_password_screen.dart';
import 'package:safebump/src/feature/on_boarding/view/on_boarding_view.dart';
import 'package:safebump/src/feature/sign_in/logic/sign_in_bloc.dart';
import 'package:safebump/src/feature/sign_in/view/sign_in_view.dart';
import 'package:safebump/src/feature/sign_up/logic/sign_up_bloc.dart';
import 'package:safebump/src/feature/sign_up/view/sign_up_view.dart';
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
        path: AppRouteNames.onBoarding.path,
        name: AppRouteNames.onBoarding.name,
        builder: (_, __) => const OnBoardingView(),
      ),
      GoRoute(
        parentNavigatorKey: AppCoordinator.navigatorKey,
        path: AppRouteNames.signIn.path,
        name: AppRouteNames.signIn.name,
        builder: (_, __) => BlocProvider(
          create: (context) => SignInBloc(),
          child: const SignInView(),
        ),
      ),
      GoRoute(
        parentNavigatorKey: AppCoordinator.navigatorKey,
        path: AppRouteNames.signUp.path,
        name: AppRouteNames.signUp.name,
        builder: (_, __) => BlocProvider(
          create: (context) => SignUpBloc(),
          child: const SignUpView(),
        ),
      ),
      ShellRoute(
        navigatorKey: AppCoordinator.shellKey,
        builder: (context, state, child) => DashBoardScreen(
          currentItem: XNavigationBarItems.fromLocation(state.uri.toString()),
          body: child,
        ),
        routes: <RouteBase>[
          GoRoute(
            path: AppRouteNames.home.path,
            name: AppRouteNames.home.name,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: HomeScreen(),
            ),
          ),
          GoRoute(
            path: AppRouteNames.calendar.path,
            name: AppRouteNames.calendar.name,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: HomeScreen(),
            ),
          ),
          GoRoute(
            path: AppRouteNames.medicineProfile.path,
            name: AppRouteNames.medicineProfile.name,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: HomeScreen(),
            ),
          ),
          GoRoute(
            path: AppRouteNames.profile.path,
            name: AppRouteNames.profile.name,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: HomeScreen(),
            ),
          ),
        ],
      ),
      GoRoute(
          parentNavigatorKey: AppCoordinator.navigatorKey,
          path: AppRouteNames.enterMail.path,
          name: AppRouteNames.enterMail.name,
          builder: (_, __) => BlocProvider(
                create: (context) => EnterMailBloc(),
                child: const EnterMailScreen(),
              ),
          routes: <RouteBase>[
            GoRoute(
              parentNavigatorKey: AppCoordinator.navigatorKey,
              path: AppRouteNames.verifyCode.buildSubPathParam,
              name: AppRouteNames.verifyCode.name,
              builder: (_, state) {
                final mail =
                    state.pathParameters[AppRouteNames.verifyCode.param]!;
                return BlocProvider(
                  create: (context) => ResetPasswordBloc(mail),
                  child: const VerifyCodeScreen(),
                );
              },
            ),
          ]),
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
