import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salaa/presentation/resource/app_size.dart';
import 'package:salaa/presentation/resource/color_manger.dart';
import 'package:salaa/presentation/resource/font_manger.dart';
import 'package:salaa/presentation/resource/style_manger.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColor.white,
   primaryColor: AppColor.darkBG3,
      brightness: Brightness.light,

   appBarTheme: AppBarTheme(
       systemOverlayStyle:  SystemUiOverlayStyle(
         statusBarColor: AppColor.white,
         statusBarBrightness: Brightness.dark
       ),
     color: AppColor.white,
     elevation: 0,
       titleTextStyle: TextStyle(
       color: AppColor.darkBG3,
         fontSize: FontSizeManger.s22,
           fontWeight: FontWeightManger.semiBold
   ),
       iconTheme: IconThemeData(
         color:  AppColor.darkBG3,
         size: 32
       )
   ),
   //text theme
      textTheme: TextTheme(
          displayLarge: getBoldStyle(fontSize: FontSizeManger.s26, color: AppColor.darkFont),
        bodyLarge  : getRegularStyle(fontSize: FontSizeManger.s18, color: AppColor.grayFont),
        bodySmall  : getBoldStyle(fontSize: FontSizeManger.s24, color: AppColor.darkFont),
        displayMedium: getBoldStyle(fontSize: FontSizeManger.s18, color: AppColor.white),
        displaySmall: getBoldStyle(fontSize: FontSizeManger.s40, color: AppColor.darkFont),
        bodyMedium: getBoldStyle(fontSize: FontSizeManger.s26, color: AppColor.darkBG3),
        labelSmall: getBoldStyle(fontSize: FontSizeManger.s14, color: AppColor.white),
        labelMedium: getBoldStyle(fontSize: FontSizeManger.s20, color: AppColor.darkFont),
        labelLarge: getBoldStyle(fontSize: FontSizeManger.s20, color: AppColor.darkGrayFont),
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColor.darkBG3,
        elevation: 20
      ),


    //elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: getBoldStyle(
            fontSize: FontSizeManger.s13,
            color: AppColor.darkBG3,
          ),
          primary: AppColor.darkBG3,
          onPrimary: AppColor.white,
          onSurface: AppColor.darkBG3,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizeMange.s24)),
          fixedSize: const Size.fromHeight(AppPaddingSizeMange.p50),
        )),


      /// input decoration theme ( text form field )
      inputDecorationTheme: InputDecorationTheme(
        //Content padding
        contentPadding: const EdgeInsets.all(AppPaddingSizeMange.p19),

        //label text style
        labelStyle: getMediumStyle(
            fontSize: FontSizeManger.s12, color: AppColor.darkBG3),

        //hint style
        hintStyle: getRegularStyle(
            fontSize: FontSizeManger.s12, color: AppColor.lightGrey),

        //error style
        errorStyle: getRegularStyle(
            fontSize: FontSizeManger.s10, color: AppColor.red),



        //background color
        filled: true,
        fillColor: AppColor.white,

        //focused border style
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.darkBG3),
            borderRadius: BorderRadius.circular(
                AppSizeMange.s18
            )),


        //enable border style
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                AppSizeMange.s10
            ),
            borderSide:
            BorderSide(color: AppColor.darkBG3, width: AppPaddingSizeMange.p0_2)),

        //error border style
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppPaddingSizeMange.p12),
            borderSide:
            BorderSide(color: AppColor.red, width: AppPaddingSizeMange.p0_2)),


        // error focused border style
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppPaddingSizeMange.p12),
            borderSide:
            BorderSide(color: AppColor.red, width: AppPaddingSizeMange.p0_2)),
      )


  );







}