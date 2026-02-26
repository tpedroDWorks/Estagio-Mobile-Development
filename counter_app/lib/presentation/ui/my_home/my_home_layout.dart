import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../settings/settings_page.dart';
import '../widgets/contador_widget.dart';
import 'bloc/my_home_bloc.dart';

class MyHomeLayout extends StatelessWidget {
  const MyHomeLayout({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    // 1. Obtemos a referência do Bloc uma única vez
    final homeBloc = context.read<MyHomeBloc>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: BlocBuilder<MyHomeBloc, MyHomeState>(
          builder: (context, state) {
            // 2. Usamos o 'state' para decidir o que mostrar
            final username = state.username;
            return Text(username.isEmpty ? 'Counter App' : 'Hey $username');
          },
        ),
        leading: IconButton(
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingsPage()),
            );
            homeBloc.add(LoadUsernameMyHomeEvent());
          },
          icon: const Icon(Icons.settings),
        ),
      ),
      body: BlocListener<MyHomeBloc, MyHomeState>(
        // 3. Listener para efeitos secundários (como a SnackBar)
        listener: (context, state) {
          if (state.counter != 0 && state.counter % 10 == 0) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Alvo atingido!')));
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onDoubleTap: () => homeBloc.add(IncrementCounterMyHomeEvent()),
                child: Column(
                  children: [
                    const Text('You have pushed the button this many times:'),
                    BlocBuilder<MyHomeBloc, MyHomeState>(
                      builder: (context, state) {
                        // 4. Acedemos ao valor diretamente do estado
                        return ContadorWidget(counter: state.counter);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "dec",
            onPressed: () => homeBloc.add(DecrementCounterMyHomeEvent()),
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 15),
          FloatingActionButton(
            heroTag: "inc",
            onPressed: () => homeBloc.add(IncrementCounterMyHomeEvent()),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
