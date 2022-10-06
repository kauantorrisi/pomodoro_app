import 'package:mobx/mobx.dart';
part 'pomodoro.store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

enum IntervalType {
  work,
  rest,
}

abstract class _PomodoroStore with Store {
  @observable
  bool initiated = false;
  @observable
  int minutes = 2;
  @observable
  int seconds = 0;
  @observable
  int workTime = 2;
  @observable
  int restTime = 1;
  @observable
  IntervalType intervalType = IntervalType.rest;

  @action
  void start() {
    initiated = true;
  }

  @action
  void stop() {
    initiated = false;
  }

  @action
  void restart() {
    initiated = false;
  }

  @action
  void incrementTimeWork() {
    workTime++;
  }

  @action
  void decrementTimeWork() {
    if (workTime == 0) {
      return;
    } else {
      workTime--;
    }
  }

  @action
  void incrementTimeRest() {
    restTime++;
  }

  @action
  void decrementTimeRest() {
    if (restTime == 0) {
      return;
    } else {
      restTime--;
    }
  }

  bool isWorking() {
    return intervalType == IntervalType.work;
  }

  bool isResting() {
    return intervalType == IntervalType.rest;
  }
}
