abstract class IConnectionService {
  Stream<bool> get connectionStatus;

  Future<void> retry();
}
