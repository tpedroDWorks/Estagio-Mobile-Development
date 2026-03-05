import 'package:counter_app/presentation/ui/my_home/page/my_home_page.dart';
import 'package:counter_app/presentation/ui/settings/page/settings_page.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static const myHome = 'myHome';
  static const settings = 'settings';
  static const initial = myHome;

  static Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    myHome: (context) => const MyHomePage(),
    settings: (context) => const SettingsPage(),
  };
}
