import 'package:move_app/lib.dart';

ServiceConfiguration serviceConfigurationFromJson(Map<String, dynamic> json) =>
    ServiceConfiguration(
      clientBonification: json["client_bonification"],
      driverPaymentPercentage: json["driver_payment_percentage"],
    );
