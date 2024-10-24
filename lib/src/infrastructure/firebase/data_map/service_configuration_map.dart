import 'package:move_app/lib.dart';

ServiceConfiguration serviceConfigurationFromJson(Map<String, dynamic> json) =>
    ServiceConfiguration(
      clientBonus: json["client_bonification"],
      driverPaymentPercentage: json["driver_payment_percentage"],
      commonOffers: List<ServiceCommonOffer>.from(
          (json["service_common_offert"] as List<dynamic>?)
                  ?.map((x) => serviceCommonOffertFromJson(x)) ??
              []),
    );

ServiceCommonOffer serviceCommonOffertFromJson(Map<String, dynamic> json) =>
    ServiceCommonOffer(
      offer: json["offert"].toDouble(),
      uses: json["uses"] as int,
    );
