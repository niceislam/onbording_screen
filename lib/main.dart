import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'new_eapp/view/home/home_screen.dart';
import 'new_eapp/view/onbording_screen/onbording_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
