import 'package:flutter/material.dart';

class CustomSize {
  static double screenWidth = 0;
  static double screenHeight = 0;

  void init(BoxConstraints constraints) {
    screenWidth = constraints.maxWidth;
    screenHeight = constraints.maxHeight;
  }

  static double getScreenPropotionHeight(double actualHeight) {
    return (actualHeight / 900.0) * screenHeight;
  }

  static double getScreenPropotionWidth(double actualWidth) {
    return (actualWidth / 375.0) * screenWidth;
  }
}
