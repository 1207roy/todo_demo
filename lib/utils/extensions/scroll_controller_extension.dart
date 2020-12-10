import 'package:flutter/material.dart';

extension ScrollControllerExtension on ScrollController {
  bool get hasPositions => this.positions.isNotEmpty && this.positions.length == 1;
}