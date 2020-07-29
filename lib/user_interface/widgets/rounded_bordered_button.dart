import 'package:flutter/material.dart';

class RoundedBorderedButton extends StatelessWidget {
  const RoundedBorderedButton({
    Key key,
    @required this.onPress,
    @required this.title,
    @required this.isSelected,
  }) : super(key: key);

  final String title;
  final bool isSelected;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: FlatButton(
        color: isSelected ? Colors.amber : Colors.black12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          // side: BorderSide(
          //   color: isSelected ? Colors.amber : Colors.black87,
          //   width: 2,
          // ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
          ),
        ),
        onPressed: onPress,
      ),
    );
  }
}
