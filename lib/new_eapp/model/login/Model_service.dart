import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:new_eapp/new_eapp/model/login/login_model.dart';
import 'package:new_eapp/new_eapp/model/login/user_info_login.dart';
import 'package:flutter/material.dart';
import '../../local_storage/local_storage.dart';
import '../../view/home/home_screen.dart';

class LoginService {
  static Future LoginData() async {
    List<LoginModel> Model = [];
    for (var i in UserLoginInfo().LoginInfo) {
      LoginModel modeldata = LoginModel.fromJson(i);
      Model.add(modeldata);
    }
    return Model;
  }
}

class LoginDataSend {
  static sendData({
    required TextEditingController emailcontroller,
    required TextEditingController passwordcontroller,
  }) async {
    for (var i in await LoginService.LoginData()) {
      if (emailcontroller.text == i.email &&
          passwordcontroller.text == i.password) {
        return true;
        break;
      } else {
        return false;
      }
    }
  }
}
