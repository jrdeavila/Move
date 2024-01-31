import 'package:mevo/src/src.dart';

abstract class IGetMyPointsUseCase {
  Future<int> getMyPoints(GetMyPointsRequest request);
}

abstract class IListenMyPointsUseCase {
  Stream<int> getPoints(GetMyPointsRequest request);
}

abstract class IListenMyBalanceUseCase {
  Stream<double> getBalance(GetMyBalanceRequest request);
}
