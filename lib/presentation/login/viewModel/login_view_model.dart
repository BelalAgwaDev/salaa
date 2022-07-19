import 'dart:async';

import 'package:salaa/domain/model/login/login_model.dart';
import 'package:salaa/domain/useCase/login/login_use_case.dart';
import 'package:salaa/presentation/base/baseView/base_view_model.dart';
import 'package:salaa/presentation/resource/input_Validator.dart';
import '../../common/freez/freezed.dart';
import '../../common/stateRenderer/state_renderer.dart';
import '../../common/stateRenderer/state_renderer_impl.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInput, LoginViewModelOutput {
  //object instance
  var loginObject = LoginObject("", "");
  final LoginUseCase _loginUseCase;
  //stream
  final StreamController _areAllInputsValidStreamController =
      StreamController<void>.broadcast();

  final StreamController<LoginModel> isUserLoggedInSuccessfullyStreamController =
      StreamController.broadcast();

  LoginViewModel(this._loginUseCase);
  @override
  void dispose() {
    _areAllInputsValidStreamController.close();
    isUserLoggedInSuccessfullyStreamController.close();

    super.dispose();
  }

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  Sink get inputAreAllInputsValid => _areAllInputsValidStreamController.sink;

  @override
  void login() async {
    inputState.add(LoadingState(
        stateRenderType: StateRenderType.popupLoadingState, message: ''));

    (await _loginUseCase.execute(LoginUseCaseInput(
      loginObject.email,
      loginObject.password,
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
      //navigate to main screen
      isUserLoggedInSuccessfullyStreamController.add(data);
    });
  }



  @override
  Stream<bool> get outAreAllInputsValid =>
      _areAllInputsValidStreamController.stream.map((_) => _areAllInputValid());

  @override
  setEmailId(String email) {
    loginObject = loginObject.copyWith(email: email.trim());
    inputAreAllInputsValid.add(null);
  }

  @override
  setPassword(String password) {
    loginObject = loginObject.copyWith(password: password.trim());
    inputAreAllInputsValid.add(null);
  }

//private function
  bool _areAllInputValid() {
    return loginObject.email.isNotEmpty && loginObject.password.isNotEmpty;
  }
}

abstract class LoginViewModelInput {
  void login();
  setEmailId(String email);
  setPassword(String password);
  Sink get inputAreAllInputsValid;
}

abstract class LoginViewModelOutput {
  Stream<bool> get outAreAllInputsValid;
}
