import 'package:counter_app/core/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResetDialogue extends StatelessWidget {
  final VoidCallback onConfirm;

  const ResetDialogue({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

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
