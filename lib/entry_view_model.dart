import 'package:hooks_riverpod/all.dart';
import 'package:rxdart/rxdart.dart';

import 'app_view_model.dart';
import 'count_flux.dart';

final entryViewModelProvider = StateNotifierProvider.autoDispose((ref) => EntryViewModel(ref, ref.read(countFluxProvider)));

class EntryViewModel extends AppViewModel<EntryViewState> {

  factory EntryViewModel(ProviderReference ref, CountFlux countFlux) {
    return EntryViewModel._(ref, EntryViewState(countFlux.store.count.value), countFlux);
  }

  EntryViewModel._(ProviderReference ref, EntryViewState state, this.countFlux) : super(ref, state) {
    _compositeSubscription.add(countFlux.store.count.listen((count) => this.state = EntryViewState(count)));
  }

  final CountFlux countFlux;

  final _compositeSubscription = CompositeSubscription();

  @override
  void onDispose() => _compositeSubscription.dispose();
}

class EntryViewState {
  EntryViewState(this.count);

  final int count;
}