import 'package:injectable/injectable.dart';
import 'package:mevo/lib.dart';

import 'package:permission_handler/permission_handler.dart'
    as permission_handler;

Map<Permission, permission_handler.Permission> _permissionMap = {
  Permission.camera: permission_handler.Permission.camera,
  Permission.storage: permission_handler.Permission.storage,
  Permission.location: permission_handler.Permission.location,
  Permission.sound: permission_handler.Permission.microphone,
};

@LazySingleton(as: IPermissionService)
class DevicePermissionService implements IPermissionService {
  @override
  Future<bool> hasPermission(Permission permission) {
    return _permissionMap[permission]?.status.isGranted ?? Future.value(false);
  }

  @override
  Future<bool> requestPermission(Permission permission) async {
    final res = await _permissionMap[permission]?.request();
    await Future.delayed(const Duration(milliseconds: 1000));
    return res == permission_handler.PermissionStatus.granted;
  }

  @override
  Future<bool> requestPermissions(List<Permission> permissions) {
    Future<bool> verifyAndRequestPermission(Permission permission) async {
      final status = await hasPermission(permission);
      if (status) {
        return true;
      }
      return await requestPermission(permission);
    }

    final futures = permissions.map(verifyAndRequestPermission);

    return Future.wait(futures)
        .then((value) => value.every((element) => element));
  }

  @override
  Future<bool> hasPermissions(List<Permission> permissions) {
    final futures = Future.wait(permissions.map(hasPermission));
    return futures.then((value) => value.every((element) => element));
  }
}
