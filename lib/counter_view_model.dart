import 'package:flutter_app_mvvm_sample/app_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rxdart/rxdart.dart';

import 'count_flux.dart';

final countViewModelProvider = StateNotifierProvider.autoDispose((ref) => CounterViewModel(ref, ref.read(countFluxProvider)));

class CounterViewModel extends AppViewModel<CounterViewState> {

  factory CounterViewModel(ProviderReference ref, CountFlux countFlux) {
    return CounterViewModel._(ref, CounterViewState(countFlux.store.count.value), countFlux);
  }

  CounterViewModel._(ProviderReference ref, CounterViewState state, this.countFlux) : super(ref, state) {
    _compositeSubscription.add(_incrementCount.stream.listen((_) => countFlux.actionCreator.changeCount(countFlux.store.count.value+1)));
    _compositeSubscription.add(countFlux.store.count.listen((count) => this.state = CounterViewState(count)));
  }

  final CountFlux countFlux;

  final _compositeSubscription = CompositeSubscription();

  final _incrementCount = PublishSubject<void>();

  void incrementCount() => _incrementCount.add(dynamic);

  @override
  void onDispose() => _compositeSubscription.dispose();
}

class CounterViewState {
  CounterViewState(this.count);

  final int count;
}