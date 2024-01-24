import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:safebump/src/config/constant/app_constant.dart';
import 'package:safebump/src/feature/add_baby/logic/cubit/add_baby_bloc.dart';
import 'package:safebump/src/feature/add_baby/logic/cubit/add_fetus_bloc.dart';
import 'package:safebump/src/feature/add_baby/view/add_baby_screen.dart';
import 'package:safebump/src/feature/add_baby/view/add_pregnancy_baby_screen.dart';
import 'package:safebump/src/feature/add_baby/view/select_option_add_screen.dart';
import 'package:safebump/src/feature/calendar/logic/calendar_bloc.dart';
import 'package:safebump/src/feature/calendar/view/calendar_screen.dart';
import 'package:safebump/src/feature/articles/logic/articles_bloc.dart';
import 'package:safebump/src/feature/articles/view/articles_screen.dart';
import 'package:safebump/src/feature/dashboard/bloc/dashboard_state.dart';
import 'package:safebump/src/feature/dashboard/view/dashboard_view.dart';
import 'package:safebump/src/feature/edit_profile/logic/edit_profile_bloc.dart';
import 'package:safebump/src/feature/edit_profile/view/edit_profile_screen.dart';
import 'package:safebump/src/feature/home/logic/home_bloc.dart';
import 'package:safebump/src/feature/home/view/home_screen.dart';
import 'package:safebump/src/feature/forgot_password/logic/cubit/enter_mail_bloc.dart';
import 'package:safebump/src/feature/forgot_password/logic/cubit/reset_password_bloc.dart';
import 'package:safebump/src/feature/forgot_password/view/enter_mail_screen.dart';
import 'package:safebump/src/feature/forgot_password/view/reset_password_screen.dart';
import 'package:safebump/src/feature/on_boarding/view/on_boarding_view.dart';
import 'package:safebump/src/feature/profile/logic/profile_bloc.dart';
import 'package:safebump/src/feature/profile/view/profile_screen.dart';
import 'package:safebump/src/feature/sign_in/logic/sign_in_bloc.dart';
import 'package:safebump/src/feature/sign_in/view/sign_in_view.dart';
import 'package:safebump/src/feature/sign_up/logic/sign_up_bloc.dart';
import 'package:safebump/src/feature/sign_up/view/sign_up_view.dart';
import 'package:safebump/src/feature/sync_data/view/sync_data_view.dart';
import 'package:safebump/src/router/coordinator.dart';
import 'package:safebump/src/router/route_name.dart';
import 'package:safebump/src/services/user_prefs.dart';

class AppRouter {
  final router = GoRouter(
    navigatorKey: AppCoordinator.navigatorKey,
    initialLocation: _initalPath(),
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
      GoRoute(
        parentNavigatorKey: AppCoordinator.navigatorKey,
        path: AppRouteNames.syncData.path,
        name: AppRouteNames.syncData.name,
        builder: (_, __) => const SyncDataScreen(),
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
              pageBuilder: (context, state) => NoTransitionPage(
                    child: BlocProvider(
                      create: (context) =>
                          HomeBloc(AppConstant.getBabyFactsData()),
                      child: const HomeScreen(),
                    ),
                  ),
              routes: <RouteBase>[
                GoRoute(
                    parentNavigatorKey: AppCoordinator.navigatorKey,
                    path: AppRouteNames.articles.subPath,
                    name: AppRouteNames.articles.name,
                    builder: (__, _) => BlocProvider(
                          create: (context) => ArticlesBloc(),
                          child: const ArticlesScreen(),
                        ))
              ]),
          GoRoute(
            path: AppRouteNames.calendar.path,
            name: AppRouteNames.calendar.name,
            pageBuilder: (context, state) => NoTransitionPage(
              child: BlocProvider(
                create: (context) => CalendarBloc(),
                child: const CalendarScreen(),
              ),
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
              pageBuilder: (context, state) => NoTransitionPage(
                    child: BlocProvider(
                      create: (context) => ProfileBloc(),
                      child: const ProfileScreen(),
                    ),
                  ),
              routes: <RouteBase>[
                GoRoute(
                  parentNavigatorKey: AppCoordinator.navigatorKey,
                  path: AppRouteNames.editProfile.subPath,
                  name: AppRouteNames.editProfile.name,
                  builder: (_, state) {
                    return BlocProvider(
                      create: (context) => EditProfileBloc(),
                      child: const EditProfileScreen(),
                    );
                  },
                ),
              ]),
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
          path: AppRouteNames.optionAddBaby.path,
          name: AppRouteNames.optionAddBaby.name,
          builder: (context, state) => const SelectBabyOptionScreen(),
          routes: <RouteBase>[
            GoRoute(
              parentNavigatorKey: AppCoordinator.navigatorKey,
              path: AppRouteNames.addBaby.subPath,
              name: AppRouteNames.addBaby.name,
              builder: (context, state) => BlocProvider(
                create: (context) => AddBabyBloc(),
                child: const AddBabyScreen(),
              ),
            ),
            GoRoute(
              parentNavigatorKey: AppCoordinator.navigatorKey,
              path: AppRouteNames.addPregnancyBaby.subPath,
              name: AppRouteNames.addPregnancyBaby.name,
              builder: (context, state) => BlocProvider(
                create: (context) => AddFetusBloc(),
                child: const AddPreggyScreen(),
              ),
            ),
          ]),
    ],
    errorBuilder: (_, __) => Container(),
  );

  static String _initalPath() {
    final userPref = UserPrefs.I.getIsFirstOpenApp();
    if (userPref) {
      UserPrefs.I.setIsFirstOpenApp(false);
      return AppRouteNames.onBoarding.path;
    }
    return AppRouteNames.syncData.path;
  }
}
