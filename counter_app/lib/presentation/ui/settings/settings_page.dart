import 'package:flutter/material.dart';

import '../../../core/services/storage_service.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _textController = TextEditingController();
  final StorageService _storage = StorageService();
  String _username = '';

  void _loadCurrentName() async {
    String name = await _storage.getUsername();
    _textController.text = name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Nome de utilizador',
              ),
              controller: _textController,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await _storage.saveName(_textController.text);
                    if (mounted) Navigator.pop(context);
                  },
                  child: const Text('Guardar'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade100,
                  ),
                  onPressed: () async {
                    await _storage.clearAll();
                    _textController.clear();
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Dados limpos!")),
                      );
                    }
                  },
                  child: const Text('Limpar tudo'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
