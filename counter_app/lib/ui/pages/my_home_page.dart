import 'dart:collection';

import 'package:counter_app/ui/pages/settings_page.dart';
import 'package:flutter/material.dart';

import '../../core/services/storage_service.dart';
import '../widgets/contador_widget.dart';
import '../widgets/reset_dialogue.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final StorageService _storage = StorageService();
  Queue<String> _operacoes = Queue();
  int _counter = 0;
  String _username = 'User';

  @override
  void initState() {
    super.initState();
    _loadInitialCounter();
  }

  void addQ(String value) {
    setState(() {
      _operacoes.addFirst(value);
      if (_operacoes.length > 5) {
        _operacoes.removeLast();
      }
    });
  }

  Future<void> _loadUsername() async {
    String savedUsername = await _storage.getUsername();
    setState(() {
      _username = savedUsername;
    });
  }

  void _updateUsername(String newUsername) async {
    setState(() {
      _username = newUsername;
    });
    _storage.saveName(_username);
  }

  Future<void> _loadInitialCounter() async {
    int savedValue = await _storage.getCounter();
    setState(() {
      _counter = savedValue;
    });
  }

  void _updateCounter(int value) async {
    setState(() {
      _counter = value;
    });
    _storage.saveCounter(_counter);
  }

  void _incrementCounter() {
    _updateCounter(_counter + 1);
    showSnackBar();
    addQ('increment');
  }

  void _decreaseCounter() {
    if (_counter > 0) {
      _updateCounter(_counter - 1);
    }
    showSnackBar();
    addQ('decrease');
  }

  void _resetCounter() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ResetDialogue(
          onConfirm: () {
            _updateCounter(0);
            addQ('reset');
          },
        );
      },
    );
  }

  void showSnackBar() {
    SnackBar snackBar = SnackBar(content: Text('Alvo atingido!'));
    if (_counter % 10 == 0) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Hey $_username!'),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (context) => const SettingsPage(),
              ),
            );
          },
          icon: Icon(Icons.settings),
        ),
        actions: [
          IconButton(
            onPressed: _resetCounter,
            icon: Icon(Icons.restart_alt, color: Colors.black45),
          ),
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            GestureDetector(
              onDoubleTap: () {
                _incrementCounter();
              },
              child: Container(
                width: 500,
                height: 741,
                child: Column(
                  mainAxisAlignment: .center,
                  children: [
                    const Text('You have pushed the button this many times:'),
                    ContadorWidget(counter: _counter),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _operacoes.length,
                        itemBuilder: (BuildContext context, int index) {
                          final operacao = _operacoes.elementAt(index);
                          return ListTile(
                            title: Center(child: Text('$operacao')),
                            dense: true,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: .end,
        spacing: 15,
        children: [
          FloatingActionButton(
            heroTag: "decreaseButton",
            onPressed: _decreaseCounter,
            tooltip: 'Decrease',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            heroTag: "increaseButton",
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
