import 'package:flutter/material.dart';
import 'package:quiz_app/src/core/models/option.dart';
import 'package:quiz_app/src/ui/utils/colors.dart';

class OptionCard extends StatelessWidget {
  const OptionCard(
      {required this.option, required this.onSelect, required this.isSelected});
  final Option option;
  final void Function(Option) onSelect;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelect(option);
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? ThemeColors.green : ThemeColors.orange,
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 35),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            option.option,
            style: TextStyle(
              color: ThemeColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          //TODO:implement state
          Icon(
            isSelected ? Icons.check : Icons.arrow_forward_ios,
            color: ThemeColors.white,
          ),
        ]),
      ),
    );
  }
}
