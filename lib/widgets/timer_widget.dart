import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../models/timer_model.dart';
import '../providers/timers_provider.dart';

class TimerWidget extends HookConsumerWidget {
  final int index;

  const TimerWidget({required this.index, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timer = ref.watch(timersProvider)[index];
    final notifier = ref.read(timersProvider.notifier);

    useEffect(() {
      Timer? ticker;
      if (timer.isRunning) {
        ticker = Timer.periodic(const Duration(seconds: 1), (timerInstance) {
          final currentTimer = ref.read(timersProvider)[index];
          if (currentTimer.seconds > 0) {
            notifier.updateTimer(
              index,
              currentTimer.copyWith(seconds: currentTimer.seconds - 1),
            );
          } else if (currentTimer.minutes > 0) {
            notifier.updateTimer(
              index,
              currentTimer.copyWith(
                minutes: currentTimer.minutes - 1,
                seconds: 59,
              ),
            );
          } else {
            notifier.updateTimer(
              index,
              currentTimer.copyWith(isRunning: false),
            );
            ticker?.cancel();
          }
        });
      }
      return () => ticker?.cancel();
    }, [timer.isRunning, timer.minutes, timer.seconds]);

    void handleMinutesSwipe(DragUpdateDetails details) {
      if (details.primaryDelta == null) return;
      if (details.primaryDelta! < 0) {
        notifier.updateTimer(
          index,
          timer.copyWith(minutes: timer.minutes + 1),
        );
      } else if (details.primaryDelta! > 0 && timer.minutes > 0) {
        notifier.updateTimer(
          index,
          timer.copyWith(minutes: timer.minutes - 1),
        );
      }
    }

    void handleSecondsSwipe(DragUpdateDetails details) {
      if (details.primaryDelta == null) return;
      if (details.primaryDelta! < 0) {
        notifier.updateTimer(
          index,
          timer.copyWith(seconds: (timer.seconds + 1) % 60),
        );
      } else if (details.primaryDelta! > 0 && timer.seconds > 0) {
        notifier.updateTimer(
          index,
          timer.copyWith(seconds: timer.seconds - 1),
        );
      }
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onVerticalDragUpdate: handleMinutesSwipe,
                child: Text(
                  timer.minutes.toString().padLeft(2, '0'),
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              const Text(
                ':',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onVerticalDragUpdate: handleSecondsSwipe,
                child: Text(
                  timer.seconds.toString().padLeft(2, '0'),
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              notifier.updateTimer(
                index,
                timer.copyWith(isRunning: !timer.isRunning),
              );
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(40),
            ),
            child: Text(timer.isRunning ? 'Pause' : 'Start'),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 300.ms);
  }
}
