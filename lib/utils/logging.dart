import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Logging extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    EasyLoading.show(status: 'Loading...');
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    EasyLoading.dismiss();
    if(response.statusCode == 400){
      Fluttertoast.showToast(msg: "Show Message");
    } else if (response.statusCode == 500){
        Fluttertoast.showToast(msg: "Show Message");
    }else if (response.statusCode == 503){
        Fluttertoast.showToast(msg: "Show Message");
    }
    else if (response.statusCode == 403){
        Fluttertoast.showToast(msg: "Show Message");
    } 
     else if (response.statusCode == 404){
        Fluttertoast.showToast(msg: "Please try again, encountered error 404");
    }else{
      // Fluttertoast.showToast(msg: "Show Message");
    }
    print(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    EasyLoading.dismiss();
    print(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    return super.onError(err, handler);
  }
}
