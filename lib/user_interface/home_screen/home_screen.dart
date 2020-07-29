import 'package:flutter/material.dart';

import 'package:flutter_quiz/shared/widgets/custom_button.dart';
import 'package:flutter_quiz/utilities/base_screen_routing.dart';

class HomeScreen extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(),
    );
  }

  Widget _getBody() {
    var titleWidget = Text(
      "Calculate Points",
      style: TextStyle(
        color: Colors.amber,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );

    var subtitleWidget = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
          "By answering this 3 mins survey you will know how much points you have aquired.."),
    );

    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Spacer(),
          titleWidget,
          subtitleWidget,
          Spacer(),
          RoundedRectangleButton(title: "Continue", onPress: () => {}),
        ],
      ),
    );
  }
}
