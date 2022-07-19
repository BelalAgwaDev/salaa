
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:salaa/presentation/resource/app_size.dart';
import 'package:salaa/presentation/resource/color_manger.dart';
import 'package:salaa/presentation/resource/font_manger.dart';

import '../../../app/app_prefs.dart';
import '../../../app/di.dart';
import '../../resource/image_manger.dart';
import '../../resource/strings_manger.dart';
import '../../resource/style_manger.dart';


enum StateRenderType {
  //popup states (Dialog)
  popupLoadingState,
  popupErrorState,
  popupSuccessState,
  popupInternetConnectionState,
  popupLoadingAiState,
  popupMatchingAiState,
  popupNoMatchingAiState,
  //FULL SCREEN STATED (FULL SCREEN)
  fullScreenLoadingState,
  fullScreenErrorState,
  fullScreenEmptyState,
  fullScreenInternetConnectionState,

  //general
  contentState,
}

class StateRender extends StatefulWidget {
  final StateRenderType stateRenderType;
  final String message;
  final String title;
  final Function retryActionFunction;

  const StateRender({
    Key? key,
    required this.stateRenderType,
    required this.message,
    required this.retryActionFunction,
    this.title = "",
  }) : super(key: key);

  @override
  State<StateRender> createState() => _StateRenderState();
}

class _StateRenderState extends State<StateRender> {
  final AppPreferences _appPreferences =instance<AppPreferences>();


  static bool alreadySaved =false;

  @override
  void didChangeDependencies() {
    _appPreferences.getDark().then((value) => {    setState(() {alreadySaved = value;})});
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context) {
    switch (widget.stateRenderType) {
      case StateRenderType.popupLoadingState:
        return _getPopUpDialog(context, [
          _getAnimatedImage(AppJson.loadFullScreen),
        ]);

      case StateRenderType.popupLoadingAiState:
        return _getPopUpDialog(context, [
          _getAnimatedImage(AppJson.ai),
        ]);

      case StateRenderType.popupSuccessState:
        return _getPopUpDialog(context, [
          _getAnimatedImage(AppJson.success),
        ]);

      case StateRenderType.popupInternetConnectionState:
        return _getPopUpDialog(context, [
          _getAnimatedImage(AppJson.noInternet),
          _getMessage(widget.message),
          _getRetryButton(buttonTitle: AppStrings.ok.tr(), context: context),
        ]);

      case StateRenderType.popupMatchingAiState:
        return _getPopUpDialog(context, [
          _getAnimatedImage(AppJson.success),
          _getMessage(widget.message),
          _getRetryButton(buttonTitle: AppStrings.ok.tr(), context: context),
        ]);

      case StateRenderType.popupNoMatchingAiState:
        return _getPopUpDialog(context, [
          _getAnimatedImage(AppJson.noMatch),
          _getMessage(widget.message),
          _getRetryButton(buttonTitle: AppStrings.ok.tr(), context: context),
        ]);

      case StateRenderType.popupErrorState:
        return _getPopUpDialog(context, [
          _getAnimatedImage(AppJson.error),
          _getMessage(widget.message),
          _getRetryButton(buttonTitle: AppStrings.ok.tr(), context: context),
        ]);

      case StateRenderType.fullScreenLoadingState:
        return _getItemColumn([
          _getAnimatedImage(AppJson.boyError),
          _getMessage(widget.message),
        ]);

      case StateRenderType.fullScreenInternetConnectionState:
        return _getItemColumn([
          _getAnimatedImage(AppJson.noInternet),
          _getMessage(widget.message),
          _getRetryButton(
              buttonTitle: AppStrings.retryAgain.tr(),
              context: context,
              size: AppPaddingSizeMange.p12),
        ]);

      case StateRenderType.fullScreenErrorState:
        return _getItemColumn([
          _getAnimatedImage(AppJson.error),
          _getMessage(widget.message),
          _getRetryButton(
              buttonTitle: AppStrings.retryAgain.tr(),
              context: context,
              size: AppPaddingSizeMange.p12),
        ]);

      case StateRenderType.fullScreenEmptyState:
        return _getItemColumn([
          _getAnimatedImage(AppJson.empty),
          _getMessage(widget.message),
          _getRetryButton(
              buttonTitle: AppStrings.retryAgain.tr(),
              context: context,
              size: AppPaddingSizeMange.p22),
        ]);
      case StateRenderType.contentState:
        return Container();

      default:
        return Container();
    }
  }

  Widget _getItemColumn(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getPopUpDialog(BuildContext context, List<Widget> children) {

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppPaddingSizeMange.p8),
      ),
      elevation: AppSizeMange.s2,
      backgroundColor: AppColor.transparent,
      child: Container(
        decoration: BoxDecoration(
          color:alreadySaved? AppColor.dark:AppColor.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(AppSizeMange.s14),
          boxShadow: const [BoxShadow(color: Colors.black26)],
        ),
        child: _getDialogContent(context, children),
      ),
    );
  }

  Widget _getDialogContent(BuildContext context, List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getAnimatedImage(String animationName) {
    return SizedBox(
      height: AppSizeMange.s200,
      width: AppSizeMange.s300,
      child: Lottie.asset(
        animationName,
      ),
    );
  }

  Widget _getMessage(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPaddingSizeMange.p8),
        child: Text(message,
            style: getMediumStyle(
                fontSize: FontSizeManger.s12, color: AppColor.darkBG3)),
      ),
    );
  }

  Widget _getRetryButton(
      {required String buttonTitle,
      required BuildContext context,
      double size = AppPaddingSizeMange.p12}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  if (widget.stateRenderType == StateRenderType.popupErrorState ||
                      widget.stateRenderType ==
                          StateRenderType.popupInternetConnectionState ||
                      widget.stateRenderType == StateRenderType.popupNoMatchingAiState ||
                      widget.stateRenderType == StateRenderType.popupMatchingAiState) {
                    // popup error state
                    Navigator.of(context).pop();
                  } else {
                    //call retry function
                    widget.retryActionFunction.call();
                  }
                },
                child: Text(buttonTitle))),
      ),
    );
  }
}
