import 'package:dio/dio.dart';
import 'package:move_app/lib.dart';
import 'package:move_app/src/infrastructure/mapbox/mapbox.dart';

// @Injectable(as: IGetAddressByGeopointService)
class MapBoxGetAddressByGeopointService
    implements IGetAddressByGeopointService {
  final Dio _dio;

  CancelToken? _cancelToken;

  MapBoxGetAddressByGeopointService(this._dio);

  @override
  Future<TravelPoint> getAddress({
    required double latitude,
    required double longitude,
    String? token,
  }) {
    if (_cancelToken != null) {
      _cancelToken?.cancel();
    }
    _cancelToken = CancelToken();
    return _dio.get(
        "https://api.mapbox.com/geocoding/v5/mapbox.places/$longitude,$latitude.json",
        cancelToken: _cancelToken,
        queryParameters: {
          "access_token": token ?? mapsToken,
        }).then((value) {
      final response = MapGeocodingResponse.fromJson(value.data);
      return TravelPoint(
        name: response.features[0].text,
        address: response.features[0].properties.address ??
            response.features[0].placeName,
        latitude: latitude,
        longitude: longitude,
      );
    });
  }
}

// @Injectable(as: IGetAddressByQueryService)
class MapBoxGetAddressesByQueryService implements IGetAddressByQueryService {
  final Dio _dio;
  CancelToken? _cancelToken;

  MapBoxGetAddressesByQueryService(this._dio);

  @override
  Future<List<TravelPoint>> getAddresses(
    String query, {
    double? latitudeRef,
    double? longitudeRef,
  }) {
    if (_cancelToken != null) {
      _cancelToken?.cancel();
    }
    _cancelToken = CancelToken();
    return _dio
        .get(
      "https://api.mapbox.com/geocoding/v5/mapbox.places/$query.json",
      queryParameters: {
        "q": query,
        "access_token": mapsToken,
      },
      cancelToken: _cancelToken,
    )
        .then((value) {
      final response = MapSearchResponse.fromJson(value.data);
      return response.features
          .map((e) => TravelPoint(
                name: e.text,
                address: e.properties.address ?? e.placeName,
                latitude: e.center[1],
                longitude: e.center[0],
              ))
          .toList();
    });
  }
}
