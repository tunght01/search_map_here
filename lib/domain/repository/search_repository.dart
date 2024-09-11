import 'package:search_map_nws/domain/entities/location_model.dart';
import 'package:search_map_nws/global/network/response/base_response_list.dart';

abstract class SearchRepository {
  Future<BaseResponseList<ItemsModel>?> searchLocation(String query, String lat, String log);
}
