import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/src/core/models/option.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/src/ui/view/quiz/quiz_screen_viewmodel.dart';

class QuestionViewModel with ChangeNotifier {
  QuestionViewModel(this.context);

  Option? _selectedOption;
  Option? get selectedOption => _selectedOption;
  BuildContext context;

  void onSelect(Option option) {
    _selectedOption = option;
    notifyListeners();
  }

  void goToNextQuestion() =>
      context.read<QuizScreenViewModel>().goToNextQuestion(
            isCorrectAnswer:
                _selectedOption != null && _selectedOption!.isCorrect,
          );
}
