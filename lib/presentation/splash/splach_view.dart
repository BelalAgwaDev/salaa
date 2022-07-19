
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import 'package:salaa/presentation/resource/image_manger.dart';

import '../../app/app_prefs.dart';
import '../../app/di.dart';
import '../resource/app_constant.dart';
import '../resource/route_manger.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  //instance
  Timer? _timer;
  final AppPreferences _appPreferences=instance<AppPreferences>();
  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstant.splashDelay), _goNext);
  }

  _goNext(){
    _appPreferences.isUserLoggedIn().then((isUserLoggedIn) => {
      if(isUserLoggedIn){
        //navigate to main screen
        Navigator.pushReplacementNamed(context, Routes.bottomNavBarRoute),
      }else{
        _appPreferences.isOnBoardingScreenView().then((isOnBoardingScreenView) => {
          if(isOnBoardingScreenView){
            _appPreferences.isWelcomeScreenView().then((isWelcomeScreenView) => {
              if(isWelcomeScreenView){
                //navigate to login screen
                 Navigator.pushReplacementNamed(context, Routes.login)
              }else{
                Navigator.pushReplacementNamed(context, Routes.choiceRoute)
              }
            }
              )


          }
        else{
            //navigate to onBoarding screen
            Navigator.pushReplacementNamed(context, Routes.onBoardingRoute)
          }
        })
      }
    });

  }
  @override
  void initState() {
    _startDelay();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Lottie.asset(AppJson.splash)),
    );
  }

  @override
  void dispose() {
   _timer?.cancel();
    super.dispose();
  }
}
