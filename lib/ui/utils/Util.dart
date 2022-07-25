import 'dart:math' as math;
import 'package:flutter/material.dart';

class Util {

  static Widget rotateWidget(Widget widget, int rotation) {
    return Transform.rotate(
      angle: rotation * math.pi / 180,
      child: widget
    );
  }

}