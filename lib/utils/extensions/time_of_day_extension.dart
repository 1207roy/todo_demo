import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {
  String getTimeInString() {
//    try {
      String time = this.toString();
      int index1 = time.indexOf('(');
      int index2 = time.indexOf(')');
      return time.substring(index1 + 1, index2);
//    } on Exception catch (_) {
//      return '';
//    }
  }
}
