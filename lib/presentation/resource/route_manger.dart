
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:salaa/presentation/login/view/login_view.dart';
import 'package:salaa/presentation/navBae/view/nav_bar_view.dart';
import 'package:salaa/presentation/register/view/register_view.dart';
import 'package:salaa/presentation/resource/strings_manger.dart';

import '../../app/di.dart';
import '../onBoarding/view/on_boarding_view.dart';
import '../splash/splach_view.dart';
import '../welcome/view/view.dart';

class Routes{
  static const String splashRoute = "/"; //main routes
  static const String onBoardingRoute = "/onBoarding";
  static const String choiceRoute = "/choiceRoute";
  static const String login = "/login";
  static const String register = "/register";
  static const String bottomNavBarRoute = "/bottomNavBarRoute";
}



class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
          
        );
      case Routes.onBoardingRoute:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingView(),
        );

      case Routes.choiceRoute:
        return MaterialPageRoute(
          builder: (_) =>  WelcomeView(),
        );

      case Routes.bottomNavBarRoute:
        initProfileModule();
        initHomeModule();
        return MaterialPageRoute(
          builder: (_) => const BottomNavBar(),
        );


      case Routes.login:
        initLoginModule();
        return MaterialPageRoute(
          builder: (_) =>  const LoginView(),
        );
      case Routes.register:
        initRegisterModule();
        return MaterialPageRoute(
          builder: (_) => const RegisterView(),
        );

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title:  const Text(AppStrings.noRouteFound).tr()),
        body: const SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Center(child: Text(AppStrings.noRouteFound)),
        ),
      ),
    );
  }
}