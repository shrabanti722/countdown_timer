import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../widgets/timer_widget.dart';
import '../providers/timers_provider.dart';

class TimerListScreen extends HookConsumerWidget {
  const TimerListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerManager = ref.watch(timerManagerProvider.notifier);
    final timers = ref.watch(timerManagerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Countdown Timers'),
      ),
      body: Column(
        children: [
          Expanded(
            child: timers.isEmpty
                ? const Center(
                    child: Text(
                      'No timers added. Tap "Add Timer" to start.',
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    itemCount: timers.length,
                    itemBuilder: (context, index) {
                      final id = timers.keys.elementAt(index);
                      return Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: TimerWidget(id: id),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                timerManager.addTimer();
              },
              icon: const Icon(Icons.add),
              label: const Text('Add Timer'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
