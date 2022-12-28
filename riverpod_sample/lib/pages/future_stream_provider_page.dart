import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 外部から値を入力するFutureProvider
// .family<レスポンスの型, パラメータの型>を指定
final futureProvider =
    FutureProvider.autoDispose.family<String, String>((ref, str) {
  createString(String str) async {
    await Future.delayed(const Duration(seconds: 1));
    return str;
  }

  return createString(str);
});

// 画面遷移時に値をクリアするStreamProvider
final streamProvider = StreamProvider.autoDispose<int>((ref) {
  createStream() async* {
    int i = 0;
    while (true) {
      yield i;
      await Future.delayed(const Duration(seconds: 1));
      print(i);
      i++;
    }
  }

  ref.onDispose(() {
    debugPrint('Dispose Counter');
  });

  return createStream();
});

// 画面遷移後も値を保持するStreamProvider
final streamProviderNotAutoDispose = StreamProvider<int>((ref) {
  createStream() async* {
    int i = 0;
    while (true) {
      yield i;
      await Future.delayed(const Duration(seconds: 1));
      print(i);
      i++;
    }
  }

  return createStream();
});

// 画面遷移後も値を保持するStreamProvider
final streamProviderNotAutoDisposeButUseAutoDispose =
    StreamProvider.autoDispose<int>((ref) {
  createStream() async* {
    int i = 0;
    while (true) {
      yield i;
      await Future.delayed(const Duration(seconds: 1));
      print(i);
      i++;
    }
  }

  ref.keepAlive();

  return createStream();
});

class FutureProviderPage extends ConsumerWidget {
  String title = '';
  FutureProviderPage({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(futureProvider("Hello World"));
    final count = ref.watch(streamProvider);
    final count2 = ref.watch(streamProviderNotAutoDispose);
    final count3 = ref.watch(streamProviderNotAutoDisposeButUseAutoDispose);

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
                    const Spacer(),
                    const Text("画面遷移時に値をクリアするカウンター"),
                    Container(
                      child: count.when(
                          data: (data) => Text(data.toString()),
                          error: (error, _) => Text(error.toString()),
                          loading: () => const CircularProgressIndicator()),
                    ),
                    TextButton(
                        onPressed: () {
                          ref.refresh(streamProvider);
                        },
                        child: Text("カウンタークリア")),
                    const Spacer(),
                    const Text("画面遷移後も値を保持するカウンター"),
                    Container(
                      child: count2.when(
                          data: (data) => Text(data.toString()),
                          error: (error, _) => Text(error.toString()),
                          loading: () => const CircularProgressIndicator()),
                    ),
                    TextButton(
                        onPressed: () {
                          ref.refresh(streamProviderNotAutoDispose);
                        },
                        child: Text("カウンタークリア")),
                    const Spacer(),
                    const Text("画面遷移後も値を保持するカウンター"),
                    Container(
                      child: count3.when(
                          data: (data) => Text(data.toString()),
                          error: (error, _) => Text(error.toString()),
                          loading: () => const CircularProgressIndicator()),
                    ),
                    TextButton(
                        onPressed: () {
                          ref.refresh(
                              streamProviderNotAutoDisposeButUseAutoDispose);
                        },
                        child: Text("カウンタークリア"))
                  ],
                ))));
  }
}
