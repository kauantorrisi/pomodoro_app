import 'package:flutter/material.dart';
import 'package:pomodoro_app/views/Pomodoro/pomodoro.view.dart';
import 'package:pomodoro_app/views/Pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

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
        home: PomodoroView(),
      ),
    );
  }
}
