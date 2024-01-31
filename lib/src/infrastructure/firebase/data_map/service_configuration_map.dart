import 'package:mevo/lib.dart';

ServiceConfiguration serviceConfigurationFromJson(Map<String, dynamic> json) =>
    ServiceConfiguration(
      clientbonus: json["client_bonus"],
      driverPaymentPercentage: json["driver_payment_percentage"],
      commonOfferts: List<ServiceCommonOffert>.from(
          (json["service_common_offert"] as List<dynamic>?)
                  ?.map((x) => serviceCommonOffertFromJson(x)) ??
              []),
    );

ServiceCommonOffert serviceCommonOffertFromJson(Map<String, dynamic> json) =>
    ServiceCommonOffert(
      offert: json["offert"].toDouble(),
      uses: json["uses"] as int,
    );
