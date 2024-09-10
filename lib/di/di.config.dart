// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/datasources/remote/api_service.dart' as _i903;
import '../data/repository_impl/search_repository_impl.dart' as _i286;
import '../domain/repository/search_repository.dart' as _i259;
import '../presentation/search/location/location_cubit.dart' as _i425;
import '../presentation/search/search_bloc/search_location_cubit.dart' as _i491;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i425.LocationCubit>(() => _i425.LocationCubit());
  gh.lazySingleton<_i903.ApiService>(() => _i903.ApiService());
  gh.factory<_i259.SearchRepository>(() => _i286.SearchRepositoryImpl());
  gh.factory<_i491.SearchCubit>(
      () => _i491.SearchCubit(gh<_i259.SearchRepository>()));
  return getIt;
}
