import 'package:flutter/material.dart';
import 'package:quiz_app/src/ui/utils/colors.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: ThemeColors.orange,
        backgroundColor: ThemeColors.orangeLight,
      ),
    );
  }
}
