part of 'search_location_cubit.dart';

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState({
    @Default(false) bool isLoading,
    @Default('') String error,
    @Default('') String success,
    List<Items>? data,
  }) = _SearchState;
}
