class ServiceConfiguration {
  final int clientbonus;
  final double driverPaymentPercentage;
  final List<ServiceCommonOffert> commonOfferts;

  ServiceConfiguration({
    required this.clientbonus,
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
