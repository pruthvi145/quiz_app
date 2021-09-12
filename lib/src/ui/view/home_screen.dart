import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/src/app/router.gr.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
            icon: Icon(Icons.play_arrow_rounded),
            onPressed: () => context.router.pushNamed("/quiz-screen")),
      ),
    );
  }
}
