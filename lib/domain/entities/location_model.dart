abstract class ItemsModel {
  String? get title;
  String? get id;
  String? get resultType;
  AddressModel? get address;
  PositionModel? get position;
  MapViewModel? get mapView;
  HighlightsModel? get highlights;
}

abstract class AddressModel {
  String? get label;
}

abstract class PositionModel {
  double? get lat;
  double? get lng;
}

abstract class MapViewModel {
  double? get west;
  double? get south;
  double? get east;
  double? get north;
}

abstract class HighlightsModel {
  List<HighlightItemModel>? get title;
}

abstract class HighlightItemModel {
  int? get start;
  int? get end;
}
