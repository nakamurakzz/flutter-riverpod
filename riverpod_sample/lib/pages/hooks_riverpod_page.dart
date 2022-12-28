import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

final helloProvider = useProvider(((ref) => 'Hello World'));

useProvider(String Function(dynamic ref) param0) {}

class RiverpodHooksPage extends HookWidget {
  String title = '';
  RiverpodHooksPage({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = useProvider(helloProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("Riverpod Hooks Sample")),
      body: Center(
        child: Text(value),
      ),
    );
  }
}
