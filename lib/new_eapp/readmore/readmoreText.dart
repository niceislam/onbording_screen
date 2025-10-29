import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class Readmoretext extends StatefulWidget {
  const Readmoretext({super.key});

  @override
  State<Readmoretext> createState() => _ReadmoretextState();
}

class _ReadmoretextState extends State<Readmoretext> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ReadMoreText(
          textAlign: TextAlign.center,
          "ami akn vat khabo tmi ki korbe ami jani na tmi ki amar sathe khela korbe ami tomar sathe khele kortye plaskdjfljasldjfljasl alsdlflajsdfl asl;dfjlsa df aro",
          trimLength: 10,
          moreStyle: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          lessStyle: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          trimCollapsedText: "show more",
          trimExpandedText: "show less",
          trimMode: TrimMode.Line,
        ),
      ),
    );
  }
}
