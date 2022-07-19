

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'package:salaa/presentation/resource/color_manger.dart';
import 'package:salaa/presentation/resource/strings_manger.dart';

import '../../../app/app_prefs.dart';
import '../../../app/di.dart';
import '../../about/view/about_view.dart';

import '../../contact/view/contact_view.dart';
import '../../profile/view/profile_view.dart';



class SettingView extends StatefulWidget {
   const SettingView({Key? key}) : super(key: key);

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  final AppPreferences _appPreferences =instance<AppPreferences>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top:58.0, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
    Card(
        elevation: 20,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(color: AppColor.grayFont, width: 0.2)),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 20,right: 10.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  AppStrings.accountSetting,
                  style: Theme.of(context).textTheme.labelMedium
                ).tr(),
              ),
              const SizedBox(
                height: 10,
              ),
              _container(context, AppStrings.profile.tr(), Icons.person,(){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>const ProfileView()
                    ));
              }),
              const SizedBox(
                height: 20,
              ),
              _container(context, AppStrings.payment.tr(), Icons.exit_to_app,(){
                _appPreferences.removeData();
                Phoenix.rebirth(context);

              }),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
    ),

              const SizedBox(
                height: 10,
              ),
              Card(
                elevation: 20,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: AppColor.grayFont, width: 0.2)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 20,right: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          AppStrings.generalSetting.tr(),
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _container(context, AppStrings.darkMode.tr(), Icons.light,(){

                        _appPreferences.setDark();
                        restAllModule();
                        Phoenix.rebirth(context);
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                      _container(context, AppStrings.language.tr(), Icons.language,(){
                        _appPreferences.changeAppLanguage();
                        restAllModule();
                        Phoenix.rebirth(context);
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                elevation: 20,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: AppColor.grayFont, width: 0.2)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 20,right: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          AppStrings.support,
                          style: Theme.of(context).textTheme.labelMedium,
                        ).tr(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _container(context, AppStrings.contactUs.tr(), Icons.contact_phone,(){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>const ContactView()
                            ));
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                      _container(context, AppStrings.aboutAs.tr(), Icons.info,(){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>const AboutAs()
                            ));

                      }),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _container(context, String name, IconData icon,GestureTapCallback  function) {
    return GestureDetector(
      onTap:function ,
      child: Card(
        color: AppColor.darkBG3,
        elevation: 12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: SizedBox(
          width: double.infinity,
          height: 60,
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Icon(icon, color: Colors.yellow[800]),
              const SizedBox(
                width: 20,
              ),
              Text(name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 16, color: AppColor.white)),
              const Spacer(),
              Icon(Icons.arrow_forward_ios, color: AppColor.white),
              const SizedBox(
                width: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
