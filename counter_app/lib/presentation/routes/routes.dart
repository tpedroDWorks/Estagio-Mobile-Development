import 'package:counter_app/presentation/ui/my_home/my_home_page.dart';
import 'package:counter_app/presentation/ui/settings/settings_page.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static const initial = myHome;
  static const myHome = '/myHome';
  static const settingsRoute = settings;
  static const settings = '/settings';

  static Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    myHome: (context) => const MyHomePage(),
    settings: (context) => const SettingsPage(),
  };
}
