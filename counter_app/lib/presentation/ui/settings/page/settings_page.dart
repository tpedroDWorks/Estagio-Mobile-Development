import 'package:counter_app/presentation/ui/settings/bloc/settings_bloc.dart';
import 'package:counter_app/presentation/ui/settings/page/settings_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetIt.instance<SettingsBloc>()..add(LoadSettingsEvent()),
      child: const SettingsLayout(),
    );
  }
}
