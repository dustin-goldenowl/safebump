import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:safebump/src/router/router.dart';

Future initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  _locator();
}

void _locator() {
  GetIt.I.registerLazySingleton(() => AppRouter());
}
