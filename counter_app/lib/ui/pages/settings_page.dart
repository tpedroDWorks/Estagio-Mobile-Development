import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            SizedBox(
              width: 250,
              child: TextField(
                decoration: InputDecoration(labelText: 'Nome de utilizador'),
              ),
            ),
            Row(
              children: [
                // 11.
              ],
            ),
          ],
        ),
      ),
    );
  }
}
