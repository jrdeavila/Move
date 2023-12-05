import 'package:move_app/lib.dart';

class SendRequestServiceRequest {
  final AppUser clientCreator;
  final AppUser? driver;
  final TravelPoint origin;
  final TravelPoint destination;
  final Payment payment;
  final double tee;

  SendRequestServiceRequest({
    required this.clientCreator,
    required this.driver,
    required this.origin,
    required this.destination,
    required this.payment,
    required this.tee,
  });
}

class CancelRequestServiceRequest {
  final RequestService requestService;

  CancelRequestServiceRequest({
    required this.requestService,
  });
}

class ListenCurrentRequestServiceRequest {
  final AppUser user;

  ListenCurrentRequestServiceRequest({
    required this.user,
  });
}

class ListenDriverLocationRequest {
  final AppUser driver;

  ListenDriverLocationRequest({
    required this.driver,
  });
}

// ------------------------------ Driver ------------------------------

class SendCounterOfferRequest {
  final RequestService requestService;
  final double counterOffer;
  final AppUser driver;

  SendCounterOfferRequest({
    required this.requestService,
    required this.counterOffer,
    required this.driver,
  });
}

class AcceptRequestServiceRequest {
  final RequestService requestService;
  final AppUser driver;

  AcceptRequestServiceRequest({
    required this.requestService,
    required this.driver,
  });
}

class ListenAllRequestServiceRequest {
  final AppUser driver;

  ListenAllRequestServiceRequest({
    required this.driver,
  });
}

class ListenCurrentRequestServiceDriverRequest {
  final AppUser driver;

  ListenCurrentRequestServiceDriverRequest({
    required this.driver,
  });
}

class UpdateProfileLocationDataRequest {
  final AppUser user;
  final double latitude;
  final double longitude;

  UpdateProfileLocationDataRequest({
    required this.user,
    required this.latitude,
    required this.longitude,
  });
}

class FinishServiceDriverRequest {
  final RequestService requestService;

  FinishServiceDriverRequest({
    required this.requestService,
  });
}
