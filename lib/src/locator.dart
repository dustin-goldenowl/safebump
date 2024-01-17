import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:safebump/firebase_options.dart';
import 'package:safebump/src/network/data/daily_quiz/daily_quiz_repository.dart';
import 'package:safebump/src/network/data/daily_quiz/daily_quiz_repository_impl.dart';
import 'package:safebump/src/network/data/sign/sign_repository.dart';
import 'package:safebump/src/network/data/sign/sign_repository_impl.dart';
import 'package:safebump/src/network/data/user/user_repository.dart';
import 'package:safebump/src/network/data/user/user_repository_impl.dart';
import 'package:safebump/src/router/router.dart';
import 'package:safebump/src/services/user_prefs.dart';

Future initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Future.wait([
    UserPrefs.instance.initialize(),
  ]);
  _locator();
}

void _locator() {
  GetIt.I.registerLazySingleton(() => AppRouter());

  GetIt.I.registerLazySingleton<SignRepository>(() => SignRepositoryImpl());
  GetIt.I.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());
  GetIt.I.registerLazySingleton<DailyQuizRepository>(() => DailyQuizRepositoryImpl());
}
