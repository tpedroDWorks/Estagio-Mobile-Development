import 'package:counter_app/presentation/ui/settings/bloc/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsLayout extends StatefulWidget {
  const SettingsLayout({super.key});

  @override
  State<SettingsLayout> createState() => _SettingsLayoutState();
}

class _SettingsLayoutState extends State<SettingsLayout> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsBloc, SettingsState>(
      listener: (context, state) {
        _textController.text = state.username;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Settings')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _textController,
                decoration: const InputDecoration(
                  labelText: 'Nome de utilizador',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.read<SettingsBloc>().add(
                    SaveUsernameSettingsEvent(_textController.text),
                  );
                },
                child: Text('Guardar'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<SettingsBloc>().add(ClearAllDataSettingsEvent());
                },
                child: const Text('Limpar dados'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
