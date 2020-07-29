import 'package:flutter/material.dart';

class RoundedRectangleButton extends StatelessWidget {
  const RoundedRectangleButton(
      {Key key,
      @required this.onPress,
      @required this.title,
      this.backgroundColor = Colors.amber,
      this.textColor = Colors.white})
      : super(key: key);

  final String title;
  final Function onPress;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: FlatButton(
        color: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Text(
          title,
          style: TextStyle(color: textColor),
        ),
        onPressed: onPress,
      ),
    );
  }
}
