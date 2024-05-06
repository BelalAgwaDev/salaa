import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:salaa/presentation/resource/app_size.dart';
import 'package:salaa/presentation/resource/color_manger.dart';
import 'package:salaa/presentation/resource/font_manger.dart';
import 'package:salaa/presentation/resource/style_manger.dart';

ThemeData getApplicationDarkTheme() {
  return ThemeData(
      scaffoldBackgroundColor: AppColor.dark,
      primaryColor: AppColor.dark,
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColor.dark,
          ),
          color: AppColor.dark,
          elevation: 0,
          titleTextStyle: TextStyle(
              color: AppColor.darkBG3,
              fontSize: FontSizeManger.s22,
              fontWeight: FontWeightManger.semiBold),
          iconTheme: IconThemeData(color: AppColor.darkBG3, size: 32)),
      //text theme
      textTheme: TextTheme(
        displayLarge:
            getBoldStyle(fontSize: FontSizeManger.s26, color: AppColor.white),
        bodyLarge: getRegularStyle(
            fontSize: FontSizeManger.s18, color: AppColor.white),
        bodySmall:
            getBoldStyle(fontSize: FontSizeManger.s24, color: AppColor.white),
        displayMedium:
            getBoldStyle(fontSize: FontSizeManger.s18, color: AppColor.white),
        displaySmall:
            getBoldStyle(fontSize: FontSizeManger.s40, color: AppColor.white),
        bodyMedium:
            getBoldStyle(fontSize: FontSizeManger.s26, color: AppColor.white),
        labelSmall:
            getBoldStyle(fontSize: FontSizeManger.s14, color: AppColor.white),
        labelMedium:
            getBoldStyle(fontSize: FontSizeManger.s20, color: AppColor.white),
        labelLarge:
            getBoldStyle(fontSize: FontSizeManger.s20, color: AppColor.white),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColor.darkBG3, elevation: 20),
      cardColor: AppColor.dark,

      //elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        foregroundColor: AppColor.white,
        textStyle: getBoldStyle(
          fontSize: FontSizeManger.s13,
          color: AppColor.darkBG3,
        ),
        disabledForegroundColor: AppColor.darkBG3.withOpacity(0.38),
        disabledBackgroundColor: AppColor.darkBG3.withOpacity(0.12),
        backgroundColor: AppColor.darkBG3,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizeMange.s24)),
        fixedSize: const Size.fromHeight(48),
      )),

      /// input decoration theme ( text form field )
      inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: Colors.white60,
        //Content padding
        contentPadding: const EdgeInsets.all(15),

        //label text style
        labelStyle:
            getMediumStyle(fontSize: FontSizeManger.s12, color: AppColor.white),

        //hint style
        hintStyle: getRegularStyle(
            fontSize: FontSizeManger.s12, color: AppColor.white),

        //error style
        errorStyle:
            getRegularStyle(fontSize: FontSizeManger.s10, color: AppColor.red),

        //background color
        filled: true,
        fillColor: AppColor.dark,

        //focused border style
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[700]!),
            borderRadius: BorderRadius.circular(AppSizeMange.s18)),

        //enable border style
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizeMange.s10),
            borderSide: BorderSide(
                color: Colors.grey[700]!, width: AppPaddingSizeMange.p0_2)),

        //error border style
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppPaddingSizeMange.p12),
            borderSide: BorderSide(
                color: AppColor.red, width: AppPaddingSizeMange.p0_2)),

        // error focused border style
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppPaddingSizeMange.p12),
            borderSide: BorderSide(
                color: AppColor.red, width: AppPaddingSizeMange.p0_2)),
      ));
}
