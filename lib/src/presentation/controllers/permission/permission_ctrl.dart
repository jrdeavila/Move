import 'package:flutter/services.dart';
import 'package:mevo/lib.dart';

class PermissionCtrl extends GetxController {
  Future<void> showDialog() async {
    final permissionService = getIt<IPermissionService>();
    final hasPermissions = await permissionService.hasPermissions([
      Permission.camera,
      Permission.storage,
      Permission.location,
      Permission.sound,
    ]);

    if (hasPermissions) {
      return;
    }
    return Get.defaultDialog(
        titlePadding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        title: 'Permisos necesarios',
        content: const Column(
          children: [
            Text(
              'Mevo Taxis necesita permisos para acceder a la ubicación en primer plano, cámara y micrófono para que las funciones de configuración de perfil, solicitar viaje, y otras funciones puedan funcionar correctamente.',
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            child: const Text('Cerrar aplicación'),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Permitir'),
          ),
        ]);
  }

  void requestPermissions({
    List<Permission> permissions = const [
      Permission.camera,
      Permission.storage,
      Permission.location,
      Permission.sound,
    ],
    Function(bool)? onResult,
  }) async {
    final permissionService = getIt<IPermissionService>();

    permissionService.requestPermissions(permissions).then((value) {
      onResult?.call(value);
    });
  }
}
