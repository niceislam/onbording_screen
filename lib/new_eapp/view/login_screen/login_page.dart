import 'dart:developer';
import 'package:new_eapp/new_eapp/local_storage/local_storage.dart';
import 'package:new_eapp/new_eapp/model/login/Model_service.dart';
import 'package:new_eapp/new_eapp/model/login/login_model.dart';
import 'package:new_eapp/new_eapp/model/login/user_info_login.dart';
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
  final mykey = GlobalKey<FormState>();
  bool isLoading = false;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  List<LoginModel> fromjsonData = [];
  getData() async {
    fromjsonData = await LoginService.LoginData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

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
                  controller: emailcontroller,
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
                  controller: passwordcontroller,
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
                      isLoading = true;
                      setState(() {});
                      for (var i in fromjsonData) {
                        if (emailcontroller.text == i.email &&
                            passwordcontroller.text == i.password) {
                          await EasyLoading.showSuccess("Login successfully");
                          await LocalStorage().writeData(
                            key: "login",
                            value: "yes",
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (c) => HomeScreen()),
                          );
                          break;
                        } else {
                          await EasyLoading.showError("Wrong user");
                        }
                        isLoading = false;
                        setState(() {});
                      }
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
