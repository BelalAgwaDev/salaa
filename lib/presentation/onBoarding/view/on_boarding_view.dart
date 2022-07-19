import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:salaa/presentation/onBoarding/viewModel/view_model_on.dart';
import 'package:salaa/presentation/resource/color_manger.dart';
import 'package:salaa/presentation/resource/strings_manger.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../app/app_prefs.dart';
import '../../../app/di.dart';
import '../../../domain/model/onBoarding/on_boarding_model.dart';
import '../../resource/app_size.dart';
import '../../resource/route_manger.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {

  final OnBoardingViewModel _viewModel = OnBoardingViewModel();
  final AppPreferences _appPreferences =instance<AppPreferences>();
  bool alreadySaved =false;
  _bind() {
    _viewModel.start();
    _appPreferences.getDark().then((value) => {    setState(() {
      alreadySaved = value;
    })});
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _viewModel.outputSliderViewObject,
      builder: (context, snapshot) =>
          _GetContent(data: snapshot.data, viewModel: _viewModel,alreadySaved: alreadySaved),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

class _GetContent extends StatelessWidget {
   _GetContent({
     required this.alreadySaved,
    required this.viewModel,
    this.data,
    Key? key,
  }) : super(key: key);
  final OnBoardingViewModel viewModel;
  final SliderViewObject? data;
   final bool alreadySaved ;
  final AppPreferences _appPreferences=instance<AppPreferences>();
  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return Container();
    } else {
      return Scaffold(
          appBar: AppBar(
            actions: [
              TextButton(
                onPressed: () {
                  _appPreferences.setOnBoardingScreenView();
                  Navigator.pushReplacementNamed(context, Routes.choiceRoute);
                },
                child:  Text(AppStrings.skip,
                    style: Theme.of(context).textTheme.labelMedium,
                ).tr(),
              ),
              const SizedBox(width: 15,),
            ],
          ),
          body: PageView.builder(
              controller: data?.pageController,
              itemCount: data?.numberOfSlides,
              onPageChanged: (index) => viewModel.onPageChanged(index),
              itemBuilder: (context, index) {
                return ColumnData(sliderObject: data?.list[index]);
              }),
          bottomSheet: Container(
             height: AppSizeMange.s200,
            width:  double.infinity,

            color: alreadySaved? AppColor.dark:AppColor.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [


                      SmoothPageIndicator(
                          controller: data!.pageController,
                          count: data!.numberOfSlides,
                          effect: ScrollingDotsEffect(
                              activeDotColor: AppColor.darkBG3,
                              dotHeight: AppSizeMange.s12,
                              dotColor: AppColor.grayFont)),

                      Padding(
                        padding: const EdgeInsets.only(bottom: AppPaddingSizeMange.p60 ),
                        child: Align(
                          alignment: AlignmentDirectional.center,
                          child: Stack(
                            children: [
                              SizedBox(
                                  height: 85,
                                  width: 85,
                                  child: CircularProgressIndicator(
                                    color: data!.last?Colors.green:AppColor.darkBG3,

                                     strokeWidth: 5,
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: FloatingActionButton(
                                  onPressed: () =>viewModel.goNext(context),
                                     backgroundColor:data!.last?Colors.green:AppColor.darkBG3,
                                  child:  data!.last? Icon(Icons.check_outlined,color: AppColor.white,):  Icon(Icons.arrow_forward,color:AppColor.white),
                                ),
                              ),

                            ],
                          ),
                        ),
                      )
                    ],
                  ),

          ));
    }
  }
}

class ColumnData extends StatelessWidget {
  final SliderObject? sliderObject;
  const ColumnData({Key? key, this.sliderObject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Lottie.asset("${sliderObject?.image}",
              height: 350),
          const SizedBox(
            height: AppSizeMange.s40,
          ),
          Padding(
            padding: const EdgeInsets.all(AppPaddingSizeMange.p8),
            child: Text(
              "${sliderObject?.title}",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppPaddingSizeMange.p8),
            child: Text(
              "${sliderObject?.subTitle}",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
