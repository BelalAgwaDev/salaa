import 'dart:async';


import 'package:salaa/domain/model/register/register_model.dart';
import 'package:salaa/domain/useCase/register/register_use_case.dart';
import 'package:salaa/presentation/base/baseView/base_view_model.dart';
import 'package:salaa/presentation/common/freez/freezed.dart';

import '../../common/stateRenderer/state_renderer.dart';
import '../../common/stateRenderer/state_renderer_impl.dart';
import '../../resource/input_Validator.dart';

class RegisterViewModel extends BaseViewModel
    with RegisterViewModelInput, RegisterViewModelOutPut {
  //stream
  final StreamController _areAllInputsValidStreamController =
      StreamController<void>.broadcast();

  final StreamController<RegisterModel> isUserRegisterInSuccessfullyStreamController =
      StreamController.broadcast();

  //object instance
  var registerObject = RegisterObject("", "", "", "");
  final RegisterUseCase _registerUseCase;
  RegisterViewModel(this._registerUseCase);

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    _areAllInputsValidStreamController.close();
    isUserRegisterInSuccessfullyStreamController.close();
    super.dispose();
  }

  //input

  @override
  Sink get inputAreAllInputsValid => _areAllInputsValidStreamController.sink;

  @override
  void login() async {
    inputState.add(LoadingState(
        stateRenderType: StateRenderType.popupLoadingState, message: ''));

    (await _registerUseCase.execute(RegisterUseCaseInput(
      registerObject.name,
      registerObject.email,
      registerObject.phone,
      registerObject.password,
    )))
        .fold(
            (failure) => {
                  // left -> failure
                  if (failure.code == -6)
                    {
                      inputState.add(InternetConnectionState(
                        stateRenderType:
                            StateRenderType.popupInternetConnectionState,
                        message: failure.message,
                      )),
                    }
                  else
                    {
                      inputState.add(ErrorState(
                        stateRenderType: StateRenderType.popupErrorState,
                        message: InputValidator.failureMassage(failure),
                      )),
                    }
                }, (data) async {
      //right -> data(success)
      inputState.add(ContentState());

      isUserRegisterInSuccessfullyStreamController.add(data);
    });
  }

  @override
  setEmailId(String email) {
    registerObject = registerObject.copyWith(email: email.trim());
    inputAreAllInputsValid.add(null);
  }

  @override
  setName(String name) {
    registerObject = registerObject.copyWith(name: name.trim());
    inputAreAllInputsValid.add(null);
  }

  @override
  setPassword(String password) {
    registerObject = registerObject.copyWith(password: password.trim());
    inputAreAllInputsValid.add(null);
  }

  @override
  setPhone(String phone) {
    registerObject = registerObject.copyWith(phone: phone.trim());
    inputAreAllInputsValid.add(null);
  }

  //output
  @override
  Stream<bool> get outAreAllInputsValid =>
      _areAllInputsValidStreamController.stream.map((_) => _areAllInputValid());

  //private function
  bool _areAllInputValid() {
    return registerObject.email.isNotEmpty &&
        registerObject.phone.isNotEmpty &&
        registerObject.name.isNotEmpty &&
        registerObject.password.isNotEmpty;
  }
}

abstract class RegisterViewModelInput {
  void login();
  setName(String name);
  setEmailId(String email);
  setPhone(String phone);
  setPassword(String password);
  Sink get inputAreAllInputsValid;
}

abstract class RegisterViewModelOutPut {
  Stream<bool> get outAreAllInputsValid;
}
