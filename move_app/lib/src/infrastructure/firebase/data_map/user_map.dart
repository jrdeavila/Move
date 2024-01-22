import 'package:move_app/lib.dart';

Map<String, dynamic> userToJson(AppUser user) => <String, dynamic>{
      'uuid': user.uuid,
      'firstname': user.firstname,
      'lastname': user.lastname,
      'phone': user.phone,
      'email': user.email,
      'roles': user.roles.map((e) => e.toString().split('.').last).toList(),
    };

AppUser userFromJson(Map<String, dynamic> json) => AppUser(
      uuid: json['uuid'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      roles: (json['roles'] as List<dynamic>)
          .map((e) => AppUserRole.values.firstWhere(
                (element) => element.toString().split('.').last == e,
              ))
          .toList(),
      driverInfo: json['driver_info'] != null
          ? DriverInfo(
              carBrand: (json['driver_info']['card_brand'] as String).trim(),
              carPlate: (json['driver_info']['card_plate'] as String).trim(),
              carImage: (json['driver_info']['card_image'] as String).trim(),
              carModel: (json['driver_info']['card_model'] as String).trim(),
            )
          : null,
    );
