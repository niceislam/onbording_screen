import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:new_eapp/new_eapp/local_storage/local_storage.dart';
import 'package:new_eapp/new_eapp/view/home/home_screen.dart';
import 'package:new_eapp/new_eapp/view/login_screen/loginor_register.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      // on dots decorator
      dotsDecorator: DotsDecorator(
        color: Colors.grey,
        activeColor: Colors.pink,
        activeSize: Size(30, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        spacing: EdgeInsets.symmetric(horizontal: 3),
      ),
      showSkipButton: true,
      skip: Text(
        "SKIP",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      showNextButton: true,
      next: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.pink,
        child: Center(
          child: Icon(Icons.arrow_forward, color: Colors.white, size: 28),
        ),
      ),
      onDone: () async {
        await LocalStorage().writeData(key: "onbording", value: "yes");
        EasyLoading.show();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (c) => LoginorRegister()),
        );
        EasyLoading.dismiss();
      },
      done: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.pink,
        child: Center(child: Icon(Icons.check, color: Colors.white, size: 28)),
      ),
      showDoneButton: true,

      // onbording page
      pages: [
        PageViewModel(
          decoration: PageDecoration(
            bodyAlignment: Alignment.center,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          title: "Healthy Recipes",
          body:
              "Discover the freshest, locally sourced vegetables delivered straight to your door. Eat better, live healthier, and enjoy the taste of quality.",
          image: Image.asset(
            height: 250,
            width: 250,
            "assets/image/vagitableonbrd.webp",
          ),
        ),
        PageViewModel(
          decoration: PageDecoration(
            bodyAlignment: Alignment.center,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          title: "Your Connected World",
          body:
              "Effortlessly manage and control all your smart devices from one simple hub. Monitor status, automate routines, and secure your home with intuitive precision.",
          image: Image.asset(
            height: 250,
            width: 250,
            fit: BoxFit.fill,
            "assets/image/headPhn.webp",
          ),
        ),
        PageViewModel(
          decoration: PageDecoration(
            bodyAlignment: Alignment.center,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          title: "Design Your Space",
          body:
              "Visualize new furniture and decor in your actual room using augmented reality. Instantly try styles, colors, and layouts before you commit to buying.",
          image: Image.asset(
            height: 250,
            width: 250,
            fit: BoxFit.fill,
            "assets/image/homeDecor.webp",
          ),
        ),
      ],
    );
  }
}
