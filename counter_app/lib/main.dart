import 'package:counter_app/core/app/my_app.dart';
import 'package:flutter/cupertino.dart';

import 'core/di/app_di.dart';

void main() {
  initInjector();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
