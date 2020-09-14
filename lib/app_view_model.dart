import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

abstract class AppViewModel<T> extends StateNotifier {
  AppViewModel(ProviderReference ref, T state) : super(state) {
    ref.onDispose(() => onDispose());
  }

  void onDispose();
}