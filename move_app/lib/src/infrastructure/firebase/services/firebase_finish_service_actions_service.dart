import 'package:injectable/injectable.dart';
import 'package:move_app/lib.dart';

@Injectable(as: IClientBonificationService)
class FirebaseClientBonificationService implements IClientBonificationService {
  final FirebaseFirestore _firebaseFirestore;
  final IClientPointsService _clientPointsService;

  FirebaseClientBonificationService({
    required FirebaseFirestore firebaseFirestore,
    required IClientPointsService clientPointsService,
  })  : _firebaseFirestore = firebaseFirestore,
        _clientPointsService = clientPointsService;

  @override
  Future<void> updateBonification({required AppUser client}) {
    return _firebaseFirestore.runTransaction((transaction) async {
      final serviceConfiguration = await _firebaseFirestore
          .collection("settings")
          .doc("service_configuration")
          .get()
          .then((value) => serviceConfigurationFromJson(value.data()!));

      final points = await _clientPointsService.getPoints(client);

      final bonification = points + serviceConfiguration.clientBonification;

      await _clientPointsService.updatePoints(
          points: bonification, client: client);
    });
  }
}

@Injectable(as: IDriverPaymentService)
class FirebaseDriverPaymentService implements IDriverPaymentService {
  final FirebaseFirestore _firebaseFirestore;
  final IDriverBalanceService _driverBalanceService;

  FirebaseDriverPaymentService({
    required FirebaseFirestore firebaseFirestore,
    required IDriverBalanceService driverBalanceService,
  })  : _firebaseFirestore = firebaseFirestore,
        _driverBalanceService = driverBalanceService;
  @override
  Future<void> updatePayment(
      {required double amount, required AppUser driver}) {
    return _firebaseFirestore.runTransaction((transaction) async {
      final serviceConfiguration = await _firebaseFirestore
          .collection("settings")
          .doc("service_configuration")
          .get()
          .then((value) => serviceConfigurationFromJson(value.data()!));

      double balance = await _driverBalanceService.getBalance(driver);

      balance -= amount * serviceConfiguration.driverPaymentPercentage;

      await _driverBalanceService.updateBalance(
          amount: balance, driver: driver);
    });
  }
}
