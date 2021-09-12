import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/src/app/locator.dart';
import 'package:quiz_app/src/app/router.gr.dart';
import 'package:quiz_app/src/ui/view/quiz/quiz_viewmodel.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = locator<AppRouter>();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuizViewModel(),
      child: MaterialApp.router(
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        title: 'Quiz App ',
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
