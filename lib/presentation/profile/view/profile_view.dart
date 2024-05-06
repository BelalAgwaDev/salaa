
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import '../../../app/app_prefs.dart';
import '../../../app/di.dart';
import '../../common/stateRenderer/state_renderer_impl.dart';

import '../../resource/app_size.dart';
import '../../resource/color_manger.dart';

import '../../resource/strings_manger.dart';
import '../viewModel/profile_view_model.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController _userEmail = TextEditingController();
  final ProfileViewModel _viewModel = instance<ProfileViewModel>();
  final TextEditingController _userPhone = TextEditingController();
  final TextEditingController _userName = TextEditingController();
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final _formKey = GlobalKey<FormState>();
  _bins() {


    _userPhone.text=_appPreferences.isAccessPhoneNumber();
    _userName.text=_appPreferences.isAccessName();
    _userEmail.text=_appPreferences.isAccessEmail();




    _viewModel.start();
    _userEmail.addListener(() {
      _viewModel.setEmail(_userEmail.text);
    });

    _userName.addListener(() {
      _viewModel.setName(_userName.text);
    });

    _userPhone.addListener(() {
      _viewModel.setPhone(_userPhone.text);
    });

    _viewModel.isUserLoggedInSuccessfullyStreamController.stream.listen((data) {
      //navigate to main screen
      SchedulerBinding.instance.addPostFrameCallback((_) {
        restAllModule();
        _appPreferences.removeUpdateData();
        _appPreferences.setDataScreenData(
            tokenValue: data.data!.token,
            nameValue: data.data!.name,
            phoneValue: data.data!.phone,
            imageValue: data.data!.image,
            email: data.data!.email,
            id: data.data!.id);
        Phoenix.rebirth(context);

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
          return snapshot.data?.getScreenWidget(context: context,contentScreenWidget:  _getContentWidget(),
                 retryActionFunction:  () {
                _viewModel.profileUpdate();
              }) ??
              _getContentWidget();
        });
  }


  Widget _getContentWidget() {
    return Scaffold(
      appBar: AppBar(),
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

                  TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    controller: _userName,

                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        size: AppSizeMange.s18,
                        color: AppColor.darkBG3,
                      ),
                      labelText: AppStrings.userName.tr(),
                      hintText: AppStrings.userName.tr(),
                    ),
                  ),
                  const SizedBox(
                    height: AppSizeMange.s20,
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.phone,

                    controller: _userPhone,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone,
                          size: AppSizeMange.s18, color: AppColor.darkBG3),
                      labelText: AppStrings.phone.tr(),
                      hintText: AppStrings.phone.tr(),
                    ),
                  ),
                  const SizedBox(
                    height: AppSizeMange.s20,
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    controller: _userEmail,

                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        size: AppSizeMange.s18,
                        color: AppColor.darkBG3,
                      ),
                      labelText: AppStrings.emailAddress.tr(),
                      hintText: AppStrings.emailAddress.tr(),
                    ),
                  ),
                  const SizedBox(
                    height: AppPaddingSizeMange.p24,
                  ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:
                       () {
                         _viewModel.profileUpdate();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            AppPaddingSizeMange.p12)),
                  ),

                  child: const Text(
                    AppStrings.profileUpdate,
                  ).tr(),
                ),
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
