import 'package:flutter/material.dart';

import '../../core/services/storage_service.dart';
import '../widgets/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // para usar SharedPreferences
  await StorageService;
  runApp(const MyApp());
}
