import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/timer_model.dart';

final timersProvider =
    StateNotifierProvider<TimersNotifier, List<TimerModel>>((ref) {
  return TimersNotifier();
});

class TimersNotifier extends StateNotifier<List<TimerModel>> {
  TimersNotifier() : super([const TimerModel(minutes: 1, seconds: 0)]);

  void addTimer() {
    state = [...state, const TimerModel(minutes: 1, seconds: 0)];
  }

  void updateTimer(int index, TimerModel timer) {
    if (index < 0 || index >= state.length) return;
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) timer else state[i]
    ];
  }

  void removeTimer(int index) {
    if (index < 0 || index >= state.length) return;
    state = [
      for (int i = 0; i < state.length; i++)
        if (i != index) state[i]
    ];
  }
}
