import 'package:flutter/material.dart';
import 'package:imc_default_state_manager/blocScrum/bloc_pattern_page.dart';
import 'package:imc_default_state_manager/changeNotifier/change_notifier_page.dart';
import 'package:imc_default_state_manager/home_page.dart';
import 'package:imc_default_state_manager/setState/set_state_page.dart';
import 'package:imc_default_state_manager/valueNotifier/value_notifier_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/set_state': (context) => const SetStatePage(),
        '/change_notifier': (context) => const ChangeNotifierPage(),
        '/value_notifier': (context) => const ValueNotifierPage(),
        '/bloc_pattern': (context) => const BlocPatternPage(),
      },
    );
  }
}
