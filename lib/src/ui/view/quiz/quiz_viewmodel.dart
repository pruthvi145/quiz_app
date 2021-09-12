import 'package:flutter/foundation.dart';

class QuizViewModel with ChangeNotifier {
  int _correctAnswers = 0;

  int _totalScore = 0;
  int get totalScore => _totalScore;

  void increaseScore(int score) {
    _totalScore += score;
    notifyListeners();
  }

  void resetScore() {
    _totalScore = 0;
    notifyListeners();
  }
}
