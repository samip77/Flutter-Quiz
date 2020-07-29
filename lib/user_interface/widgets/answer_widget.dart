import 'package:flutter/material.dart';
import 'package:flutter_quiz/user_interface/widgets/rounded_bordered_button.dart';

class AnswerWidget extends StatelessWidget {
  const AnswerWidget({this.isSelected, this.function, this.title});

  final bool isSelected;
  final Function function;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: RoundedBorderedButton(
        isSelected: isSelected,
        onPress: function,
        title: title,
      ),
    );
  }
}
