import 'package:counter_app/presentation/ui/my_home/bloc/my_home_bloc.dart';
import 'package:counter_app/presentation/ui/widgets/contador_widget.dart';
import 'package:counter_app/presentation/ui/widgets/reset_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomeLayout extends StatelessWidget {
  const MyHomeLayout({super.key});

  void _resetCounter(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return ResetDialogue(
          onConfirm: () {
            context.read<MyHomeBloc>().add(ResetCounterMyHomeEvent());
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<MyHomeBloc>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: BlocBuilder<MyHomeBloc, MyHomeState>(
          builder: (context, state) {
            final username = state.username;
            return Text(username.isEmpty ? 'Counter App' : 'Hey $username');
          },
        ),
        leading: IconButton(
          onPressed: () async {
            await Navigator.pushNamed(context, '/settings');
            homeBloc.add(LoadUsernameMyHomeEvent());
          },
          icon: const Icon(Icons.settings),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _resetCounter(context);
            },
            icon: Icon(Icons.restart_alt),
          ),
        ],
      ),
      body: BlocListener<MyHomeBloc, MyHomeState>(
        listener: (context, state) {
          if (state.counter != 0 && state.counter % 10 == 0) {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Alvo atingido!')));
          }
        },
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onDoubleTap: () => homeBloc.add(IncrementCounterMyHomeEvent()),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: .center,
                    children: [
                      const Text(
                        'You have pushed the button this many times:',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 5),
                      BlocBuilder<MyHomeBloc, MyHomeState>(
                        builder: (context, state) {
                          return ContadorWidget(counter: state.counter);
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        'Últimas 5 operações:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Expanded(
                        child: BlocBuilder<MyHomeBloc, MyHomeState>(
                          builder: (context, state) {
                            if (state.operacoes.isEmpty) {
                              return const Center(
                                child: Text('Sem operações registadas.'),
                              );
                            }
                            return ListView(
                              children: state.operacoes
                                  .map(
                                    (op) => ListTile(
                                      title: Text(
                                        op,
                                        textAlign: TextAlign.center,
                                      ),
                                      dense: true,
                                    ),
                                  )
                                  .toList(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "dec",
            onPressed: () {
              homeBloc.add(DecrementCounterMyHomeEvent());
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 5),
          FloatingActionButton(
            heroTag: "inc",
            onPressed: () {
              homeBloc.add(IncrementCounterMyHomeEvent());
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
