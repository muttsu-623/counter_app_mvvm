import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rxdart/rxdart.dart';
import 'package:state_notifier/state_notifier.dart';

import 'count_flux.dart';

final countViewModelProvider = StateNotifierProvider((ref) => CounterViewModel(ref.read(countFluxProvider)));

class CounterViewModel extends StateNotifier<CounterViewState> {

  factory CounterViewModel(CountFlux countFlux) {
    return CounterViewModel._(CounterViewState(0), countFlux);
  }

  CounterViewModel._(CounterViewState state, this.countFlux) : super(state) {
    _incrementCount.stream.listen((_) => countFlux.actionCreator.changeCount(countFlux.store.count.value+1));
    countFlux.store.count.listen((count) => this.state = CounterViewState(count));
  }

  final CountFlux countFlux;

  final _incrementCount = PublishSubject<void>();

  void incrementCount() => _incrementCount.add(dynamic);
}

class CounterViewState {
  CounterViewState(this.count);

  final int count;
}