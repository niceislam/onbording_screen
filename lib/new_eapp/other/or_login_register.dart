import 'package:flutter/material.dart';
class orlogin extends StatelessWidget {
  const orlogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 50,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black12),
          ),
          child: Center(
            child: Image.asset(
              height: 40,
              width: 40,
              "assets/image/facebook.png",
            ),
          ),
        ),
        Container(
          height: 50,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black12),
          ),
          child: Center(
            child: Image.asset(
              height: 40,
              width: 40,
              "assets/image/google.png",
            ),
          ),
        ),
        Container(
          height: 50,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black12),
          ),
          child: Center(
            child: Image.asset(
              height: 40,
              width: 40,
              "assets/image/apple.png",
            ),
          ),
        ),
      ],
    );
  }
}
