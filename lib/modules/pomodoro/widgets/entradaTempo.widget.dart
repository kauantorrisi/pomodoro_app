// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ui/pomodoro.store.dart';
import 'botaoEntradaTempo.widget.dart';

class entradaTempoWidget extends StatelessWidget {
  final String title;
  final int value;
  final void Function()? increment;
  final void Function()? decrement;
  Color? color;

  entradaTempoWidget({
    super.key,
    required this.title,
    required this.value,
    required this.color,
    this.increment,
    this.decrement,
  });

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BotaoEntradaTempoWidget(
              icon: Icons.arrow_upward,
              onPressed: increment,
              color: color,
            ),
            Text(
              '$value min',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            BotaoEntradaTempoWidget(
              icon: Icons.arrow_downward,
              onPressed: decrement,
              color: color,
            ),
          ],
        ),
      ],
    );
  }
}
