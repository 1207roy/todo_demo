import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tododemo/utils/screen_util.dart';

extension BuildContextExtensions on BuildContext {
  double responsiveHeight(int height) {
    final size = MediaQuery.of(this).size;
    return ScreenUtil.getResponsiveHeightOfWidget(height, size.height);
  }

  double responsiveWidth(int width) {
    final size = MediaQuery.of(this).size;
    return ScreenUtil.getResponsiveWidthOfWidget(width, size.width);
  }

  double responsiveHorizontalPixel(double value) {
    final size = MediaQuery.of(this).size;
    return ScreenUtil.getHorizontalPixel(size, value);
  }

  double get pixelsPerInch => Platform.isAndroid || Platform.isIOS ? 150 : 96;

  MediaQueryData get mq => MediaQuery.of(this);

  bool get isLandscape => mq.orientation == Orientation.landscape;

  Size get sizePx => mq.size;

  double get widthPx => sizePx.width;

  double get heightPx => sizePx.height;

  double get diagonalPx {
    final Size s = sizePx;
    return sqrt((s.width * s.width) + (s.height * s.height));
  }

  Size get sizeInches {
    final Size pxSize = sizePx;
    return Size(pxSize.width / pixelsPerInch, pxSize.height / pixelsPerInch);
  }

  double get widthInches => sizeInches.width;

  double get heightInches => sizeInches.height;

  double get diagonalInches => diagonalPx / pixelsPerInch;

  double widthPct(double fraction) => fraction * widthPx;

  double heightPct(double fraction) => fraction * heightPx;
}