
import 'dart:async';

import 'package:salaa/domain/useCase/profile/use_case.dart';
import 'package:salaa/presentation/base/baseView/base_view_model.dart';
import 'package:salaa/presentation/common/freez/freezed.dart';

import '../../../domain/model/login/login_model.dart';
import '../../common/stateRenderer/state_renderer.dart';
import '../../common/stateRenderer/state_renderer_impl.dart';
import '../../resource/input_Validator.dart';

class ProfileViewModel extends BaseViewModel with InputProfileViewModel,OutPutProfileViewModel{
  final ProfileUseCase _profileUseCase;
  var profileObject = ProfileObject("", "","");
  ProfileViewModel(this._profileUseCase);

  final StreamController<LoginModel> isUserLoggedInSuccessfullyStreamController =
  StreamController.broadcast();
  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
   isUserLoggedInSuccessfullyStreamController.close();
  }

  @override
  profileUpdate() async{
    inputState.add(LoadingState(
        stateRenderType: StateRenderType.popupLoadingState, message: ''));

    (await _profileUseCase.execute(ProfileUseCaseInput(
      profileObject.name,
      profileObject.phone,
      profileObject.email
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
  setEmail(String email) {
    profileObject = profileObject.copyWith(email: email.trim());
  }

  @override
  setName(String name) {
    profileObject = profileObject.copyWith(name: name.trim());
  }

  @override
  setPhone(String phone) {
    profileObject = profileObject.copyWith(phone: phone.trim());
  }


}

abstract class InputProfileViewModel{
  profileUpdate();
  setName(String name);
  setPhone(String phone);
  setEmail(String email);

}
abstract class OutPutProfileViewModel{}