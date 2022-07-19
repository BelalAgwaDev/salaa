import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:salaa/presentation/register/viewModel/register_view_model.dart';
import 'package:salaa/presentation/resource/input_Validator.dart';

import '../../../app/app_prefs.dart';
import '../../../app/di.dart';
import '../../common/stateRenderer/state_renderer_impl.dart';
import '../../resource/app_size.dart';
import '../../resource/color_manger.dart';
import '../../resource/font_manger.dart';
import '../../resource/route_manger.dart';
import '../../resource/strings_manger.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController _userEmail = TextEditingController();

  final TextEditingController _userPassword = TextEditingController();

  final TextEditingController _userPhone = TextEditingController();

  final TextEditingController _userName = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final RegisterViewModel _viewModel = instance<RegisterViewModel>();
  final AppPreferences _appPreferences = instance<AppPreferences>();
  _bins(){
    _viewModel.start();
    _userEmail.addListener(() {
      _viewModel.setEmailId(_userEmail.text);

    });
    _userPassword.addListener(() {
      _viewModel.setPassword(_userPassword.text); });

    _userName.addListener(() {
      _viewModel.setName(_userName.text);

    });
    _userPhone.addListener(() {
      _viewModel.setPhone(_userPhone.text); });

    _viewModel.isUserRegisterInSuccessfullyStreamController.stream.listen((data) {
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
        }
    );

  }

  Widget _getContentWidget(){
    return Scaffold(
      body: Center(
        child: Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: AppPaddingSizeMange.p18),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.registerNow,
                  style: Theme.of(context).textTheme.displaySmall,
                ).tr(),
                const SizedBox(
                  height: AppSizeMange.s10,
                ),
                Text(
                  AppStrings.registerNowHotOff,
                  style: Theme.of(context).textTheme.bodyLarge,
                ).tr(),
                const SizedBox(
                  height: AppSizeMange.s40,
                ),
                TextFormField(
                  validator: InputValidator.isNameValid,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  controller: _userName,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person,
                        size: AppSizeMange.s18, color: AppColor.darkBG3),
                    labelText: AppStrings.userName.tr(),
                    hintText: AppStrings.userName.tr(),
                  ),
                ),
                const SizedBox(
                  height: AppSizeMange.s20,
                ),
                TextFormField(
                  validator: InputValidator.isEmailValid,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  controller: _userEmail,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email,
                        size: AppSizeMange.s18, color: AppColor.darkBG3),
                    labelText: AppStrings.emailAddress.tr(),
                    hintText: AppStrings.emailAddress.tr(),
                  ),
                ),
                const SizedBox(
                  height: AppPaddingSizeMange.p24,
                ),
                TextFormField(
                  validator: InputValidator.isPhoneValid,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  controller: _userPhone,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.phone,
                      size: AppSizeMange.s18,
                      color: AppColor.darkBG3,
                    ),
                    labelText: AppStrings.phone.tr(),
                    hintText: AppStrings.phone.tr(),
                  ),
                ),
                const SizedBox(
                  height: AppSizeMange.s20,
                ),
                TextFormField(
                  validator: InputValidator.isPasswordValid,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.visiblePassword,
                  controller: _userPassword,
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
                    return   SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (snapshot.data ?? false)?() {
                          if(_formKey.currentState!.validate()){
                            _viewModel.login();
                          }
                        }:null,
                        child: const Text(
                          AppStrings.registerNow,
                        ).tr(),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(AppPaddingSizeMange.p12)),
                        ),
                      ),
                    );
                  },),
                const SizedBox(
                  height: AppPaddingSizeMange.p24,
                ),

                Text.rich(
                    TextSpan(text: AppStrings.alreadyHaveAccount.tr(), children: [

                      TextSpan(
                          recognizer:  TapGestureRecognizer()..onTap = () => Navigator.pushReplacementNamed(context, Routes.login),
                          text: AppStrings.loginNotHave.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!.copyWith(
                              fontSize: FontSizeManger.s18,
                              color: AppColor.darkBG3
                          )
                      )
                    ]),
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge),
              ],
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
