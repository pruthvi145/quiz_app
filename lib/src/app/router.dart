// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/auto_route.dart';
import 'package:quiz_app/src/ui/view/home_screen.dart';
import 'package:quiz_app/src/ui/view/quiz/quiz_result_screen.dart';
import 'package:quiz_app/src/ui/view/quiz/quiz_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomeScreen, initial: true),
    AutoRoute(page: QuizScreen),
    AutoRoute(page: QuizResultScreen),
  ],
)
class $AppRouter {}
