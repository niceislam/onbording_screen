import 'dart:developer';
import 'package:new_eapp/new_eapp/local_storage/local_storage.dart';
import 'package:new_eapp/new_eapp/view/home/home_screen.dart';
import 'package:new_eapp/new_eapp/view/login_screen/register_screen.dart';
import 'package:typewritertext/typewritertext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:new_eapp/new_eapp/view/login_screen/loginor_register.dart';
import 'package:new_eapp/new_eapp/widget_all/textfield_widget/txtfield.dart';

import '../../other/or_login_register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool eyeStatus = true;
  bool logincircle = false;
  final mykey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (c) => LoginorRegister()),
            );
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: mykey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TypeWriter.text(
                  maxLines: 2,
                  maintainSize: false,
                  "Welcome back! Glad\nto see you, Again!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                  duration: Duration(milliseconds: 70),
                ),
                SizedBox(height: 20),
                CustomTextfield(
                  hinttext: "Enter your email",
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  validator: (value) {
                    if (value == "" || value == null) {
                      return "field can't be empty";
                    } else if (!(value.contains("@") && value.contains("."))) {
                      return "invalid email";
                    }
                  },
                ),
                SizedBox(height: 15),
                CustomTextfield(
                  obsecureTxt: eyeStatus,
                  hinttext: "Enter your password",
                  sufIcon: InkWell(
                    onTap: () {
                      eyeStatus = !eyeStatus;
                      setState(() {});
                    },
                    child: eyeStatus == true
                        ? Icon(Icons.visibility_off, color: Colors.black)
                        : Icon(Icons.visibility, color: Colors.black),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  validator: (value) {
                    if (value == "" || value == null) {
                      return "field can't be empty";
                    } else if (!(RegExp('[A-Z]').hasMatch(value) &&
                        (RegExp('[a-z]').hasMatch(value)) &&
                        (RegExp('[0-9]').hasMatch(value)))) {
                      return "Enter a strong password";
                    } else if (value.length <= 6) {
                      return "password must be 6 character or more";
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                InkWell(
                  onTap: () async {
                    if (mykey.currentState!.validate()) {
                      await EasyLoading.show();
                      await Future.delayed(Duration(seconds: 2));
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (c) => HomeScreen()),
                      );
                      await LocalStorage().writeData(
                        key: "login",
                        value: "yes",
                      );
                      await EasyLoading.showSuccess("Welcome");
                    }
                  },
                  child: Container(
                    height: 55,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.pink,
                    ),
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 35),
                Row(
                  spacing: 8,
                  children: [
                    Expanded(child: Divider()),
                    Text(
                      "Or login with",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                SizedBox(height: 20),
                orlogin(),
                SizedBox(height: 170),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (c) => RegisterScreen()),
                        );
                      },
                      child: Text(
                        "Register now",
                        style: TextStyle(color: Colors.pink, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
