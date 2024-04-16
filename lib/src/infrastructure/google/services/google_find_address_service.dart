import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mevo/lib.dart';

@Injectable(as: IGetAddressByGeopointService)
class GoogleGetAddressByGeopointService
    implements IGetAddressByGeopointService {
  final Dio _dio;
  CancelToken? cancelToken;

  GoogleGetAddressByGeopointService(this._dio);

  @override
  Future<TravelPoint> getAddress(
      {required double latitude, required double longitude}) {
    if (cancelToken != null) {
      cancelToken!.cancel();
    }
    cancelToken = CancelToken();
    return _dio.get("https://maps.googleapis.com/maps/api/geocode/json",
        queryParameters: {
          "latlng": "$latitude,$longitude",
          "key": googleMapsApiKey,
        }).then((value) {
      final response = GoogleGeocodeResponse.fromJson(value.data);
      var first = response.results.firstOrNull;
      return TravelPoint(
        name: first?.formattedAddress ?? "Unknown Address",
        address: first?.formattedAddress ?? "Unknown Address",
        latitude: first?.geometry.location.latitude ?? latitude,
        longitude: first?.geometry.location.longitude ?? longitude,
      );
    });
  }
}

@Injectable(as: IGetAddressByQueryService)
class GoogleFindAddressService implements IGetAddressByQueryService {
  final Dio _dio;
  CancelToken? cancelToken;

  GoogleFindAddressService(this._dio);
  @override
  Future<List<TravelPoint>> getAddresses(
    String query, {
    double? latitudeRef,
    double? longitudeRef,
  }) {
    if (query.isEmpty) return Future.value([]);
    if (query.length < 3) return Future.value([]);
    if (cancelToken != null) {
      cancelToken!.cancel();
    }
    cancelToken = CancelToken();
    return _dio
        .post(
      "https://places.googleapis.com/v1/places:searchText",
      data: {
        "textQuery": query,
        "languageCode": "es",
        "maxResultCount": 10,
        if (latitudeRef != null && longitudeRef != null)
          "locationBias": {
            "circle": {
              "center": {
                "latitude": latitudeRef,
                "longitude": longitudeRef,
              },
            },
          },
      },
      cancelToken: cancelToken,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "X-Goog-Api-Key": googleMapsApiKey,
          "X-Goog-FieldMask":
              "places.formattedAddress,places.displayName,places.priceLevel,places.location"
        },
      ),
    )
        .then((value) {
      final response = GoogleQueryPlaceResponse.fromJson(value.data);
      return response.places
          .where((element) =>
              element.location.latitude != null &&
              element.location.longitude != null)
          .map(
            (e) => TravelPoint(
              name: e.displayName.text,
              address: e.formattedAddress,
              latitude: e.location.latitude!,
              longitude: e.location.longitude!,
            ),
          )
          .toList();
    });
  }
}
