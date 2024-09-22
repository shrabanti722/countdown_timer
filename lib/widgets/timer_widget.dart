import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/timer_model.dart';
import '../providers/timers_provider.dart';

class TimerWidget extends HookConsumerWidget {
  final int id;

  const TimerWidget({required this.id, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timer = ref.watch(timerProvider(id: id));
    final timerManager = ref.read(timerManagerProvider.notifier);

    useEffect(() {
      Timer? ticker;
      if (timer.isRunning) {
        ticker = Timer.periodic(const Duration(seconds: 1), (timerInstance) {
          if (timer.seconds > 0) {
            timerManager.updateTimer(id, timer.copyWith(seconds: timer.seconds - 1));
          } else if (timer.minutes > 0) {
            timerManager.updateTimer(id, timer.copyWith(
              minutes: timer.minutes - 1,
              seconds: 59,
            ));
          } else {
            timerManager.updateTimer(id, timer.copyWith(isRunning: false));
            ticker!.cancel();
          }
        });
      }

      return () => ticker?.cancel();
    }, [timer.isRunning, timer.minutes, timer.seconds]);

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
              Text(
                timer.minutes.toString().padLeft(2, '0'),
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const Text(
                ':',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Text(
                timer.seconds.toString().padLeft(2, '0'),
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              timerManager.updateTimer(id, timer.copyWith(isRunning: !timer.isRunning));
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(40),
            ),
            child: Text(timer.isRunning ? 'Pause' : 'Start'),
          ),
        ],
      ),
    );
  }
}
