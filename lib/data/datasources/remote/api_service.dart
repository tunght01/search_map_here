import 'package:injectable/injectable.dart';
import 'package:search_map_nws/data/dto/location_dto.dart';
import 'package:search_map_nws/domain/entities/location_model.dart';
import 'package:search_map_nws/global/network/networking_factory.dart';
import 'package:search_map_nws/global/network/response/base_response_list.dart';
import 'package:search_map_nws/global/network/rest_client.dart';

@lazySingleton
class ApiService extends RestClient {
  ApiService() {
    setDio(url);
  }

  final String _apiKey = 'jhvSfQrFUhCwZprQK6uL69Z9-EmTdCjuhCMD0LFCtr8';
  final String autosuggest = '/autosuggest';
  final String url = 'https://autosuggest.search.hereapi.com/v1';

  void setDio(String url) {
    dio = NetworkingFactory.createDio(baseUrl: url, isDebug: true);
  }

  Future<BaseResponseList<ItemsModel>> searchLocation({
    required String query,
    required String lat,
    required String log,
  }) async {
    try {
      final response = await dio.get(
        autosuggest,
        queryParameters: {
          'q': query,
          'at': '$log,$lat',
          'apiKey': _apiKey,
        },
      );

      return BaseResponseList.fromJson(
        response.data,
        (json) => ItemsDto.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      throw handlerError(e);
    }
  }
}
