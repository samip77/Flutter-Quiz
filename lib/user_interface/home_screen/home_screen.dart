import 'package:flutter/material.dart';

import 'package:flutter_quiz/user_interface/widgets/rounded_bordered_button.dart';
import 'package:flutter_quiz/user_interface/quiz_screen/quiz_screen.dart';
import 'package:flutter_quiz/utilities/base_screen.dart';

class HomeScreen extends BaseStatelessWidget {
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(context),
    );
  }

  Widget _getBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Spacer(),
          _getTitleWidget("Points Calculator for Permanent Residency"),
          _getSubtitleWidget(
              "By answering this survey you will know how much points you have aquired.."),
          Spacer(),
          RoundedBorderedButton(
            title: "Continue",
            onPress: () =>
                Navigator.of(context).pushNamed(QuizScreen.routeName),
            isSelected: true,
          ),
        ],
      ),
    );
  }

  Widget _getTitleWidget(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.amber,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }

  Widget _getSubtitleWidget(String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(subtitle),
    );
  }
}
