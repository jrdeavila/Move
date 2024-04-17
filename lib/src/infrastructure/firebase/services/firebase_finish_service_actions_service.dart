import 'package:injectable/injectable.dart';
import 'package:mevo/lib.dart';

@Injectable(as: IClientBonusService)
class FirebaseClientbonusService implements IClientBonusService {
  final FirebaseFirestore _firebaseFirestore;
  final IClientPointsService _clientPointsService;
  final IConsultServiceConfigurationService _configurationService;

  FirebaseClientbonusService({
    required FirebaseFirestore firebaseFirestore,
    required IClientPointsService clientPointsService,
    required IConsultServiceConfigurationService configurationService,
  })  : _firebaseFirestore = firebaseFirestore,
        _clientPointsService = clientPointsService,
        _configurationService = configurationService;

  @override
  Future<void> updateBonus(
      {required AppUser client, required int servicePrice}) {
    return _firebaseFirestore.runTransaction((transaction) async {
      final serviceConfiguration = await _configurationService.get();

      final points = await _clientPointsService.getPoints(client);

      final pointsBonus =
          serviceConfiguration.clientbonus * servicePrice ~/ 1000;

      final totalBonus = pointsBonus + points;

      await _clientPointsService.updatePoints(
          points: totalBonus, client: client);
    });
  }
}

@Injectable(as: IDriverPaymentService)
class FirebaseDriverPaymentService implements IDriverPaymentService {
  final FirebaseFirestore _firebaseFirestore;
  final IDriverBalanceService _driverBalanceService;
  final IConsultServiceConfigurationService _configurationService;

  FirebaseDriverPaymentService({
    required FirebaseFirestore firebaseFirestore,
    required IDriverBalanceService driverBalanceService,
    required IConsultServiceConfigurationService configurationService,
  })  : _firebaseFirestore = firebaseFirestore,
        _driverBalanceService = driverBalanceService,
        _configurationService = configurationService;
  @override
  Future<void> updatePayment(
      {required double amount, required AppUser driver}) {
    return _firebaseFirestore.runTransaction((transaction) async {
      final serviceConfiguration = await _configurationService.get();

      double balance = await _driverBalanceService.getBalance(driver);

      balance -= amount * serviceConfiguration.driverPaymentPercentage;

      await _driverBalanceService.updateBalance(
          amount: balance, driver: driver);
    });
  }
}

@Injectable(as: IConsultServiceConfigurationService)
class FirebaseConsultServiceConfigurationService
    implements IConsultServiceConfigurationService {
  final FirebaseFirestore _firestore;

  FirebaseConsultServiceConfigurationService({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;
  @override
  Future<ServiceConfiguration> get() {
    return _firestore
        .collection("settings")
        .doc("service_configuration")
        .get()
        .then((value) {
      return serviceConfigurationFromJson(value.data()!);
    });
  }
}
