class ServiceConfiguration {
  final int clientBonification;
  final double driverPaymentPercentage;
  final List<ServiceCommonOffert> commonOfferts;

  ServiceConfiguration({
    required this.clientBonification,
    required this.driverPaymentPercentage,
    required this.commonOfferts,
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
