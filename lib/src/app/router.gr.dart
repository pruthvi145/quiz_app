// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../ui/view/home_screen.dart' as _i3;
import '../ui/view/quiz/quiz_result_screen.dart' as _i5;
import '../ui/view/quiz/quiz_screen.dart' as _i4;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    HomeScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args =
              data.argsAs<HomeScreenArgs>(orElse: () => const HomeScreenArgs());
          return _i3.HomeScreen(key: args.key);
        }),
    QuizScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i4.QuizScreen();
        }),
    QuizResultScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i5.QuizResultScreen();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(HomeScreen.name, path: '/'),
        _i1.RouteConfig(QuizScreen.name, path: '/quiz-screen'),
        _i1.RouteConfig(QuizResultScreen.name, path: '/quiz-result-screen')
      ];
}

class HomeScreen extends _i1.PageRouteInfo<HomeScreenArgs> {
  HomeScreen({_i2.Key? key})
      : super(name, path: '/', args: HomeScreenArgs(key: key));

  static const String name = 'HomeScreen';
}

class HomeScreenArgs {
  const HomeScreenArgs({this.key});

  final _i2.Key? key;
}

class QuizScreen extends _i1.PageRouteInfo<void> {
  const QuizScreen() : super(name, path: '/quiz-screen');

  static const String name = 'QuizScreen';
}

class QuizResultScreen extends _i1.PageRouteInfo<void> {
  const QuizResultScreen() : super(name, path: '/quiz-result-screen');

  static const String name = 'QuizResultScreen';
}
