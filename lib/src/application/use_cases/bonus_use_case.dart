import 'package:injectable/injectable.dart';
import 'package:mevo/lib.dart';

@Injectable(as: IGetMyPointsUseCase)
class GetMyPointsUseCase implements IGetMyPointsUseCase {
  final IClientPointsService _clientPointsService;

  GetMyPointsUseCase(this._clientPointsService);
  @override
  Future<int> getMyPoints(GetMyPointsRequest request) {
    return _clientPointsService.getPoints(request.user);
  }
}

@Injectable(as: IListenMyPointsUseCase)
class ListenMyPointsUseCase implements IListenMyPointsUseCase {
  final IClientPointsService _clientPointsService;

  ListenMyPointsUseCase(this._clientPointsService);
  @override
  Stream<int> getPoints(GetMyPointsRequest request) {
    return _clientPointsService.listenPoints(request.user);
  }
}

@Injectable(as: IListenMyBalanceUseCase)
class ListenMyBalanceUseCase implements IListenMyBalanceUseCase {
  final IDriverBalanceService _driverBalanceService;

  ListenMyBalanceUseCase(this._driverBalanceService);
  @override
  Stream<double> getBalance(GetMyBalanceRequest request) {
    return _driverBalanceService.listenBalance(request.user);
  }
}

@Injectable(as: IGetQuotaPerPointUseCase)
class GetQuotaPerPointUseCase implements IGetQuotaPerPointUseCase {
  final IConsultServiceConfigurationService _consultServiceConfigurationService;

  GetQuotaPerPointUseCase(this._consultServiceConfigurationService);
  @override
  Future<int> getQuotaPerPoint() async {
    return (await _consultServiceConfigurationService.get())
        .quotaOfPointsForBonus;
  }
}

@Injectable(as: IGetPointsPerTravelUseCase)
class GetPointsPerTravelUseCase implements IGetPointsPerTravelUseCase {
  final IConsultServiceConfigurationService _consultServiceConfigurationService;

  GetPointsPerTravelUseCase(this._consultServiceConfigurationService);
  @override
  Future<int> getPointsPerTravel() async {
    return (await _consultServiceConfigurationService.get()).clientbonus;
  }
}
