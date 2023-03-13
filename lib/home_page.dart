import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/set_state');
              },
              child: const Text('SetState'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/change_notifier');
              },
              child: const Text('ChangeNotifier'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/value_notifier');
              },
              child: const Text('ValueNotifier'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/bloc_scrums');
              },
              child: const Text('Bloc(Scrums)'),
            ),
          ],
        ),
      ),
    );
  }
}
