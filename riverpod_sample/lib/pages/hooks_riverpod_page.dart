import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

final helloProvider = Provider(((_) => 'Hello World'));

useProvider(String Function(dynamic ref) param0) {}

class RiverpodHooksPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(helloProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Riverpod Hooks Sample")),
      body: Center(
        child: Text(value),
      ),
    );
  }
}
