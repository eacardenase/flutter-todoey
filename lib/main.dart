import 'package:flutter/material.dart';

import 'package:todoey/ui_updates_demo.dart';

void main() {
  runApp(
    const App(),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  StatelessElement createElement() {
    print('App createElement() called!');

    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Internals'),
        ),
        body: const UIUpdatesDemo(),
      ),
    );
  }
}
