import 'package:flutter/material.dart';
import 'package:quiz_app/src/app/locator.dart';
import 'package:quiz_app/src/app/router.gr.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final router = locator<AppRouter>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          icon: Icon(Icons.play_arrow_rounded),
          onPressed: () => router.replaceNamed("/quiz-screen"),
        ),
      ),
    );
  }
}
