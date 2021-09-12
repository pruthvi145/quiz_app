import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/src/app/locator.dart';
import 'package:quiz_app/src/app/router.gr.dart';
import 'package:quiz_app/src/core/models/question.dart';
import 'package:quiz_app/src/core/services/quiz_service/demo_quiz_service.dart';
import 'package:quiz_app/src/core/services/quiz_service/quiz_service_base.dart';
import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/src/ui/view/quiz/quiz_viewmodel.dart';

class QuizScreenViewModel with ChangeNotifier {
  QuizScreenViewModel(this.quizViewModel) {
    _setQuestions();
  }

  final QuizViewModel quizViewModel;

  final QuizServiceBase quizService = locator<DemoQuizService>();
  final router = locator<AppRouter>();
  final pageController = PageController();
  final countDownController = CountDownController();
  final maxTimeAllowedPerQuestion = Duration(seconds: 20);
  final maxFixedScorePerQuestion = 10;

  bool get isLastQuestion => _currentQuestionIndex == questions.length - 1;

  List<Question> _questions = [];
  List<Question> get questions => _questions;

  int _currentQuestionIndex = 0;
  int get currentQuestionIndex => _currentQuestionIndex;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  void _setQuestions() async {
    _questions = await quizService.getRandomQuestions(10);
    _isLoading = false;
    notifyListeners();
  }

  void onQuestionChanged(int index) {
    _currentQuestionIndex = index;
    notifyListeners();
  }

  void goToNextQuestion({isCorrectAnswer = false}) {
    countDownController.pause();
    countDownController.getTime();
    if (isCorrectAnswer)
      quizViewModel.increaseScore(
        maxFixedScorePerQuestion + int.parse(countDownController.getTime()),
      );

    if (isLastQuestion) {
      goToResultScreen();
      return;
    }

    pageController.nextPage(
        duration: Duration(milliseconds: 400), curve: Curves.easeOut);
    countDownController.restart();
  }

  void goToResultScreen() {
    router.replaceNamed("/quiz-result-screen");
  }
}
