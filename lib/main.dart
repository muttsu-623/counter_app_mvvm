import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_mvvm_sample/entry_view_model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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

class EntryView extends HookWidget {

  final title = "Entry View";

  @override
  Widget build(BuildContext context) {
    print("EntryView rebuild");
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text(
            "${useProvider(entryViewModelProvider.state.select((value) => value.count))}",
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => Navigator.of(context).pushNamed('/counter')),
    );
  }
}