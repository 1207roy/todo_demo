import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScreenUtil {
  static final ScreenUtil instance = ScreenUtil();

  static ScreenUtil getInstance() {
    return instance;
  }

  double getAspectHeight(double percentage, BuildContext context) {
    return MediaQuery.of(context).size.width / percentage;
  }

  static double getResponsiveHeightOfWidget(int height, double screenHeight) {
    return screenHeight * height / 812.0;
  }

  static double getResponsiveWidthOfWidget(int width, double screenWidth) {
    return screenWidth * width / 375.0;
  }

  static double getHorizontalPixel(Size size, double value) {
    return (value * size.width) / 375;
  }
}
