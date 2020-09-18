import 'package:flutter/material.dart';

import 'ui/counter/counter_page.dart';
import 'ui/entry/entry_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVVM Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder> {
        '/': (BuildContext context) => const EntryPage(),
        '/counter': (BuildContext context) => const CounterPage(title: 'Counter Page'),
      },
    );
  }
}