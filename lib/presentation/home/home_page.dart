import 'package:flutter/material.dart';
import 'package:search_map_nws/presentation/search/search_location_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchLocationPage(),
    );
  }
}
