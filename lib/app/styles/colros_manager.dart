import 'package:flutter/material.dart';

class ColorManager {
  static const Color blue = Colors.blue;
  static const Color white = Colors.white;

  static const LinearGradient blueWhiteGradient = LinearGradient(
    colors: [blue, white],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static final LinearGradient buttonColor = LinearGradient(
    colors: [Colors.blue.shade700, Colors.blue.shade800],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static final LinearGradient buttonColor2 = LinearGradient(
    colors: [Colors.blue.shade700, Colors.blueGrey, Colors.blue.shade800],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
