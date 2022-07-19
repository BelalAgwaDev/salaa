import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:salaa/presentation/base/baseView/base_view_model.dart';
import 'package:salaa/presentation/resource/app_constant.dart';
import 'package:salaa/presentation/resource/image_manger.dart';
import 'package:salaa/presentation/resource/strings_manger.dart';

import '../../../app/app_prefs.dart';
import '../../../app/di.dart';
import '../../../domain/model/onBoarding/on_boarding_model.dart';
import '../../resource/route_manger.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInput, OnBoardingViewModelOutput {
  // stream controller
  final StreamController<SliderViewObject> _streamController = BehaviorSubject();
  final AppPreferences _appPreferences=instance<AppPreferences>();
  late final List<SliderObject> _list;
  final PageController _pageController = PageController();
  bool isFirstPage = true;
  bool isLast = false;

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    //view model start your job
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  void goNext(context) {
    if (isLast == true) {
      _appPreferences.setOnBoardingScreenView();
      Navigator.pushReplacementNamed(context, Routes.choiceRoute);
    } else {
      _pageController.nextPage(
          duration: const Duration(milliseconds: AppConstant.pageViewDelay),
          curve: Curves.fastLinearToSlowEaseIn);
    }
  }

  @override
  void onPageChanged(index) {
    if (index == _list.length - 4) {
      isFirstPage = true;
      isLast = false;
      _postDataToView();
    } else if (index == _list.length - 1) {
      isLast = true;
      isFirstPage = false;
      _postDataToView();
    } else {
      isLast = false;
      isFirstPage = false;
      _postDataToView();
    }
  }



  @override
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  //on boarding private function
  void _postDataToView() {
    inputSliderViewObject.add(SliderViewObject(
        list: _list,
        numberOfSlides: _list.length,
        first: isFirstPage,
        pageController: _pageController, last: isLast));
  }

  List<SliderObject> _getSliderData() => [
        SliderObject(
            title: AppStrings.onboardingTitle1.tr(),
            subTitle: AppStrings.onboardingSubTitle1.tr(),
            image: AppJson.onBoarding1),
        SliderObject(
            title: AppStrings.onboardingTitle2.tr(),
            subTitle: AppStrings.onboardingSubTitle2.tr(),
            image: AppJson.onBoarding2),
        SliderObject(
            title: AppStrings.onboardingTitle3.tr(),
            subTitle: AppStrings.onboardingSubTitle3.tr(),
            image: AppJson.onBoarding3),
      ];
}

abstract class OnBoardingViewModelInput {
  void goNext(context); //user click  on right arrow or swipe left
  void onPageChanged(int index); // on page change
  //stream controller input
  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutput {
  Stream<SliderViewObject> get outputSliderViewObject;
}
