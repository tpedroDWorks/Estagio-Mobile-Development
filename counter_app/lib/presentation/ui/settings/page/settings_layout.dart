import 'package:counter_app/core/l10n/app_localizations.dart';
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
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocListener<SettingsBloc, SettingsState>(
      listener: (context, state) {},
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.settings)),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: l10n.usernameLabel,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.read<SettingsBloc>().add(
                    SaveUsernameSettingsEvent(_textController.text),
                  );
                },
                child: Text(l10n.saveButton),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<SettingsBloc>().add(ClearAllDataSettingsEvent());
                },
                child: Text(l10n.clearDataButton),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
