import 'package:flutter/material.dart';
import 'package:new_eapp/new_eapp/local_storage/local_storage.dart';
import 'package:new_eapp/new_eapp/view/home/home_screen.dart';
import 'package:new_eapp/new_eapp/view/onbording_screen/onbording_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  navigatepage() async {
    await Future.delayed(Duration(seconds: 3));
    var a = await LocalStorage().readData(key: "onbording");
    if (a == "yes") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (c) => HomeScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (c) => OnbordingScreen()),
      );
    }
  }

  @override
  void initState() {
    navigatepage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height,
        maxWidth: MediaQuery.sizeOf(context).width,
      ),
      child: Center(
        child: Image.asset(height: 250, width: 250, "assets/image/splash.jpg"),
      ),
    );
  }
}
