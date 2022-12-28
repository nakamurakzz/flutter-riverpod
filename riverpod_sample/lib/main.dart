import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/pages/future_stream_provider_page.dart';
import 'package:riverpod_sample/pages/riverpod_page.dart';
import 'package:riverpod_sample/pages/state_notifier_provider_page.dart';
import 'package:riverpod_sample/pages/state_provider_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/riverpod': (context) => RiverpodPage(title: 'Flutter Demo Home Page'),
        '/state-notifier-provider': (context) =>
            StateNotifierProviderPage(title: 'State Notifier Provider'),
        '/future-provider': (context) =>
            FutureProviderPage(title: 'Flutter Demo Home Page'),
        '/state-provider': (context) =>
            StateProviderPage(title: 'Flutter Demo Home Page'),
      },
      initialRoute: '/',
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Riverpod Sample")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/riverpod');
              },
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                minimumSize: const Size(200, 50),
              ),
              child: const Text('Riverpod'),
            ),
            // margin
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/state-notifier-provider');
              },
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                minimumSize: const Size(200, 50),
              ),
              child: const Text('State Notifier Provider'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/future-provider');
              },
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                minimumSize: const Size(200, 50),
              ),
              child: const Text('Future Provider'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/state-provider');
              },
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                minimumSize: const Size(200, 50),
              ),
              child: const Text('State Provider'),
            ),
          ],
        ),
      ),
    );
  }
}
