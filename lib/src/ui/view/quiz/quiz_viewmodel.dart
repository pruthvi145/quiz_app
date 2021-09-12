import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/src/app/locator.dart';
import 'package:quiz_app/src/core/models/question.dart';
import 'package:quiz_app/src/core/services/quiz_service/demo_quiz_service.dart';
import 'package:quiz_app/src/core/services/quiz_service/quiz_service_base.dart';

class QuizViewModel with ChangeNotifier {
  QuizViewModel() {
    _setQuestions();
  }

  final QuizServiceBase quizService = locator<DemoQuizService>();
  final pageController = PageController();
  final maxTimeAllowedPerQuestion = Duration(seconds: 20);
  final maxFixedScorePerQuestion = 10;

  List<Question> _questions = [];
  List<Question> get questions => _questions;

  int _currentQuestionIndex = 0;
  int get currentQuestionIndex => _currentQuestionIndex;

  int _totalScore = 0;
  int get totalScore => _totalScore;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  void _setQuestions() async {
    _questions = await quizService.getRandomQuestions(10);
    _isLoading = false;
    notifyListeners();
  }

  void increaseScore(int score) {
    final maxScore =
        maxFixedScorePerQuestion + maxTimeAllowedPerQuestion.inSeconds;
    assert(score <= maxScore, "Score must be less than $maxScore!");
    _totalScore += score;
    notifyListeners();
  }
}
