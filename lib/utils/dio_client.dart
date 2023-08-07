import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:momma_connect/consts.dart';

// import 'package:momma_connect/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unicon/screens/sign.dart';
import 'package:unicon/utils/api.dart';
import 'package:unicon/utils/logging.dart';
import 'package:unicon/utils/themestyling.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      // baseUrl: API.baseURL + 'Controllers/',
      baseUrl: API.baseURL,
      // connectTimeout: 5000,
      // receiveTimeout: 30000,
    ),
  )..interceptors.add(Logging());

  // logout(context) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   final int? lastDay = preferences.getInt('lastDay');
  //   var _email = preferences.getString("email") ?? "";
  //  //  var _remeberMe = preferences.getBool("remember_me") ?? false;
  //   await preferences.clear();
  //   // if(lastDay != null){
  //   //   preferences.setInt("lastDay", lastDay);
  //   // }
  //   // if (_remeberMe) {
  //   //   preferences.setString("email", _email);
  //   //   preferences.setBool("remember_me", _remeberMe);
  //   // }
  //   // DefaultValues.themeColor = const Color(0xff7762FF);
  //   // DefaultValues.buttonTheme = const Color(0xffD662FF);
  //   // DefaultValues.colorName = "Purple";
  //    DefaultValues.cookieJar.deleteAll();
  //   Fluttertoast.showToast(msg: "Session timedout, Please login again");
  //   await Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
  //       MaterialPageRoute(builder: (context) => const SignIn()),
  //       (route) => false);
  // }

  Future<Data?> login({
    required String URL,
    dynamic data,
    String? action,
  }) async {
    Data? apiResponse;
    var response;
    _dio.interceptors.add(CookieManager(DefaultValues.cookieJar));
    try {
      response = await _dio.post(URL, data: data);
      apiResponse = Data.fromJson(response.data);
    } catch (e) {
      Fluttertoast.showToast(msg: "Please try again, Server not responding");
    }

    return apiResponse;
  }


  Future<Data?> fetch(
      {required String URL,
      dynamic data,
        dynamic? options,
      String? action,
      required BuildContext context}) async {
    Data? apiResponse;
    var response;
    _dio.interceptors.add(CookieManager(DefaultValues.cookieJar));

    try {
      if (action == "POST") {
        response = await _dio.post(URL, data: data, options: options);
      } else if (action == "GET") {
        response = await _dio.get(URL, queryParameters: data, options: options);
      }
      apiResponse = Data.fromJson(response.data);
      // response = await _dio.get(URL + ".ashx", queryParameters: data);
    } on DioError catch (dioError) {
      if (dioError.type == DioErrorType.response) {
        switch (dioError.response!.statusCode) {
          case 401:
           // logout(context);
            break;
        }
      } else if (dioError.type == DioErrorType.other) {
        Fluttertoast.showToast(msg: "Connection lost, Please try again");
      }
    } catch (e) {
      print(e);
      Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const Sign()),
          ModalRoute.withName('/signIn'));
    }

    return apiResponse;
  }
}