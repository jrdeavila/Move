import 'package:flutter/foundation.dart';
import 'package:mevo/lib.dart';
import 'package:mevo/src/presentation/controllers/permission/permission_ctrl.dart';

class ConnectionCtrl extends GetxController {
  // =========================== Observables ==============================

  final RxBool _hasConnection = false.obs;

  // =========================== Lifecycle Hooks ==============================

  @override
  void onReady() {
    super.onReady();
    ever(_hasConnection, _redirectToNoConnectionPage);
    _listenConnectionState();
  }

  // =========================== Private Methods ==============================

  void _listenConnectionState() {
    final connectionService = getIt<IConnectionService>();

    connectionService.connectionStatus.listen((hasConnection) {
      _hasConnection.value = hasConnection;
      if (kDebugMode) {
        print("Connection Status: $hasConnection");
      }
    });
  }

  void _redirectToNoConnectionPage(bool hasConnection) {
    if (hasConnection) {
      final permissionCtrl = Get.put(PermissionCtrl(), permanent: true);
      permissionCtrl.showDialog().then((value) {
        Get.put(NotificationCtrl(), permanent: true);
        Get.put(SessionCtrl(), permanent: true);
      });
    } else {
      Get.offAllNamed(ConnectionRoutes.noConnection);
      Get.delete<PermissionCtrl>();
      Get.delete<SessionCtrl>();
      Get.delete<NotificationCtrl>();
    }
  }

  // =========================== Public Methods ==============================

  void retry() {
    final connectionService = getIt<IConnectionService>();
    connectionService.retry();
  }
}
