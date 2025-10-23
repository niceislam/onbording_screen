import 'package:flutter/material.dart';
import 'package:new_eapp/new_eapp/view/login_screen/loginor_register.dart';
import 'package:new_eapp/new_eapp/widget_all/textfield_widget/txtfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool eyeStatus = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome back! Glad\nto see you Again!",
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 25),
            CustomTextfield(
              hinttext: "Enter your email",
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
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
            Container(
              height: 55,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
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
            Row(
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
            ),
            Spacer(),
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
                  onPressed: () {},
                  child: Text(
                    "Register now",
                    style: TextStyle(color: Colors.greenAccent, fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
