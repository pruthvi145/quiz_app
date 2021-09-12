import 'package:quiz_app/src/core/models/option.dart';
import 'package:quiz_app/src/core/models/question.dart';
import 'package:quiz_app/src/core/services/quiz_service/quiz_service_base.dart';

class DemoQuizService implements QuizServiceBase {
  @override
  Future<List<Question>> getQuestions() async {
    await Future.delayed(Duration(seconds: 3));
    return data.keys
        .toList()
        .asMap()
        .map<int, Question>(
          (index, question) => MapEntry(
            index,
            Question(
              id: index,
              question: question,
              options: (data[question] as Map)
                  .keys
                  .toList()
                  .asMap()
                  .map<int, Option>(
                    (index, option) => MapEntry(
                      index,
                      Option(
                        id: index,
                        option: option,
                        isCorrect: data[question][option],
                      ),
                    ),
                  )
                  .values
                  .toList(),
            ),
          ),
        )
        .values
        .toList();
  }

  @override
  Future<List<Question>> getRandomQuestions(int length) async {
    List<Question> questions = await getQuestions();
    if (length > questions.length) length = questions.length;
    questions.shuffle();
    return questions.sublist(0, length);
  }
}

Map<String, dynamic> data = {
  'Who is the Prime Minister of India?': {
    'Narendra Modi': true,
    'Rahul Gandhi': false,
    'Manmohan Singh': false,
    'Amit Shah': false,
  },
  'What is the capital of India?': {
    'Mumbai': false,
    'Chennai': false,
    'Delhi': true,
    'Ahmedabad': false,
  },
  'What is sum of 15 + 25 ?': {
    '5': false,
    '25': false,
    '​40​ ': true,
    'None': false,
  },
  'Which one is maximum? 25, 11, 17, 18, 40, 42': {
    '11': false,
    '​42​': true,
    '17': false,
    'None': false,
  },
  'What is the official language of Gujarat?': {
    'Hindi': false,
    'Gujarati​': true,
    'Marathi': false,
    'None': false,
  },
  'What is multiplication of 12 * 12 ?': {
    '124': false,
    '12': false,
    '24': false,
    '​None': true,
  },
  'Which state of India has the largest population?': {
    'UP​': true,
    'Maharashtra': false,
    'Gujarat': false,
    'Punjab': false,
  },
  'Who is the Home Minister of India?': {
    'Narendra Modi': false,
    'Rahul Gandhi': false,
    'Manmohan Singh': false,
    'Amit Shah': true,
  },
  'What is the capital of Gujarat?': {
    'Vadodara': false,
    'Ahmedabad': false,
    'Gandhinagar​': true,
    'Rajkot': false,
  },
  'Which number will be next in series? 1, 4, 9, 16, 25': {
    '21': false,
    '36': true,
    '49': false,
    '32': false,
  },
  'Which one is minimum? 5, 0, -20, 11': {
    '0': false,
    '11': false,
    '-20': true,
    'None': false,
  },
  'What is the ​ official language of the Government of India?': {
    'Hindi​': true,
    'English': false,
    'Gujarati': false,
    'None': false,
  },
  'Which country is located in Asia?': {
    'India​': true,
    'USA': false,
    'UK': false,
    'None': false,
  },
  'Which language(s) is/are used for Android app development?': {
    'Java': false,
    '​Java & Kotlin​': true,
    'Kotlin': false,
    'Swift': false,
  },
};
