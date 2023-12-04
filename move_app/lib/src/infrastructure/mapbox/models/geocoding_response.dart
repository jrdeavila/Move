class MapSearchResponse {
  String type;
  List<String> query;
  List<Feature> features;
  String attribution;

  MapSearchResponse({
    required this.type,
    required this.query,
    required this.features,
    required this.attribution,
  });

  factory MapSearchResponse.fromJson(Map<String, dynamic> json) =>
      MapSearchResponse(
        type: json["type"],
        query: List<String>.from(json["query"].map((x) => x)),
        features: List<Feature>.from(
            json["features"].map((x) => Feature.fromJson(x))),
        attribution: json["attribution"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "query": List<dynamic>.from(query.map((x) => x)),
        "features": List<dynamic>.from(features.map((x) => x.toJson())),
        "attribution": attribution,
      };
}

class MapGeocodingResponse {
  String type;
  List<double> query;
  List<Feature> features;
  String attribution;

  MapGeocodingResponse({
    required this.type,
    required this.query,
    required this.features,
    required this.attribution,
  });

  factory MapGeocodingResponse.fromJson(Map<String, dynamic> json) =>
      MapGeocodingResponse(
        type: json["type"],
        query: List<double>.from(json["query"].map((x) => x?.toDouble())),
        features: List<Feature>.from(
            json["features"].map((x) => Feature.fromJson(x))),
        attribution: json["attribution"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "query": List<dynamic>.from(query.map((x) => x)),
        "features": List<dynamic>.from(features.map((x) => x.toJson())),
        "attribution": attribution,
      };
}

class Feature {
  String id;
  String type;
  List<String> placeType;
  int relevance;
  Properties properties;
  String text;
  String placeName;
  List<double> center;
  Geometry geometry;
  List<Context>? context;
  List<double>? bbox;

  Feature({
    required this.id,
    required this.type,
    required this.placeType,
    required this.relevance,
    required this.properties,
    required this.text,
    required this.placeName,
    required this.center,
    required this.geometry,
    this.context,
    this.bbox,
  });

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        id: json["id"],
        type: json["type"],
        placeType: List<String>.from(json["place_type"].map((x) => x)),
        relevance: json["relevance"].toInt(),
        properties: Properties.fromJson(json["properties"]),
        text: json["text"],
        placeName: json["place_name"],
        center: List<double>.from(json["center"].map((x) => x?.toDouble())),
        geometry: Geometry.fromJson(json["geometry"]),
        context: json["context"] == null
            ? []
            : List<Context>.from(
                json["context"]!.map((x) => Context.fromJson(x))),
        bbox: json["bbox"] == null
            ? []
            : List<double>.from(json["bbox"]!.map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "place_type": List<dynamic>.from(placeType.map((x) => x)),
        "relevance": relevance,
        "properties": properties.toJson(),
        "text": text,
        "place_name": placeName,
        "center": List<dynamic>.from(center.map((x) => x)),
        "geometry": geometry.toJson(),
        "context": context == null
            ? []
            : List<dynamic>.from(context!.map((x) => x.toJson())),
        "bbox": bbox == null ? [] : List<dynamic>.from(bbox!.map((x) => x)),
      };
}

class Context {
  String id;
  String mapboxId;
  String text;
  String? wikidata;
  String? shortCode;

  Context({
    required this.id,
    required this.mapboxId,
    required this.text,
    this.wikidata,
    this.shortCode,
  });

  factory Context.fromJson(Map<String, dynamic> json) => Context(
        id: json["id"],
        mapboxId: json["mapbox_id"] ?? "",
        text: json["text"],
        wikidata: json["wikidata"],
        shortCode: json["short_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mapbox_id": mapboxId,
        "text": text,
        "wikidata": wikidata,
        "short_code": shortCode,
      };
}

class Geometry {
  String type;
  List<double> coordinates;

  Geometry({
    required this.type,
    required this.coordinates,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        type: json["type"],
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
      };
}

class Properties {
  String? accuracy;
  String? mapboxId;
  String? wikidata;
  String? shortCode;
  String? address;

  Properties({
    this.accuracy,
    this.mapboxId,
    this.wikidata,
    this.shortCode,
    this.address,
  });

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        accuracy: json["accuracy"],
        mapboxId: json["mapbox_id"],
        wikidata: json["wikidata"],
        shortCode: json["short_code"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "accuracy": accuracy,
        "mapbox_id": mapboxId,
        "wikidata": wikidata,
        "short_code": shortCode,
      };
}
