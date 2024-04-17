import 'package:mevo/lib.dart';

abstract class IClientBonusService {
  Future<void> updateBonus({
    required AppUser client,
    required int servicePrice,
  });
}

abstract class IDriverPaymentService {
  Future<void> updatePayment({
    required double amount,
    required AppUser driver,
  });
}

abstract class IDriverBalanceService {
  Future<void> updateBalance({
    required double amount,
    required AppUser driver,
  });

  Future<double> getBalance(AppUser driver);

  Stream<double> listenBalance(AppUser driver);
}

abstract class IClientPointsService {
  Future<void> updatePoints({
    required int points,
    required AppUser client,
  });

  Future<int> getPoints(AppUser client);

  Stream<int> listenPoints(AppUser client);
}
