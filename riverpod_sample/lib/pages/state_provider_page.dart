import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stateProvider = StateProvider(((ref) => 0));

class StateProviderPage extends ConsumerWidget {
  String title = '';
  StateProviderPage({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateController = ref.read(stateProvider.notifier);
    final value = ref.watch(stateProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("State Provider Sample")),
      body: Center(
        child: Text(value.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // stateController.state++;
          stateController.update((state) => state + 1);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
