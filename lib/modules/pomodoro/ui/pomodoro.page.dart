import '../pomodoro.imports.dart';

class PomodoroPage extends StatelessWidget {
  const PomodoroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: CronometroWidget(),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Observer(
                builder: (_) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      entradaTempoWidget(
                        title: 'Trabalho',
                        value: store.workTime,
                        increment: () => store.incrementTimeWork(),
                        decrement: () => store.decrementTimeWork(),
                        color: store.isWorking() ? Colors.red : Colors.green,
                      ),
                      entradaTempoWidget(
                        title: 'Descanso',
                        value: store.restTime,
                        increment: () => store.incrementTimeRest(),
                        decrement: () => store.decrementTimeRest(),
                        color: store.isWorking() ? Colors.red : Colors.green,
                      ),
                    ],
                  );
                },
              ))
        ],
      ),
    );
  }
}
