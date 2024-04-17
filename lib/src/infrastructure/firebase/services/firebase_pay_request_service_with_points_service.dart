import 'package:injectable/injectable.dart';
import 'package:mevo/lib.dart';

@Injectable(as: IPayRequestServiceWithPointsService)
class FirebasePayRequestServiceWithPointsService
    implements IPayRequestServiceWithPointsService {
  final IClientPointsService _clientPointsService;
  final IDriverBalanceService _driverBalanceService;
  final IConsultServiceConfigurationService _consultServiceConfigurationService;
  final FirebaseFirestore _firestore;

  FirebasePayRequestServiceWithPointsService({
    required IClientPointsService clientPointsService,
    required IDriverBalanceService driverBalanceService,
    required IConsultServiceConfigurationService
        consultServiceConfigurationService,
    required FirebaseFirestore firestore,
  })  : _clientPointsService = clientPointsService,
        _driverBalanceService = driverBalanceService,
        _consultServiceConfigurationService =
            consultServiceConfigurationService,
        _firestore = firestore;

  @override
  Future<void> payRequestService(RequestService requestService) {
    return _firestore.runTransaction((transaction) async {
      final clientPoints =
          await _clientPointsService.getPoints(requestService.clientCreator);
      final driverBalance =
          await _driverBalanceService.getBalance(requestService.driver!);

      var serviceConfiguration =
          (await _consultServiceConfigurationService.get());
      final pointValue = serviceConfiguration.quotaOfPointsForBonus;
      final driverQuotaPercent = serviceConfiguration.driverPaymentPercentage;

      final pointsToPay = requestService.tee / pointValue;

      if (clientPoints < pointsToPay) {
        throw ExceptionMessage(code: 'points-not-enough');
      }

      final balanceToRecharge =
          requestService.tee - (requestService.tee * driverQuotaPercent);

      await _clientPointsService.updatePoints(
        points: (clientPoints - pointsToPay).toInt(),
        client: requestService.clientCreator,
      );

      await _driverBalanceService.updateBalance(
        amount: driverBalance + balanceToRecharge,
        driver: requestService.driver!,
      );

      transaction.update(
        _firestore.collection('services').doc(requestService.uuid),
        {
          'status': RequestServiceStatus.finished.toString(),
        },
      );
    });
  }
}
