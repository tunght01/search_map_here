import 'package:search_map_nws/data/dto/location_dto.dart';
import 'package:search_map_nws/global/network/response/base_response_list.dart';

abstract class SearchRepository {
  Future<BaseResponseList<Items>?> searchLocation(String query, String lat, String log);
}
