import 'dart:collection';

import 'package:flutter/material.dart';

import '../widgets/contador_widget.dart';
import '../widgets/reset_dialogue.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Queue<String> _operacoes = Queue();
  int _counter = 0;

  void addQ(String value) {
    setState(() {
      _operacoes.addFirst(value);
      if (_operacoes.length > 5) {
        _operacoes.removeLast();
      }
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    showSnackBar();
    addQ('increment');
  }

  void _decreaseCounter() {
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
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
            setState(() {
              _counter = 0;
            });
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
        title: Text(widget.title),
        leading: Icon(Icons.home, color: Colors.black45, size: 26),
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
            onPressed: _decreaseCounter,
            tooltip: 'Decrease',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
