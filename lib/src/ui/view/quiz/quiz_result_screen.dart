import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/src/ui/view/quiz/quiz_viewmodel.dart';

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(context.watch<QuizViewModel>().totalScore.toString()),
      ),
    );
  }
}
