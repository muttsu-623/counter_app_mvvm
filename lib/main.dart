import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'my_app.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}