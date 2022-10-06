import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../ui/pomodoro.store.dart';
import 'botaoCronometro.widget.dart';

class CronometroWidget extends StatelessWidget {
  const CronometroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Container(
      color: store.isWorking() ? Colors.red : Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            store.isWorking() ? 'Hora de Trabalhar' : 'Hora de Descansar',
            style: const TextStyle(
              fontSize: 40,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            '${store.minutes.toString().padLeft(2, '0')}:${store.seconds.toString().padLeft(2, '0')}',
            style: const TextStyle(
              fontSize: 120,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Observer(builder: (_) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!store.initiated)
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: BotaoCronometroWidget(
                      text: 'Iniciar',
                      icon: Icons.play_arrow,
                      onPressed: () => store.start(),
                    ),
                  ),
                if (store.initiated)
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: BotaoCronometroWidget(
                      text: 'Parar',
                      icon: Icons.stop,
                      onPressed: () => store.stop(),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: BotaoCronometroWidget(
                    text: 'Reiniciar',
                    icon: Icons.refresh,
                    onPressed: () => store.restart(),
                  ),
                ),
              ],
            );
          })
        ],
      ),
    );
  }
}
