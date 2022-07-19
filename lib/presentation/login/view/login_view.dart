import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:salaa/presentation/login/viewModel/login_view_model.dart';
import 'package:salaa/presentation/resource/app_size.dart';
import 'package:salaa/presentation/resource/color_manger.dart';
import 'package:salaa/presentation/resource/font_manger.dart';
import 'package:salaa/presentation/resource/image_manger.dart';
import 'package:salaa/presentation/resource/input_Validator.dart';
import 'package:salaa/presentation/resource/strings_manger.dart';

import '../../../app/app_prefs.dart';
import '../../../app/di.dart';
import '../../common/stateRenderer/state_renderer_impl.dart';
import '../../resource/route_manger.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _userEmail = TextEditingController();
  final LoginViewModel _viewModel = instance<LoginViewModel>();
  final TextEditingController _userPassword = TextEditingController();
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final _formKey = GlobalKey<FormState>();
  _bins() {
    _viewModel.start();
    _userEmail.addListener(() {
      _viewModel.setEmailId(_userEmail.text);
    });
    _userPassword.addListener(() {
      _viewModel.setPassword(_userPassword.text);
    });

    _viewModel.isUserLoggedInSuccessfullyStreamController.stream.listen((data) {
      //navigate to main screen
      SchedulerBinding.instance?.addPostFrameCallback((_) {
        restAllModule();
        _appPreferences.setLoginScreenView();
        _appPreferences.setDataScreenData(
            tokenValue: data.data!.token,
            nameValue: data.data!.name,
            phoneValue: data.data!.phone,
            imageValue: data.data!.image,
            email: data.data!.email,
            id: data.data!.id);
        Navigator.of(context).pushReplacementNamed(Routes.bottomNavBarRoute);
      });
    });
  }

  @override
  void initState() {
    _bins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FlowState>(
        stream: _viewModel.outState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                  () {
                _viewModel.login();
              }) ??
              _getContentWidget();
        });
  }

  Widget _getContentWidget() {
    return Scaffold(
      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppPaddingSizeMange.p18),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset(AppJson.login),
                  Text(
                    AppStrings.loginNow,
                    style: Theme.of(context).textTheme.displaySmall,
                  ).tr(),
                  const SizedBox(
                    height: AppSizeMange.s10,
                  ),
                  Text(
                    AppStrings.loginNowHotOff,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ).tr(),
                  const SizedBox(
                    height: AppSizeMange.s40,
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    validator: InputValidator.isEmailValid,
                    controller: _userEmail,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email,
                          size: AppSizeMange.s18, color: AppColor.darkBG3),
                      labelText: AppStrings.emailAddress.tr(),
                      hintText: AppStrings.emailAddress.tr(),
                    ),
                  ),
                  const SizedBox(
                    height: AppSizeMange.s20,
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.visiblePassword,
                    controller: _userPassword,
                    validator: InputValidator.isPasswordValid,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        size: AppSizeMange.s18,
                        color: AppColor.darkBG3,
                      ),
                      labelText: AppStrings.password.tr(),
                      hintText: AppStrings.password.tr(),
                    ),
                  ),
                  const SizedBox(
                    height: AppPaddingSizeMange.p24,
                  ),
                  StreamBuilder<bool>(
                    stream: _viewModel.outAreAllInputsValid,
                    builder: (context, snapshot) {
                      return SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: (snapshot.data ?? false)
                              ? () {
                                  if (_formKey.currentState!.validate()) {
                                    _viewModel.login();
                                  }
                                }
                              : null,
                          child: const Text(
                            AppStrings.loginNow,
                          ).tr(),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    AppPaddingSizeMange.p12)),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: AppPaddingSizeMange.p24,
                  ),
                  Text.rich(
                      TextSpan(text: AppStrings.notHaveAccount.tr(), children: [
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.pushReplacementNamed(
                                  context, Routes.register),
                            text: AppStrings.signUpNotHave.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                    fontSize: FontSizeManger.s18,
                                    color: AppColor.darkBG3))
                      ]),
                      style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(
                    height: AppPaddingSizeMange.p50,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
