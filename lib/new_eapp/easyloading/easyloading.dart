import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';

class Easyloading11 {
  setting() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 20.0
      ..progressColor = Colors.white
      ..backgroundColor = Colors.white
      ..indicatorColor = Colors.white
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false;
  }
}
