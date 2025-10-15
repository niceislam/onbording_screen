import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          decoration: PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            bodyTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            safeArea: 1,
            imageAlignment: Alignment.bottomCenter,
          ),
          image: Image.network("https://static.vecteezy.com/system/browse_category/image/195/small_Arrow_cb1.png"),
          title: "Track you work\n and get the result",
          body: "Remember to keep track of your professional accomplishments",
        ),
        PageViewModel(
          decoration: PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            bodyTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            safeArea: 1,
            imageAlignment: Alignment.bottomCenter,
          ),
          image: Image.network("https://static.vecteezy.com/system/browse_category/image/195/small_Arrow_cb1.png"),
          title: "Stay Organized\n With Team",
          body:
              "But understanding the contributions our colleogues make to our teams and companies.",
        ),
        PageViewModel(
          decoration: PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            bodyTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            safeArea: 1,
            imageAlignment: Alignment.bottomCenter,
          ),
          image: Image.network("https://static.vecteezy.com/system/browse_category/image/195/small_Arrow_cb1.png"),
          title: "Get notified when\n work happens",
          body:
              "Toke control of notifications,\ncollaborate live or on your own time",
        ),
      ],
      showSkipButton: true,
      skip: Text(
        "SKIP",
        style: TextStyle(
          color: Colors.blue,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),

      done: Card(
        color: Colors.blue,
        child: SizedBox(
          height: 42,
          width: 80,
          child: Center(
            child: Text(
              "START",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      onDone: () {},
      showNextButton: true,
      next: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.blue,
        child: Icon(Icons.arrow_forward, size: 28, color: Colors.white),
      ),
      dotsDecorator: DotsDecorator(
        spacing: EdgeInsets.symmetric(horizontal: 3),
        activeColor: Colors.blue,
        color: Colors.grey,
        activeSize: Size(25, 9),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
    );
  }
}
