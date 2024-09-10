import 'package:json_annotation/json_annotation.dart';

part 'location_dto.g.dart';

@JsonSerializable()
class Items {
  final String? title;
  final String? id;
  final String? resultType;
  final Address? address;
  final Position? position;
  final MapView? mapView;
  final Highlights? highlights;

  Items({
    this.title,
    this.id,
    this.resultType,
    this.address,
    this.position,
    this.mapView,
    this.highlights,
  });

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);
  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}

@JsonSerializable()
class Address {
  final String? label;

  Address({this.label});

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable()
class Position {
  final double? lat;
  final double? lng;

  Position({this.lat, this.lng});

  factory Position.fromJson(Map<String, dynamic> json) => _$PositionFromJson(json);
  Map<String, dynamic> toJson() => _$PositionToJson(this);
}

@JsonSerializable()
class MapView {
  final double? west;
  final double? south;
  final double? east;
  final double? north;

  MapView({this.west, this.south, this.east, this.north});

  factory MapView.fromJson(Map<String, dynamic> json) => _$MapViewFromJson(json);
  Map<String, dynamic> toJson() => _$MapViewToJson(this);
}

@JsonSerializable()
class Highlights {
  final List<HighlightItem>? title;

  Highlights({this.title});

  factory Highlights.fromJson(Map<String, dynamic> json) => _$HighlightsFromJson(json);
  Map<String, dynamic> toJson() => _$HighlightsToJson(this);
}

@JsonSerializable()
class HighlightItem {
  final int? start;
  final int? end;

  HighlightItem({this.start, this.end});

  factory HighlightItem.fromJson(Map<String, dynamic> json) => _$HighlightItemFromJson(json);
  Map<String, dynamic> toJson() => _$HighlightItemToJson(this);
}
