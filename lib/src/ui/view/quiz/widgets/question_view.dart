import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/src/core/models/question.dart';
import 'package:quiz_app/src/ui/utils/colors.dart';
import 'package:quiz_app/src/ui/view/quiz/widgets/option_card.dart';
import 'package:quiz_app/src/ui/view/quiz/widgets/question_viewmodel.dart';

class QuestionView extends StatelessWidget {
  const QuestionView({required this.question});
  final Question question;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          question.question,
          style: TextStyle(
            color: ThemeColors.textRed,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        ...question.options
            .map(
              (option) => OptionCard(
                option: option,
                onSelect: context.read<QuestionViewModel>().onSelect,
                isSelected:
                    context.watch<QuestionViewModel>().selectedOption == option,
              ),
            )
            .toList(),
      ],
    );
  }
}
