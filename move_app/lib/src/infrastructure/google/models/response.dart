// To parse this JSON data, do
//
//     final googleQueryPlaceResponse = googleQueryPlaceResponseFromJson(jsonString);

import 'dart:convert';

GoogleQueryPlaceResponse googleQueryPlaceResponseFromJson(String str) =>
    GoogleQueryPlaceResponse.fromJson(json.decode(str));

String googleQueryPlaceResponseToJson(GoogleQueryPlaceResponse data) =>
    json.encode(data.toJson());

class GoogleQueryPlaceResponse {
  List<Place> places;

  GoogleQueryPlaceResponse({
    required this.places,
  });

  factory GoogleQueryPlaceResponse.fromJson(Map<String, dynamic> json) =>
      GoogleQueryPlaceResponse(
        places: List<Place>.from(json["places"].map((x) => Place.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "places": List<dynamic>.from(places.map((x) => x.toJson())),
      };
}

class Place {
  String formattedAddress;
  Location location;
  DisplayName displayName;

  Place({
    required this.formattedAddress,
    required this.location,
    required this.displayName,
  });

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        formattedAddress: json["formattedAddress"],
        location: Location.fromJson(json["location"]),
        displayName: DisplayName.fromJson(json["displayName"]),
      );

  Map<String, dynamic> toJson() => {
        "formattedAddress": formattedAddress,
        "location": location.toJson(),
        "displayName": displayName.toJson(),
      };
}

class DisplayName {
  String text;
  String languageCode;

  DisplayName({
    required this.text,
    required this.languageCode,
  });

  factory DisplayName.fromJson(Map<String, dynamic> json) => DisplayName(
        text: json["text"],
        languageCode: json["languageCode"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "languageCode": languageCode,
      };
}

class Location {
  double? latitude;
  double? longitude;

  Location({
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class GoogleGeocodeResponse {
  PlusCode plusCode;
  List<Result> results;
  String status;

  GoogleGeocodeResponse({
    required this.plusCode,
    required this.results,
    required this.status,
  });

  factory GoogleGeocodeResponse.fromJson(Map<String, dynamic> json) =>
      GoogleGeocodeResponse(
        plusCode: PlusCode.fromJson(json["plus_code"]),
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "plus_code": plusCode.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "status": status,
      };
}

class PlusCode {
  String compoundCode;
  String globalCode;

  PlusCode({
    required this.compoundCode,
    required this.globalCode,
  });

  factory PlusCode.fromJson(Map<String, dynamic> json) => PlusCode(
        compoundCode: json["compound_code"] ?? "",
        globalCode: json["global_code"],
      );

  Map<String, dynamic> toJson() => {
        "compound_code": compoundCode,
        "global_code": globalCode,
      };
}

class Result {
  List<AddressComponent> addressComponents;
  String formattedAddress;
  Geometry geometry;
  String placeId;
  PlusCode? plusCode;
  List<String> types;

  Result({
    required this.addressComponents,
    required this.formattedAddress,
    required this.geometry,
    required this.placeId,
    this.plusCode,
    required this.types,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        addressComponents: List<AddressComponent>.from(
            json["address_components"]
                .map((x) => AddressComponent.fromJson(x))),
        formattedAddress: json["formatted_address"],
        geometry: Geometry.fromJson(json["geometry"]),
        placeId: json["place_id"],
        plusCode: json["plus_code"] == null
            ? null
            : PlusCode.fromJson(json["plus_code"]),
        types: List<String>.from(json["types"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "address_components":
            List<dynamic>.from(addressComponents.map((x) => x.toJson())),
        "formatted_address": formattedAddress,
        "geometry": geometry.toJson(),
        "place_id": placeId,
        "plus_code": plusCode?.toJson(),
        "types": List<dynamic>.from(types.map((x) => x)),
      };
}

class AddressComponent {
  String longName;
  String shortName;
  List<String> types;

  AddressComponent({
    required this.longName,
    required this.shortName,
    required this.types,
  });

  factory AddressComponent.fromJson(Map<String, dynamic> json) =>
      AddressComponent(
        longName: json["long_name"],
        shortName: json["short_name"],
        types: List<String>.from(json["types"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "long_name": longName,
        "short_name": shortName,
        "types": List<dynamic>.from(types.map((x) => x)),
      };
}

class Geometry {
  Location location;
  String locationType;
  GeometryViewPort viewport;
  GeometryViewPort? bounds;

  Geometry({
    required this.location,
    required this.locationType,
    required this.viewport,
    this.bounds,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        location: Location.fromJson(json["location"]),
        locationType: json["location_type"],
        viewport: GeometryViewPort.fromJson(json["viewport"]),
        bounds: json["bounds"] == null
            ? null
            : GeometryViewPort.fromJson(json["bounds"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "location_type": locationType,
        "viewport": viewport.toJson(),
        "bounds": bounds?.toJson(),
      };
}

class GeometryViewPort {
  Location northeast;
  Location southwest;

  GeometryViewPort({
    required this.northeast,
    required this.southwest,
  });

  factory GeometryViewPort.fromJson(Map<String, dynamic> json) =>
      GeometryViewPort(
        northeast: Location.fromJson(json["northeast"]),
        southwest: Location.fromJson(json["southwest"]),
      );

  Map<String, dynamic> toJson() => {
        "northeast": northeast.toJson(),
        "southwest": southwest.toJson(),
      };
}
