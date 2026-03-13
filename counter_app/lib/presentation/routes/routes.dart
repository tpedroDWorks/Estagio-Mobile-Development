import 'package:counter_app/presentation/ui/my_home/page/my_home_page.dart';
import 'package:counter_app/presentation/ui/settings/page/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

sealed class Routes {
  static const myHome = 'myHome';
  static const settings = 'settings';
  static const initial = myHome;

  static List<RouteBase> routes = [
    GoRoute(
      name: myHome,
      path: "/$myHome",
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: MyHomePage()),
      routes: [
        GoRoute(
          name: settings,
          path: settings,
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: SettingsPage()),
        ),
      ],
    ),
  ];

  static final GoRouter router = GoRouter(
    errorBuilder: (context, state) {
      return Scaffold(backgroundColor: Colors.red, body: Container());
    },
    initialLocation: "/$initial",
    routes: routes,
  );
}
