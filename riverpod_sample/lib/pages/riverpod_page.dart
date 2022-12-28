import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final helloProvider = Provider(((ref) => 'Hello World'));
final nameProvider =
    Provider.family<String, String>((ref, name) => 'Hello $name');

class RiverpodPage extends ConsumerWidget {
  String title = '';
  RiverpodPage({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(helloProvider);
    final name = ref.watch(nameProvider('Taro'));
    return Scaffold(
      appBar: AppBar(title: const Text("Riverpod Sample")),
      body: Center(
        child: Text(value),
      ),
    );
  }
}
