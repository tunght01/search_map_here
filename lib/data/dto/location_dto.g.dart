// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemsDto _$ItemsDtoFromJson(Map<String, dynamic> json) => ItemsDto(
      json['address'] == null
          ? null
          : AddressDto.fromJson(json['address'] as Map<String, dynamic>),
      json['highlights'] == null
          ? null
          : HighlightsDto.fromJson(json['highlights'] as Map<String, dynamic>),
      json['id'] as String?,
      json['mapView'] == null
          ? null
          : MapViewDto.fromJson(json['mapView'] as Map<String, dynamic>),
      json['position'] == null
          ? null
          : PositionDto.fromJson(json['position'] as Map<String, dynamic>),
      json['resultType'] as String?,
      json['title'] as String?,
    );

Map<String, dynamic> _$ItemsDtoToJson(ItemsDto instance) => <String, dynamic>{
      'address': instance.address,
      'id': instance.id,
      'mapView': instance.mapView,
      'position': instance.position,
      'resultType': instance.resultType,
      'title': instance.title,
      'highlights': instance.highlights,
    };

AddressDto _$AddressDtoFromJson(Map<String, dynamic> json) => AddressDto(
      json['label'] as String?,
    );

Map<String, dynamic> _$AddressDtoToJson(AddressDto instance) =>
    <String, dynamic>{
      'label': instance.label,
    };

PositionDto _$PositionDtoFromJson(Map<String, dynamic> json) => PositionDto(
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PositionDtoToJson(PositionDto instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

MapViewDto _$MapViewDtoFromJson(Map<String, dynamic> json) => MapViewDto(
      west: (json['west'] as num?)?.toDouble(),
      south: (json['south'] as num?)?.toDouble(),
      east: (json['east'] as num?)?.toDouble(),
      north: (json['north'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MapViewDtoToJson(MapViewDto instance) =>
    <String, dynamic>{
      'east': instance.east,
      'north': instance.north,
      'south': instance.south,
      'west': instance.west,
    };

HighlightsDto _$HighlightsDtoFromJson(Map<String, dynamic> json) =>
    HighlightsDto(
      title: (json['title'] as List<dynamic>?)
          ?.map((e) => HighlightItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HighlightsDtoToJson(HighlightsDto instance) =>
    <String, dynamic>{
      'title': instance.title,
    };

HighlightItemDto _$HighlightItemDtoFromJson(Map<String, dynamic> json) =>
    HighlightItemDto(
      start: (json['start'] as num?)?.toInt(),
      end: (json['end'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HighlightItemDtoToJson(HighlightItemDto instance) =>
    <String, dynamic>{
      'end': instance.end,
      'start': instance.start,
    };
