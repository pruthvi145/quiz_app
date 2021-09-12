import 'package:flutter/material.dart';
import 'package:quiz_app/src/app/locator.dart';
import 'package:quiz_app/src/app/router.gr.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      title: 'Quiz App ',
      debugShowCheckedModeBanner: false,
    );
  }
}
