import 'package:counter_app/core/l10n/app_localizations.dart';
import 'package:counter_app/presentation/routes/routes.dart';
import 'package:counter_app/presentation/ui/my_home/bloc/my_home_bloc.dart';
import 'package:counter_app/presentation/ui/widgets/contador_widget.dart';
import 'package:counter_app/presentation/ui/widgets/reset_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: BlocBuilder<MyHomeBloc, MyHomeState>(
          builder: (context, state) {
            final username = state.username;
            return Text(
              username.isEmpty
                  ? l10n.counterAppTitle
                  : l10n.welcomeMessage(username),
            );
          },
        ),
        leading: IconButton(
          onPressed: () async {
            final bloc = context.read<MyHomeBloc>();
            await GoRouter.of(context).pushNamed(Routes.settings);
            if (context.mounted) {
              bloc.add(LoadUsernameMyHomeEvent());
            }
          },
          icon: const Icon(Icons.settings),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _resetCounter(context);
            },
            icon: const Icon(Icons.restart_alt),
          ),
        ],
      ),
      body: BlocListener<MyHomeBloc, MyHomeState>(
        listener: (context, state) {
          if (state.counter != 0 && state.counter % 10 == 0) {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(l10n.targetReached)));
          }
        },
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onDoubleTap: () =>
              context.read<MyHomeBloc>().add(IncrementCounterMyHomeEvent()),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        l10n.pushedButtonMessage,
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
                      Text(
                        l10n.lastOperations,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Expanded(
                        child: BlocBuilder<MyHomeBloc, MyHomeState>(
                          builder: (context, state) {
                            if (state.operacoes.isEmpty) {
                              return Center(child: Text(l10n.noOperations));
                            }
                            return ListView(
                              children: state.operacoes
                                  .map(
                                    (op) => ListTile(
                                      title: Text(
                                        _translateOperation(op, l10n),
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
              context.read<MyHomeBloc>().add(DecrementCounterMyHomeEvent());
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 5),
          FloatingActionButton(
            heroTag: "inc",
            onPressed: () {
              context.read<MyHomeBloc>().add(IncrementCounterMyHomeEvent());
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  String _translateOperation(String op, AppLocalizations l10n) {
    switch (op) {
      case 'increase':
        return l10n.operationIncrease;
      case 'decrease':
        return l10n.operationDecrease;
      case 'reset':
        return l10n.operationReset;
      default:
        return op;
    }
  }
}
