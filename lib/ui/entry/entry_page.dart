import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'entry_view_model.dart';

class EntryPage extends HookWidget {
  const EntryPage({Key key}): super();

  final title = "Entry View";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed next page button this many times:',
            ),
            Center(
              child: Text(
                "${useProvider(entryViewModelProvider.state.select((value) => value.count))}",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text(
          "Go!",
          style: Theme.of(context).textTheme.headline5,
        ),
        onPressed: () => Navigator.of(context).pushNamed('/counter')),
    );
  }
}