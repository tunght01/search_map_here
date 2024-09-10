// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      title: json['title'] as String?,
      id: json['id'] as String?,
      resultType: json['resultType'] as String?,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      position: json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>),
      mapView: json['mapView'] == null
          ? null
          : MapView.fromJson(json['mapView'] as Map<String, dynamic>),
      highlights: json['highlights'] == null
          ? null
          : Highlights.fromJson(json['highlights'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'resultType': instance.resultType,
      'address': instance.address,
      'position': instance.position,
      'mapView': instance.mapView,
      'highlights': instance.highlights,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      label: json['label'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'label': instance.label,
    };

Position _$PositionFromJson(Map<String, dynamic> json) => Position(
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PositionToJson(Position instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

MapView _$MapViewFromJson(Map<String, dynamic> json) => MapView(
      west: (json['west'] as num?)?.toDouble(),
      south: (json['south'] as num?)?.toDouble(),
      east: (json['east'] as num?)?.toDouble(),
      north: (json['north'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MapViewToJson(MapView instance) => <String, dynamic>{
      'west': instance.west,
      'south': instance.south,
      'east': instance.east,
      'north': instance.north,
    };

Highlights _$HighlightsFromJson(Map<String, dynamic> json) => Highlights(
      title: (json['title'] as List<dynamic>?)
          ?.map((e) => HighlightItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HighlightsToJson(Highlights instance) =>
    <String, dynamic>{
      'title': instance.title,
    };

HighlightItem _$HighlightItemFromJson(Map<String, dynamic> json) =>
    HighlightItem(
      start: (json['start'] as num?)?.toInt(),
      end: (json['end'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HighlightItemToJson(HighlightItem instance) =>
    <String, dynamic>{
      'start': instance.start,
      'end': instance.end,
    };
