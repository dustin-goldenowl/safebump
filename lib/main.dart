import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:safebump/src/locator.dart';
import 'package:safebump/src/router/router.dart';
import 'package:safebump/src/theme/themes.dart';

void main() async {
  await initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appRouter = GetIt.I<AppRouter>();
    return MaterialApp.router(
      title: 'SafeBump',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      routerConfig: appRouter.router,
    );
  }
}
