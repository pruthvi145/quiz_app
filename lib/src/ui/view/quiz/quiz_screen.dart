import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/src/core/models/option.dart';
import 'package:quiz_app/src/core/models/question.dart';
import 'package:quiz_app/src/ui/utils/colors.dart';
import 'package:quiz_app/src/ui/view/quiz/quiz_viewmodel.dart';
import 'package:quiz_app/src/ui/view/quiz/widgets/question_view.dart';
import 'package:quiz_app/src/ui/view/quiz/widgets/question_viewmodel.dart';
import 'package:quiz_app/src/ui/view/widgets/loading.dart';

class QuizScreen extends StatelessWidget {
  final Question question = Question(
    id: 1,
    question: "how are you?",
    options: [
      Option(option: "fine", isCorrect: true, id: 1),
      Option(option: "ok", id: 2),
      Option(option: "good", id: 3),
      Option(option: "maa chodava jay", id: 4),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<QuizViewModel>(create: (_) => QuizViewModel()),
        ChangeNotifierProxyProvider<QuizViewModel, QuestionViewmodel>(
          create: (_) {
            print("Creating QuestionViewmodel...");
            return QuestionViewmodel();
          },
          update: (_, quizViewModel, questionViewModel) =>
              questionViewModel == null
                  ? QuestionViewmodel()
                  : questionViewModel
                ..update(quizViewModel),
        ),
      ],
      builder: (context, _) {
        final quizViewModelWatcher = context.watch<QuizViewModel>();
        final reader = context.read<QuizViewModel>();
        return SafeArea(
          child: Scaffold(
            backgroundColor: ThemeColors.backgroundColor,
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: Colors.transparent,
              actions: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(right: 10),
                  child: Text(
                    "Timer",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ThemeColors.orange,
                    ),
                  ),
                )
              ],
              title: Text(
                "Quiz",
                style: TextStyle(
                  color: ThemeColors.textRed,
                ),
              ),
              leading: Center(
                child: Text(
                  "Score: ${quizViewModelWatcher.totalScore}",
                  style: TextStyle(
                    color: ThemeColors.textRed,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            body: quizViewModelWatcher.isLoading
                ? Loading()
                : PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: reader.pageController,
                    children: quizViewModelWatcher.questions
                        .map<Widget>(
                          (question) => SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: QuestionView(
                              question: question,
                            ),
                          ),
                        )
                        .toList(),
                  ),
            bottomNavigationBar: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(
                      ThemeColors.orangeLight.withOpacity(0.3)),
                ),
                onPressed: context.read<QuestionViewmodel>().goToNextQuestion,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    'Next Question',
                    style: TextStyle(
                      fontSize: 20,
                      color: ThemeColors.textRed,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
