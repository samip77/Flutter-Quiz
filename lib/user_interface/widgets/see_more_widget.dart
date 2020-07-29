import 'package:flutter/material.dart';

class SeeMoreButton extends StatelessWidget {
  final Function onPress;
  final String title;
  final double size;

  const SeeMoreButton({Key key, this.onPress, this.size, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.add,
              size: size,
            ),
            Text(title, style: TextStyle(fontSize: size)),
          ],
        ),
      ),
    );
  }
}
