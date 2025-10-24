import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:new_eapp/new_eapp/easyloading/easyloading.dart';
import 'package:new_eapp/new_eapp/view/home/home_screen.dart';
import 'package:new_eapp/new_eapp/view/login_screen/loginor_register.dart';
import 'package:new_eapp/new_eapp/view/login_screen/register_screen.dart';
import 'package:new_eapp/new_eapp/view/splash_screen/splash_screen.dart';

void main() {
  Easyloading11().setting();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      home: SplashScreen(),
    );
  }
}
