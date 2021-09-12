import 'package:get_it/get_it.dart';
import 'package:quiz_app/src/app/router.gr.dart';
import 'package:quiz_app/src/core/services/quiz_service/demo_quiz_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<DemoQuizService>(DemoQuizService());
  locator.registerSingleton<AppRouter>(AppRouter());
}
