

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:salaa/presentation/resource/language_manger.dart';
import 'package:shared_preferences/shared_preferences.dart';
const String prefsKeyWelcomeScreenView = "PREFS_KEY_WELCOME_SCREEN_VIEW";
const String prefsKeyOnBoardingScreenView = "PREFS_KEY_ONBOARD_SCREEN_VIEW";
const String prefsKeyIsUserLoggedIn = "PREFS_KEY_IS_USER_LOGGED_IN";
const String prefsKeyAccessToken = "PREFS_KEY_ACCESS_TOKEN";
const String prefsKeyName = "PREFS_KEY_NAME";
const String prefsKeyImage = "PREFS_KEY_IMAGE";
const String prefsKeyId = "prefsKeyId";
const String categoryKeyId = "categoryKeyId";
const String prefsKeyPhoneNumber = "PREFS_KEY_PHONE_NUMBER";
const String prefsKeyEmail = "prefsKeyEmail";
const String prefsKeyLanguage= "prefsKeyLanguage";
const String prefsKeyDarkMode= "prefsKeyDarkMode";


class AppPreferences {
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);

//Clear  data from application
 Future<void> removeData() async{
    _sharedPreferences.remove(prefsKeyAccessToken); //clear token
    _sharedPreferences.remove(prefsKeyName); //clear name
    _sharedPreferences.remove(prefsKeyImage); //clear image
    _sharedPreferences.remove(prefsKeyPhoneNumber); // clear phone
    _sharedPreferences.remove(prefsKeyIsUserLoggedIn); // clear bool data in login
    _sharedPreferences.remove(prefsKeyId); // clear id
    _sharedPreferences.remove(prefsKeyEmail); // clear id



    // _sharedPreferences.remove(prefsKeyWelcomeScreenView);
    // _sharedPreferences.remove(prefsKeyOnBoardingScreenView);
 }

  Future<void> removeUpdateData() async{
    _sharedPreferences.remove(prefsKeyAccessToken); //clear token
    _sharedPreferences.remove(prefsKeyName); //clear name
    _sharedPreferences.remove(prefsKeyImage); //clear image
    _sharedPreferences.remove(prefsKeyPhoneNumber); // clear phone
    _sharedPreferences.remove(prefsKeyId); // clear id
    _sharedPreferences.remove(prefsKeyEmail); // clear id



    // _sharedPreferences.remove(prefsKeyWelcomeScreenView);
    // _sharedPreferences.remove(prefsKeyOnBoardingScreenView);
  }

  Future<String> getAppLanguage()async{
   String? language =_sharedPreferences.getString(prefsKeyLanguage);
   if(language!=null && language.isNotEmpty){
     return language;
   }else{
     if(Platform.localeName=="ar_EG"){
       return LanguageType.arabic.getValue();
     }else{
       return LanguageType.english.getValue();
     }

   }
  }


  Future<void> changeAppLanguage()async{
   String currentLang=await getAppLanguage();
   if(currentLang==LanguageType.arabic.getValue()){
     _sharedPreferences.setString(prefsKeyLanguage, LanguageType.english.getValue());
   }else{
     _sharedPreferences.setString(prefsKeyLanguage, LanguageType.arabic.getValue());
   }
  }

  Future<Locale> getLocalAppLanguage()async{
    String currentLang=await getAppLanguage();
    if(currentLang==LanguageType.arabic.getValue()){
      return arabicLocal;
    }else{
     return englishLocal;
    }
  }

  Future<bool> isDarkMode() async {
   bool? dark=_sharedPreferences.getBool(prefsKeyDarkMode);
   if(dark!=null){
     return dark;
   }else{
     var brightness = SchedulerBinding.instance!.window.platformBrightness;
     if(brightness == Brightness.dark){
       return true;
     }else{
       return false;
     }

   }

  }


  Future<void> setDark() async {
   bool isDark=await isDarkMode();
   if(isDark ==true){
     await _sharedPreferences.setBool(prefsKeyDarkMode, false);
   }else{
     await _sharedPreferences.setBool(prefsKeyDarkMode, true);
   }
  }

  Future<bool> getDark()async{
    bool currentLang=await isDarkMode();
    if(currentLang==true){
      return true;
    }else{
      return false;
    }
  }





  //on Boarding screen
  Future<void> setOnBoardingScreenView() async {
   await _sharedPreferences.setBool(prefsKeyOnBoardingScreenView, true);
  }


  Future<bool> isOnBoardingScreenView() async {
    return _sharedPreferences.getBool(prefsKeyOnBoardingScreenView) ?? false;
  }

  //on Boarding screen
  Future<void> setWelcomeScreenView() async {
    await _sharedPreferences.setBool(prefsKeyWelcomeScreenView, true);
  }

  Future<bool> isWelcomeScreenView() async {
    return _sharedPreferences.getBool(prefsKeyWelcomeScreenView) ?? false;
  }

  //login screen data

  Future<void> setLoginScreenView() async {
   await _sharedPreferences.setBool(prefsKeyIsUserLoggedIn, true);
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(prefsKeyIsUserLoggedIn) ?? false;
  }

  Future<void> setCategoryId() async {
    await _sharedPreferences.setInt(categoryKeyId, 0);
  }

  Future<int> isCategoryId() async {
    return _sharedPreferences.getInt(categoryKeyId) ?? 0;
  }

  //set login screen data
  Future<void> setDataScreenData(
      {required String tokenValue,
        required String nameValue,
        required String phoneValue,
        required String imageValue,
        required String email,
        required int id,

      }) async {
   await _sharedPreferences.setString(prefsKeyAccessToken, tokenValue);
  await  _sharedPreferences.setString(prefsKeyName, nameValue);
  await  _sharedPreferences.setString(prefsKeyPhoneNumber, phoneValue);
  await  _sharedPreferences.setString(prefsKeyImage, imageValue);
   await  _sharedPreferences.setString(prefsKeyEmail, email);
   await _sharedPreferences.setInt(prefsKeyId, id);

  }


  String isAccessToken() {
    return  _sharedPreferences.getString(prefsKeyAccessToken) ?? "";
  }

  String isAccessEmail() {
    return  _sharedPreferences.getString(prefsKeyEmail) ?? "";
  }




  String isAccessName() {
    return _sharedPreferences.getString(prefsKeyName) ?? "";
  }

  String isAccessImage() {
    return _sharedPreferences.getString(prefsKeyImage) ?? "";
  }


  String isAccessPhoneNumber() {
    return _sharedPreferences.getString(prefsKeyPhoneNumber) ?? "";
  }



  int isAccessId() {
    return _sharedPreferences.getInt(prefsKeyId) ?? 0;
  }
}
