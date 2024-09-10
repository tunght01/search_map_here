import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_map_nws/di/di.dart';
import 'package:search_map_nws/presentation/search/location/location_cubit.dart';
import 'package:search_map_nws/presentation/search/search_bloc/search_location_cubit.dart';

import 'widget/search_item.dart';

class SearchLocationPage extends StatefulWidget {
  const SearchLocationPage({super.key});

  @override
  SearchLocationPageState createState() => SearchLocationPageState();
}

class SearchLocationPageState extends State<SearchLocationPage> {
  late TextEditingController _searchController;
  final SearchCubit _searchCubit = getIt.get<SearchCubit>();
  final locationCubit = getIt.get<LocationCubit>();
  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    locationCubit.determinePosition();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      bloc: _searchCubit,
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: TextFormField(
                    controller: _searchController,
                    onChanged: (value) {
                      _searchCubit.searchProductByName(
                        value,
                        locationCubit.state.currentPosition?.longitude.toString() ?? '0.0',
                        locationCubit.state.currentPosition?.latitude.toString() ?? '0.0',
                      );
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter keyword',
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      prefixIcon: state.isLoading
                          ? Transform.scale(
                              scale: 0.5,
                              child: const CircularProgressIndicator(),
                            )
                          : const Icon(Icons.search, color: Colors.black),
                      suffixIcon: _searchController.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear, color: Colors.black),
                              onPressed: () {
                                _searchController.clear();
                                _searchCubit.clearSearch();
                              },
                            )
                          : null,
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                          color: Colors.grey[300]!,
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.search,
                  ),
                ),
                Expanded(
                  child: state.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : state.error.isNotEmpty
                          ? Center(
                              child: Text(state.error),
                            )
                          : state.data != null && state.data!.isNotEmpty
                              ? ListView.separated(
                                  itemCount: state.data!.length,
                                  itemBuilder: (context, index) {
                                    return SearchItem(
                                      data: state.data![index],
                                      onTap: () {
                                        _searchCubit.openGoogleMap(
                                            state.data![index].position!.lat!.toDouble(),
                                            state.data![index].position!.lng!.toDouble());
                                      },
                                    );
                                  },
                                  separatorBuilder: (context, index) => const Divider(
                                    color: Color(0xffe4e4e4),
                                    height: 1,
                                  ),
                                )
                              : const Center(
                                  child: Text('Vui lòng nhập địa chỉ!'),
                                ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
