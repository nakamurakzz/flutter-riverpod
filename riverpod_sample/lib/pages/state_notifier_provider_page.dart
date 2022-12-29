import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateNotifierのサブクラス
class CounterNotifier extends StateNotifier<int> {
  CounterNotifier(this.ref) : super(0);
  final Ref ref;

  void increment() {
    state++;
  }
}

final counterNotifierProvider = StateNotifierProvider<CounterNotifier, int>(
  // サブクラスのStateNotifierにrefを渡すことも出来る
  (ref) => CounterNotifier(ref),
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

    ref.listen<int>(counterNotifierProvider, (int? value, int previous) {
      print("value: $value, previous: $previous");
    });

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
