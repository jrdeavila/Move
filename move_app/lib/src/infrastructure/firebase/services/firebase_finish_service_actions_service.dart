import 'package:injectable/injectable.dart';
import 'package:move_app/lib.dart';

@Injectable(as: IClientBonificationService)
class FirebaseClientBonificationService implements IClientBonificationService {
  final FirebaseFirestore _firebaseFirestore;
  final IClientPointsService _clientPointsService;
  final IConsultServiceConfigurationService _configurationService;

  FirebaseClientBonificationService({
    required FirebaseFirestore firebaseFirestore,
    required IClientPointsService clientPointsService,
    required IConsultServiceConfigurationService configurationService,
  })  : _firebaseFirestore = firebaseFirestore,
        _clientPointsService = clientPointsService,
        _configurationService = configurationService;

  @override
  Future<void> updateBonification({required AppUser client}) {
    return _firebaseFirestore.runTransaction((transaction) async {
      final serviceConfiguration = await _configurationService.get();

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
        .then((value) => serviceConfigurationFromJson(value.data()!));
  }
}
