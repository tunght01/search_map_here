// lib/data/repositories/search_repository_impl.dart
import 'package:injectable/injectable.dart';
import 'package:search_map_nws/data/datasources/remote/api_service.dart';
import 'package:search_map_nws/di/di.dart';
import 'package:search_map_nws/domain/entities/location_model.dart';
import 'package:search_map_nws/global/network/response/base_response_list.dart';

import '../../domain/repository/search_repository.dart';

@Injectable(as: SearchRepository)
class SearchRepositoryImpl implements SearchRepository {
  final ApiService _apiService = getIt.get();

  @override
  Future<BaseResponseList<ItemsModel>?> searchLocation(String query, String lat, String log) {
    return _apiService.searchLocation(query: query, lat: lat, log: log);
  }
}
