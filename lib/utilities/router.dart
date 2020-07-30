import 'package:flutter/material.dart';
import '../user_interface/quiz_review/quiz_review_screen.dart';
import '../user_interface/quiz_screen/quiz_screen.dart';
import '../user_interface/home_screen/home_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => HomeScreen());

    case QuizScreen.routeName:
      return MaterialPageRoute(builder: (_) => QuizScreen());

    case QuizReviewScreen.routeName:
      return MaterialPageRoute(
          builder: (_) => QuizReviewScreen(settings.arguments));

    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ));
  }
}
