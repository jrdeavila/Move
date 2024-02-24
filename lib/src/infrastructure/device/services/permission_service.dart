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
  Future<bool> requestPermission(Permission permission) {
    return _permissionMap[permission]
            ?.request()
            .then((value) => value.isGranted) ??
        Future.value(false);
  }

  @override
  Future<bool> requestPermissions(List<Permission> permissions) {
    verifyAndRequestPermission(Permission permission) async {
      final status = await hasPermission(permission);
      if (status) {
        return true;
      }
      return await requestPermission(permission);
    }

    final futures = Future.wait(permissions.map(verifyAndRequestPermission));

    return futures.then((value) => value.every((element) => element));
  }

  @override
  Future<bool> hasPermissions(List<Permission> permissions) {
    final futures = Future.wait(permissions.map(hasPermission));
    return futures.then((value) => value.every((element) => element));
  }
}
