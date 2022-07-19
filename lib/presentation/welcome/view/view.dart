import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:salaa/presentation/resource/app_size.dart';
import 'package:salaa/presentation/resource/color_manger.dart';
import 'package:salaa/presentation/resource/image_manger.dart';
import 'package:salaa/presentation/resource/strings_manger.dart';

import '../../../app/app_prefs.dart';
import '../../../app/di.dart';
import '../../resource/route_manger.dart';

class WelcomeView extends StatelessWidget {
  final AppPreferences _appPreferences=instance<AppPreferences>();
   WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppPaddingSizeMange.p26),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(AppJson.choice),
                Text(AppStrings.welcome.tr(),
                    style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(height:AppSizeMange.s60),
                SizedBox(
                  width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, Routes.login);
                          _appPreferences.setWelcomeScreenView();
                        }, child: Text(AppStrings.login,
                    style: Theme.of(context).textTheme.displayMedium).tr(),
                    )),

                const SizedBox(height:AppSizeMange.s16),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppColor.darkGrayFont
                      ),
                        onPressed: () {
                          _appPreferences.setWelcomeScreenView();
                          Navigator.of(context).pushReplacementNamed(Routes.login);
                        }, child: Text(AppStrings.signUp, style: Theme.of(context).textTheme.displayMedium).tr())),
                const SizedBox(height:AppSizeMange.s60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
