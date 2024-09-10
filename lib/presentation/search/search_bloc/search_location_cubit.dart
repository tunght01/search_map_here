import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:search_map_nws/data/dto/location_dto.dart';
import 'package:search_map_nws/domain/repository/search_repository.dart';
import 'package:url_launcher/url_launcher.dart';

part 'search_location_cubit.freezed.dart';
part 'search_location_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  final SearchRepository _searchRepository;

  SearchCubit(this._searchRepository) : super(const SearchState());

  Timer? _debounce;

  Future<void> searchProductByName(String query, String lat, String log) async {
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(const Duration(seconds: 1), () async {
      if (query.isEmpty) {
        emit(
          const SearchState(
            data: [],
          ),
        );
        return;
      }

      emit(const SearchState(isLoading: true));

      try {
        final response = await _searchRepository.searchLocation(query, lat, log);
        if (response != null) {
          emit(SearchState(data: response.items));
        } else {
          emit(
            const SearchState(
              data: [],
            ),
          );
        }
      } catch (e) {
        emit(
          SearchState(
            error: e.toString(),
          ),
        );
      }
    });
  }

  Future<void> clearSearch() async {
    emit(
      const SearchState(data: [], error: '', isLoading: false),
    );
  }

  Future<void> openGoogleMap(double lat, double long) async {
    final Uri url = Uri.parse('https://maps.google.com/?q=$lat,$long');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
