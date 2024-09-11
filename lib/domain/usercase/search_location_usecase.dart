import 'package:injectable/injectable.dart';
import 'package:search_map_nws/domain/entities/location_model.dart';
import 'package:search_map_nws/domain/repository/search_repository.dart';
import 'package:search_map_nws/global/network/response/base_response_list.dart';

@injectable
class SearchLocationUseCase {
  final SearchRepository _searchRepository;

  SearchLocationUseCase(this._searchRepository);

  Future<BaseResponseList<ItemsModel>?> searchLocation(String query, String lat, String log) {
    return _searchRepository.searchLocation(query, lat, log);
  }
}
