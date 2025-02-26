import 'dart:math';
import 'package:flutter/material.dart';

class ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1600) * maxTextScaleFactor;
    return max(0.5, min(val, maxTextScaleFactor));
  }
}
