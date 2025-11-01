import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_eapp/new_eapp/widget_all/textfield_widget/txtfield.dart';
import 'package:device_info_plus/device_info_plus.dart';

class CoderAngon extends StatefulWidget {
  const CoderAngon({super.key});

  @override
  State<CoderAngon> createState() => _CoderAngonState();
}

class _CoderAngonState extends State<CoderAngon> {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.2, 0.8],
            colors: [Color(0xff04011A), Colors.blue],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      height: 130,
                      width: 180,
                      child: Image.network(
                        fit: BoxFit.fill,
                        height: 120,
                        width: 120,
                        "https://img2.clipart-library.com/28/ca-logo-clipart/ca-logo-clipart-18.png",
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Coder",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 60,
                          ),
                        ),
                        Text(
                          "Angon",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 60,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 50, left: 18, right: 18),
                height: 450,
                width: MediaQuery.sizeOf(context).width - 40,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 1],
                    colors: [Color(0xff020114), Colors.transparent],
                  ),

                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(500),
                    topLeft: Radius.circular(500),
                  ),
                  color: Colors.red,
                ),
                child: Column(
                  children: [
                    Text(
                      "SIGN IN",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Login to your account to start.",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    SizedBox(height: 40),
                    CustomTextfield(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hinttext: "ID",
                      contentPading: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 10,
                      ),
                    ),
                    SizedBox(height: 15),
                    CustomTextfield(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      hinttext: "Password",
                      contentPading: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 10,
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),

                      height: 45,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Create an account",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:  FutureBuilder<AndroidDeviceInfo>(
        future: deviceInfo.androidInfo,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            AndroidDeviceInfo infoData = snapshot.data;
            return Row(
              children: [
                Container(
                  height: 30,
                  width: MediaQuery.sizeOf(context).width,
                  color: CupertinoColors.activeBlue,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${infoData.name}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),Text(
                          "-${infoData.id}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
