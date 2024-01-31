// ------------------------- FETCH DRIVER REQUEST -------------------------

import 'package:injectable/injectable.dart';
import 'package:mevo/lib.dart';

@Injectable(as: IFetchDriverRequestUseCase)
class FetchDriverRequestUseCase implements IFetchDriverRequestUseCase {
  final IGetDriverRequestService _driverRequestService;

  FetchDriverRequestUseCase({
    required IGetDriverRequestService driverRequestService,
  }) : _driverRequestService = driverRequestService;

  @override
  Future<DriverRequest> call(FetchDriverRequestRequest request) async {
    return _driverRequestService.getDriverRequest(request.user);
  }
}
