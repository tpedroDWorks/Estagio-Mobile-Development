import 'package:counter_app/di/app_di.dart';
import 'package:flutter/material.dart';

import '../core/services/storage_service.dart';
import '../presentation/ui/widgets/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // para usar SharedPreferences
  AppDi();
  StorageService;
  runApp(const MyApp());
}
