import 'package:flutter/material.dart';

class ResetDialogue extends StatelessWidget {
  final VoidCallback onConfirm;

  const ResetDialogue({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirmação'),
      content: const Text('Tem a certeza?'),
      actions: [
        TextButton(
          child: const Text('Não'),
          onPressed: () {
            Navigator.of(context).pop(); // Fechar janela
          },
        ),
        TextButton(
          child: const Text('Sim'),
          onPressed: () {
            onConfirm();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
