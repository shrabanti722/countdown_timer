import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/timer_model.dart';

part 'timers_provider.g.dart';

@riverpod
TimerModel timer(
  TimerRef ref, {
  required int id,
}) {
  final timerManager = ref.watch(timerManagerProvider);
  return timerManager[id] ?? const TimerModel(minutes: 1, seconds: 0); 
}

@riverpod
class TimerManager extends _$TimerManager {
  @override
  Map<int, TimerModel> build() {
    return {0: const TimerModel(minutes: 1, seconds: 0)};
  }

  void addTimer() {
    final id = state.length;
    state = {
      ...state,
      id: const TimerModel(minutes: 1, seconds: 0, isRunning: false),
    };
  }

  void updateTimer(int id, TimerModel timer) {
    state = {
      ...state,
      id: timer,
    };
  }

  void removeTimer(int id) {
    state = {...state}..remove(id);
  }
}
