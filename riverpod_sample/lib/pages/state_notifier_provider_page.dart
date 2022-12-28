import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final helloProvider = Provider(((ref) => 'Hello World'));

class StateNotifierProviderPage extends ConsumerWidget {
  String title = '';
  StateNotifierProviderPage({Key? key, required String title})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(helloProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("Riverpod Sample")),
      body: Center(
        child: Text(value),
      ),
    );
  }
}
