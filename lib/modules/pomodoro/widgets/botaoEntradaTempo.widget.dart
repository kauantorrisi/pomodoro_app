// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class BotaoEntradaTempoWidget extends StatelessWidget {
  final IconData icon;
  void Function()? onPressed;
  Color? color;

  BotaoEntradaTempoWidget({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(15),
        backgroundColor: color,
      ),
      onPressed: onPressed,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
