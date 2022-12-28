import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateNotifierのサブクラス
class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  void increment() {
    state++;
  }
}

final counterNotifierProvider = StateNotifierProvider<CounterNotifier, int>(
  (ref) => CounterNotifier(),
);

class StateNotifierProviderPage extends ConsumerWidget {
  String title = '';
  StateNotifierProviderPage({Key? key, required String title})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // StateNotifierProviderのnotifierを使うと、StateNotifierのインスタンスを取得できる
    final countStateController = ref.read(counterNotifierProvider.notifier);
    final count = ref.watch(counterNotifierProvider);

    return Scaffold(
        appBar: AppBar(title: const Text("Riverpod Sample")),
        body: Center(
          child: Text(count.toString()),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            countStateController.increment();
          },
          child: const Icon(Icons.add),
        ));
  }
}
