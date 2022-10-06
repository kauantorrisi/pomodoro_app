import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'modules/pomodoro/ui/pomodoro.store.dart';
import 'modules/pomodoro/ui/pomodoro.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PomodoroStore>(
          create: ((context) => PomodoroStore()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pomodoro Timer',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PomodoroPage(),
      ),
    );
  }
}
