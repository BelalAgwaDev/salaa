import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../../common/stateRenderer/state_renderer_impl.dart';

abstract class BaseViewModel extends BaseViewModelInput
    with BaseViewModelOutPut {
  // shared variables and function that will be used through any view model.
  final StreamController _inputStreamController=BehaviorSubject<FlowState>();
  @override

  Sink get inputState => _inputStreamController.sink;

  @override

  Stream<FlowState> get outState => _inputStreamController.stream.map((flowState) => flowState);

  @override
  void dispose() {
    _inputStreamController.close();
  }
}


abstract class BaseViewModelInput {
  void start();
  void dispose();
  Sink get inputState;
}

abstract class BaseViewModelOutPut {
  Stream<FlowState>get outState;
}
