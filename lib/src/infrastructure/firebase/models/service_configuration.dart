class ServiceConfiguration {
  final int clientBonus;
  final double driverPaymentPercentage;
  final List<ServiceCommonOffer> commonOffers;

  ServiceConfiguration({
    required this.clientBonus,
    required this.driverPaymentPercentage,
    required this.commonOffers,
  });
}

class ServiceCommonOffer {
  final double offer;
  final int uses;

  ServiceCommonOffer({
    required this.offer,
    required this.uses,
  });
}
