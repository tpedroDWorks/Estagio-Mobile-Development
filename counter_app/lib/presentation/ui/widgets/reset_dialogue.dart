import 'package:counter_app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResetDialogue extends StatelessWidget {
  final VoidCallback onConfirm;

  const ResetDialogue({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    final l10n = context.localizations;

    return AlertDialog(
      title: Text(l10n.resetCounterTitle),
      content: Text(l10n.resetCounterMessage),
      actions: [
        TextButton(
          child: Text(l10n.cancel),
          onPressed: () {
            context.pop();
          },
        ),
        TextButton(
          child: Text(l10n.confirm),
          onPressed: () {
            onConfirm();
            context.pop();
          },
        ),
      ],
    );
  }
}
