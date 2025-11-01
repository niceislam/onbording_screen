import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:new_eapp/new_eapp/view/login_screen/login_page.dart';
import 'package:new_eapp/new_eapp/view/login_screen/register_screen.dart';

class LoginorRegister extends StatefulWidget {
  const LoginorRegister({super.key});

  @override
  State<LoginorRegister> createState() => _LoginorRegisterState();
}

class _LoginorRegisterState extends State<LoginorRegister> {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          constraints: BoxConstraints(
            maxWidth: MediaQuery.sizeOf(context).width,
            maxHeight: MediaQuery.sizeOf(context).height,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                height: 400,
                width: 400,
                "assets/image/loginorpic.png",
              ),
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
                      containerColor: Colors.pink,
                      fontcolor: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (c) => RegisterScreen()),
                      );
                    },
                    child: _buildContainer(
                      title: "Register",
                      containerColor: Colors.transparent,
                      fontcolor: Colors.pink,
                      border: BoxBorder.all(color: Colors.pink),
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
      ),
      bottomNavigationBar: FutureBuilder(
        future: deviceInfo.androidInfo,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          var info = snapshot.data;
          if (snapshot.hasData) {
            return Container(
              height: 50,
              width: MediaQuery.sizeOf(context).width,
              color: Colors.blue,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${info.name}",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    Text(
                      "${info.id}",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                ),
              ),
            );
          }
          return CircularProgressIndicator();
        },
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
