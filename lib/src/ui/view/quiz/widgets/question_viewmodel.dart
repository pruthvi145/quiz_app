import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/src/core/models/option.dart';
import 'package:quiz_app/src/ui/view/quiz/quiz_viewmodel.dart';

class QuestionViewmodel with ChangeNotifier {
  Option? _selectedOption;
  Option? get selectedOption => _selectedOption;

  QuizViewModel? _quizViewModel;

  void onSelect(Option option) {
    _selectedOption = option;
    notifyListeners();
  }

  void update(QuizViewModel quizViewModel) {
    print("updating QuestionViewmodel...");
    _quizViewModel = quizViewModel;
  }

  void goToNextQuestion() {
    if (_selectedOption != null && _selectedOption!.isCorrect) {
      _quizViewModel?.increaseScore(10);
    }
    _quizViewModel?.pageController
        .nextPage(duration: Duration(milliseconds: 400), curve: Curves.easeOut);
  }
}
