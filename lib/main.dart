import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'counter_page.dart';

void main() {
  runApp(ProviderScope(
    child: MyApp()
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder> {
        '/': (BuildContext context) => EntryView(),
        '/counter': (BuildContext context) => CounterView(title: 'Flutter Demo Home Page'),
      },
    );
  }
}

class EntryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
          onPressed: () => Navigator.of(context).pushNamed('/counter'),
          child: Text("押して！！！")
      ),
    );
  }
}