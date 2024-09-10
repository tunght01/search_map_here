import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'di/di.dart';
import 'presentation/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(environment: Environment.dev);
  runApp(const HomePage());
}
