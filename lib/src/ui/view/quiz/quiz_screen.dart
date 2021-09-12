import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/src/core/models/option.dart';
import 'package:quiz_app/src/core/models/question.dart';
import 'package:quiz_app/src/ui/utils/colors.dart';
import 'package:quiz_app/src/ui/view/quiz/quiz_screen_viewmodel.dart';
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
        ChangeNotifierProvider<QuizScreenViewModel>(
          create: (context) => QuizScreenViewModel(context.read<QuizViewModel>()),
        ),
        ChangeNotifierProvider<QuestionViewModel>(
          create: (context) => QuestionViewModel(context),
        ),
      ],
      builder: (context, _) {
        final quizViewModelWatcher = context.watch<QuizScreenViewModel>();
        return SafeArea(
          child: Scaffold(
            backgroundColor: ThemeColors.backgroundColor,
            body: quizViewModelWatcher.isLoading
                ? Loading()
                : Column(
                    children: [
                      QuizViewHeader(),
                      SizedBox(height: 20),
                      QuizViewBody(),
                      QuizViewFooter(),
                    ],
                  ),
          ),
        );
      },
    );
  }
}

class QuizViewFooter extends StatelessWidget {
  const QuizViewFooter();

  @override
  Widget build(BuildContext context) {
    final quizViewModelWatcher = context.watch<QuizScreenViewModel>();
    final questionViewModelReader = context.read<QuestionViewModel>();
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -1),
            color: Colors.black12,
            blurRadius: 1,
          ),
        ],
      ),
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(ThemeColors.backgroundColor),
          overlayColor: MaterialStateProperty.all(
            ThemeColors.orangeLight.withOpacity(0.3),
          ),
        ),
        onPressed: questionViewModelReader.goToNextQuestion,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Text(
            quizViewModelWatcher.isLastQuestion
                ? 'See Results'
                : 'Next Question',
            style: TextStyle(
              fontSize: 20,
              color: ThemeColors.textRed,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class QuizViewBody extends StatelessWidget {
  const QuizViewBody();

  @override
  Widget build(BuildContext context) {
    final quizViewModelWatcher = context.watch<QuizScreenViewModel>();
    final quizViewModelReader = context.read<QuizScreenViewModel>();
    return Expanded(
      child: PageView(
        onPageChanged: quizViewModelReader.onQuestionChanged,
        physics: NeverScrollableScrollPhysics(),
        controller: quizViewModelReader.pageController,
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
    );
  }
}

class QuizViewHeader extends StatelessWidget {
  const QuizViewHeader();

  @override
  Widget build(BuildContext context) {
    final quizViewModelWatcher = context.watch<QuizViewModel>();
    final quizScreenViewModelReader = context.read<QuizScreenViewModel>();
    final questionViewModelReader = context.read<QuestionViewModel>();
    return Card(
      color: ThemeColors.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Score: ${quizViewModelWatcher.totalScore}",
              style: TextStyle(
                color: ThemeColors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              "Quiz",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: ThemeColors.textRed,
                fontSize: 25,
              ),
            ),
            CircularCountDownTimer(
              controller: quizScreenViewModelReader.countDownController,
              duration:
                  quizScreenViewModelReader.maxTimeAllowedPerQuestion.inSeconds,
              initialDuration: 0,
              isReverse: true,
              // isReverseAnimation: true,
              height: 35,
              width: 35,
              strokeWidth: 3,
              fillColor: ThemeColors.orangeLight,
              ringColor: ThemeColors.orange,
              textFormat: CountdownTextFormat.S,
              textStyle: TextStyle(
                color: ThemeColors.textRed,
                fontSize: 14,
              ),
              onComplete: questionViewModelReader.goToNextQuestion,
            ),
          ],
        ),
      ),
    );
  }
}
