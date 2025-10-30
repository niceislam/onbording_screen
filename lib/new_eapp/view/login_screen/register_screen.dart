import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:new_eapp/new_eapp/model/login/login_model.dart';
import 'package:new_eapp/new_eapp/model/login/user_info_login.dart';
import 'package:new_eapp/new_eapp/view/login_screen/login_page.dart';
import 'package:typewritertext/typewritertext.dart';

import '../../other/or_login_register.dart';
import '../../widget_all/textfield_widget/txtfield.dart';
import 'loginor_register.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasscontroller = TextEditingController();
  final mykey = GlobalKey<FormState>();
  bool eyeStatus = true;
  bool eyeStatus1 = true;
  bool isLoading = false;
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
                Column(
                  spacing: 15,
                  children: [
                    CustomTextfield(
                      controller: usernamecontroller,
                      hinttext: "Username",
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    CustomTextfield(
                      controller: emailcontroller,
                      hinttext: "Email",
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      validator: (value) {
                        if (value == "" || value == null) {
                          return "field can't be empty";
                        } else if (!(value.contains("@") &&
                            value.contains("."))) {
                          return "invalid email";
                        }
                      },
                    ),
                    CustomTextfield(
                      controller: passwordcontroller,
                      obsecureTxt: eyeStatus,
                      hinttext: "Password",
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
                    CustomTextfield(
                      controller: confirmpasscontroller,
                      obsecureTxt: eyeStatus1,
                      hinttext: "Confirm Password",
                      sufIcon: InkWell(
                        onTap: () {
                          eyeStatus1 = !eyeStatus1;
                          setState(() {});
                        },
                        child: eyeStatus1 == true
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
                        } else if (passwordcontroller.text !=
                            confirmpasscontroller.text) {
                          return "wrong password";
                        }
                      },
                    ),
                  ],
                ),
                SizedBox(height: 30),
                InkWell(
                  onTap: () async {
                    if (mykey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      await Future.delayed(Duration(seconds: 3));
                      Map<String, dynamic> registerData = {
                        "username": usernamecontroller.text,
                        "email": emailcontroller.text,
                        "password": passwordcontroller.text,
                      };
                      UserLoginInfo().LoginInfo.add(registerData);

                      isLoading = false;
                      setState(() {});
                      log("============${UserLoginInfo().LoginInfo.length}");
                      await EasyLoading.showSuccess(
                        "Registration Successfully",
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (c) => LoginPage()),
                      );
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
                      child: isLoading == true
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text(
                              "Register",
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
                      "Or Register with",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                SizedBox(height: 20),
                orlogin(),
                SizedBox(height: 60),
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
                          MaterialPageRoute(builder: (c) => LoginPage()),
                        );
                      },
                      child: Text(
                        "Login now",
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
