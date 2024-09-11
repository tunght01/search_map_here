import 'package:json_annotation/json_annotation.dart';
import 'package:search_map_nws/domain/entities/location_model.dart';

part 'location_dto.g.dart';

@JsonSerializable()
class ItemsDto extends ItemsModel {
  factory ItemsDto.fromJson(Map<String, dynamic> json) => _$ItemsDtoFromJson(json);

  ItemsDto(this.address, this.highlights, this.id, this.mapView, this.position, this.resultType,
      this.title);

  Map<String, dynamic> toJson() => _$ItemsDtoToJson(this);

  @override
  final AddressDto? address;

  @override
  final String? id;

  @override
  final MapViewDto? mapView;

  @override
  final PositionDto? position;

  @override
  final String? resultType;

  @override
  final String? title;

  @override
  final HighlightsDto? highlights;
}

@JsonSerializable()
class AddressDto extends AddressModel {
  factory AddressDto.fromJson(Map<String, dynamic> json) => _$AddressDtoFromJson(json);

  AddressDto(this.label);

  Map<String, dynamic> toJson() => _$AddressDtoToJson(this);

  @override
  final String? label;
}

@JsonSerializable()
class PositionDto extends PositionModel {
  PositionDto({this.lat, this.lng});

  factory PositionDto.fromJson(Map<String, dynamic> json) => _$PositionDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PositionDtoToJson(this);

  @override
  final double? lat;

  @override
  final double? lng;
}

@JsonSerializable()
class MapViewDto extends MapViewModel {
  MapViewDto({this.west, this.south, this.east, this.north});

  factory MapViewDto.fromJson(Map<String, dynamic> json) => _$MapViewDtoFromJson(json);
  Map<String, dynamic> toJson() => _$MapViewDtoToJson(this);

  @override
  final double? east;

  @override
  final double? north;

  @override
  final double? south;

  @override
  final double? west;
}

@JsonSerializable()
class HighlightsDto extends HighlightsModel {
  HighlightsDto({this.title});

  factory HighlightsDto.fromJson(Map<String, dynamic> json) => _$HighlightsDtoFromJson(json);
  Map<String, dynamic> toJson() => _$HighlightsDtoToJson(this);

  @override
  final List<HighlightItemDto>? title;
}

@JsonSerializable()
class HighlightItemDto extends HighlightItemModel {
  HighlightItemDto({this.start, this.end});

  factory HighlightItemDto.fromJson(Map<String, dynamic> json) => _$HighlightItemDtoFromJson(json);
  Map<String, dynamic> toJson() => _$HighlightItemDtoToJson(this);

  @override
  final int? end;

  @override
  final int? start;
}
