import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionController {

  Future<void> notificationpermission() async {
    PermissionStatus status = await Permission.notification.request();
    if (status == PermissionStatus.granted) {
      Fluttertoast.showToast(msg: "Permission Granted");
    } else if (status == PermissionStatus.denied) {
      Fluttertoast.showToast(msg: "Permission Denied");
    } else if (status == PermissionStatus.permanentlyDenied) {
      Fluttertoast.showToast(msg: "Permission permanentlyDenied");
      openAppSettings();
    }
  }
}
