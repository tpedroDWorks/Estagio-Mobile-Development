import 'package:counter_app/presentation/ui/my_home/bloc/my_home_bloc.dart';
import 'package:counter_app/presentation/ui/my_home/my_home_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetIt.instance<MyHomeBloc>()..add(const LoadMyHomeEvent()),
      child: const MyHomeLayout(),
    );
  }
}
