import 'package:flutter/material.dart';

class ContadorWidget extends StatelessWidget {
  const ContadorWidget({super.key, required this.counter});

  final int counter;

  @override
  Widget build(BuildContext context) {
    Color changeFontColor(int counter) {
      if (counter == 0) {
        return Colors.red;
      }
      if (counter > 10) {
        return Colors.green;
      }
      return Colors.black45;
    }

    return Text(
      '$counter',
      style: Theme.of(
        context,
      ).textTheme.headlineMedium?.copyWith(color: changeFontColor(counter)),
    );
  }
}
