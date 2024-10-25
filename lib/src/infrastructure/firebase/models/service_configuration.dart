class ServiceConfiguration {
  final int clientbonus;
  final double driverPaymentPercentage;
  final List<ServiceCommonOffer> commonOfferts;
  final int quotaOfPointsForBonus;

  ServiceConfiguration({
    required this.clientbonus,
    required this.driverPaymentPercentage,
    required this.commonOfferts,
    required this.quotaOfPointsForBonus,
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
