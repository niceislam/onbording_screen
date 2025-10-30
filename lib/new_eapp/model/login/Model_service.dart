import 'package:new_eapp/new_eapp/model/login/login_model.dart';
import 'package:new_eapp/new_eapp/model/login/user_info_login.dart';

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
