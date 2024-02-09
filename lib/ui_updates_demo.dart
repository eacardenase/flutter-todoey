import 'package:flutter/material.dart';

class UIUpdatesDemo extends StatefulWidget {
  const UIUpdatesDemo({super.key});

  @override
  StatefulElement createElement() {
    print('UIUpdatesDemo createElement() called!');

    return super.createElement();
  }

  @override
  State<UIUpdatesDemo> createState() => _UIUpdatesDemoState();
}

class _UIUpdatesDemoState extends State<UIUpdatesDemo> {
  var isUnderstood = false;

  @override
  Widget build(BuildContext context) {
    print('_UIUpdatesDemo build() called!');

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Every Flutter developer should have a basic understanding of Flutter's internals!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Do you understand how Flutter updates UIs?',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      isUnderstood = false;
                    });
                  },
                  child: const Text('No'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isUnderstood = true;
                    });
                  },
                  child: const Text('Yes'),
                )
              ],
            ),
            if (isUnderstood) const Text('Awesome!')
          ],
        ),
      ),
    );
  }
}
