import 'package:counter_app/presentation/ui/my_home/my_home_layout.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.indigo)),
      home: const MyHomeLayout(title: 'Home Page'),
    );
  }
}
