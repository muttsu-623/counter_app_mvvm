import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rxdart/subjects.dart';

class CountActionCreator {
  static final _instance = CountActionCreator._internal(CountDispatcher());
  factory CountActionCreator() => _instance;
  CountActionCreator._internal(this._dispatcher);

  CountDispatcher _dispatcher;

  void changeCount(int count) => _dispatcher.count.add(count);
}

class CountDispatcher {
  static final _instance = CountDispatcher._internal();
  factory CountDispatcher() => _instance;
  CountDispatcher._internal();

  final BehaviorSubject<int> count = BehaviorSubject<int>.seeded(0);
}

class CountStore {
  static final _instance = CountStore._internal(CountDispatcher());
  factory CountStore() => _instance;
  CountStore._internal(this._dispatcher) {
    _dispatcher.count.listen((value) => count.add(value));
  }

  CountDispatcher _dispatcher;

  final BehaviorSubject<int> count = BehaviorSubject<int>();
}

final countFluxProvider = Provider((ref) => CountFlux());

class CountFlux {

  static final _instance = CountFlux._internal(CountActionCreator(), CountDispatcher(), CountStore());

  factory CountFlux() => _instance;

  CountFlux._internal(this.actionCreator, this._dispatcher, this.store);

  CountActionCreator actionCreator = CountActionCreator();
  CountDispatcher _dispatcher = CountDispatcher();
  CountStore store = CountStore();
}