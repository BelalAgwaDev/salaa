import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../app/app_prefs.dart';
import '../../../app/constant.dart';

const String applicationJson = 'application/json';
const String contentType = "Content-Type";
const String accept = "Accept";
const String authorization = 'Authorization';
const String lang = 'lang';

class DioFactory {
  final AppPreferences _appPreferences;
  DioFactory(this._appPreferences);

  Future<Dio> getDio() async {
    Dio dio = Dio();

    String language =await _appPreferences.getAppLanguage();
    // one min time out
    Map<String, String> headers = {
      contentType: applicationJson,
      accept: applicationJson,
      lang:language,
      authorization: _appPreferences.isAccessToken(),
    };

    dio.options = BaseOptions(
      responseType: ResponseType.plain,
      baseUrl: Constant.baseUrl,
      headers: headers,
      receiveDataWhenStatusError: true,
      sendTimeout: Constant.apiTimeOut,
      receiveTimeout: Constant.apiTimeOut,
      connectTimeout: Constant.apiTimeOut,
    );

    if (!kReleaseMode) {
      //its debug mode so print app logs
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true, requestBody: true, responseHeader: true));
    }

    return dio;
  }
}
