import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:safebump/src/feature/forgot_password/view/enter_mail_screen.dart';
import 'package:safebump/src/feature/forgot_password/view/reset_pass_screen.dart';
import 'package:safebump/src/feature/forgot_password/view/verify_code_screen.dart';
import 'package:safebump/src/feature/on_boarding/view/on_boarding_view.dart';
import 'package:safebump/src/feature/sign_in/logic/sign_in_bloc.dart';
import 'package:safebump/src/feature/sign_in/view/sign_in_view.dart';
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
        builder: (_, __) => const SignUpView(),
      ),
      GoRoute(
          parentNavigatorKey: AppCoordinator.navigatorKey,
          path: AppRouteNames.enterMail.path,
          name: AppRouteNames.enterMail.name,
          builder: (_, __) => const EnterMailScreen(),
          routes: <RouteBase>[
            GoRoute(
                parentNavigatorKey: AppCoordinator.navigatorKey,
                path: AppRouteNames.verifyCode.subPath,
                name: AppRouteNames.verifyCode.name,
                builder: (_, __) => const VerifyCodeScreen(),
                routes: <RouteBase>[
                  GoRoute(
                    parentNavigatorKey: AppCoordinator.navigatorKey,
                    path: AppRouteNames.resetPassword.subPath,
                    name: AppRouteNames.resetPassword.name,
                    builder: (_, __) => const ResetPasswordScreen(),
                  ),
                ]),
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
