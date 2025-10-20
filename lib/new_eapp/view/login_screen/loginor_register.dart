import 'package:flutter/material.dart';
import 'package:new_eapp/new_eapp/view/login_screen/login_page.dart';

class LoginorRegister extends StatefulWidget {
  const LoginorRegister({super.key});

  @override
  State<LoginorRegister> createState() => _LoginorRegisterState();
}

class _LoginorRegisterState extends State<LoginorRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width,
          maxHeight: MediaQuery.sizeOf(context).height,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("assets/image/loginpic.jpg"),
            Column(
              spacing: 15,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (c) => LoginPage()),
                    );
                  },
                  child: _buildContainer(
                    title: 'Login',
                    containerColor: Colors.black,
                    fontcolor: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: _buildContainer(
                    title: "Register",
                    containerColor: Colors.transparent,
                    fontcolor: Colors.black,
                    border: BoxBorder.all(color: Colors.black),
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Continue as a guest",
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container _buildContainer({
    required String title,
    required Color containerColor,
    required Color fontcolor,
    BoxBorder? border,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 55,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: border,
        color: containerColor,
      ),
      child: Center(
        child: Text(
          "$title",
          style: TextStyle(
            color: fontcolor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
