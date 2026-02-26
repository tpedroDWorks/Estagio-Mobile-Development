import 'package:counter_app/app/my_app.dart';
import 'package:counter_app/presentation/di/presentation_di.dart';
import 'package:flutter/cupertino.dart';

import '/di/app_di.dart';

void main() {
  initInjector();
  PresentationDi().setUpPresentationDi(injector);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
