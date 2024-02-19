import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:mevo/lib.dart';

@LazySingleton(as: IConnectionService)
class DeviceConnectionService implements IConnectionService {
  final StreamController<bool> _connectionStatusController =
      StreamController<bool>();

  DeviceConnectionService() {
    _getConnectionStatus();
  }

  @override
  Stream<bool> get connectionStatus => _connectionStatusController.stream;

  void _getConnectionStatus() async {
    while (true) {
      await retry();
      await Future.delayed(const Duration(seconds: 5));
    }
  }

  @override
  Future<void> retry() async {
    final result = await Connectivity().checkConnectivity();
    _connectionStatusController.add(result != ConnectivityResult.none);
  }
}
