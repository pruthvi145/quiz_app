import 'package:quiz_app/src/core/models/question.dart';

abstract class QuizServiceBase {
  Future<List<Question>> getQuestions();
  Future<List<Question>> getRandomQuestions(int length);
}
