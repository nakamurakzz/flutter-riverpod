import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final futureProvider = FutureProvider(
    (ref) => Future.delayed(const Duration(seconds: 3), () => 'Hello World'));
final streamProvider = StreamProvider(
    (ref) => Stream.periodic(const Duration(seconds: 1), (value) => value++));

class FutureProviderPage extends ConsumerWidget {
  String title = '';
  FutureProviderPage({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(futureProvider);
    final count = ref.watch(streamProvider);

    return Scaffold(
        appBar: AppBar(title: const Text("Riverpod Sample")),
        body: Center(
            // FutureProviderの値を取得するときは、value.whenを使う
            // data: 非同期処理が完了した時に表示するウィジェットを返すコールバック関数
            // error: 非同期処理が失敗した時に表示するウィジェットを返すコールバック関数
            // loading: 非同期処理が完了するまで表示するウィジェットを返すコールバック関数
            child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      child: value.when(
                          data: (data) => Text(data.toString()),
                          error: (error, _) => Text(error.toString()),
                          loading: () => const CircularProgressIndicator()),
                    ),
                    Container(
                      child: count.when(
                          data: (data) => Text(data.toString()),
                          error: (error, _) => Text(error.toString()),
                          loading: () => const CircularProgressIndicator()),
                    ),
                  ],
                ))));
  }
}
