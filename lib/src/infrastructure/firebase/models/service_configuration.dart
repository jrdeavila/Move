class ServiceConfiguration {
  final int clientbonus;
  final double driverPaymentPercentage;
  final List<ServiceCommonOffert> commonOfferts;
  final int quotaOfPointsForBonus;

  ServiceConfiguration({
    required this.clientbonus,
    required this.driverPaymentPercentage,
    required this.commonOfferts,
    required this.quotaOfPointsForBonus,
  });
}

class ServiceCommonOffert {
  final double offert;
  final int uses;

  ServiceCommonOffert({
    required this.offert,
    required this.uses,
  });
}
