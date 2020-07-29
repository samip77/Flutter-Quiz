import 'package:flutter/material.dart';

mixin Routing on Widget {
  String routeName() {
    return '/' + this.runtimeType.toString().toLowerCase();
  }
}

abstract class BaseStatelessWidget extends StatelessWidget with Routing {}

abstract class BaseStateFulWidget extends StatefulWidget with Routing {}
