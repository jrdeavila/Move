import 'package:mevo/lib.dart';

ServiceConfiguration serviceConfigurationFromJson(Map<String, dynamic> json) =>
    ServiceConfiguration(
      quotaOfPointsForBonus: json["quota_of_point"] as int,
      clientbonus: json["client_bonification"] as int,
      driverPaymentPercentage: json["driver_payment_percentage"] as double,
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
