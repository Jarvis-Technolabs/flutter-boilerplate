import 'package:permission_handler/permission_handler.dart';

class PermissionUtil {
  static final PermissionHandler _permissionHandler = PermissionHandler();

  static Future<bool> requestPermission(PermissionGroup permission) async {
    var result = await _permissionHandler.requestPermissions([permission]);
    if (result[permission] == PermissionStatus.granted) {
      return true;
    }
    return false;
  }

  static Future<bool> hasPermission(PermissionGroup permission) async {
    var permissionStatus =
        await _permissionHandler.checkPermissionStatus(permission);
    return permissionStatus == PermissionStatus.granted;
  }

  static Future<bool> isDoNotShowChecked(
      PermissionGroup permissionGroup) async {
    return await _permissionHandler
        .shouldShowRequestPermissionRationale(permissionGroup);
  }
}
