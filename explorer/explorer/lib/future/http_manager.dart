
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class HTTPManager {

  // HTTPMethod {
  //   case GET
  //   case POST
  // }
  
  static Dio _dio = Dio();

  static Future<Response> get(String url, Map<String, dynamic>? queryParameters) {
    return _dio.get(url, queryParameters: queryParameters);
  }

  // static Future<Response> post(String url, Map<String, dynamic>? queryParameters, dynamic data) {
  //   return getDioInstance().post(url);
  // }

  // static Future<Response> sendRequest(HTTPMethod method, String url, Map<String, dynamic>? queryParameters, dynamic data) {
  //   return getDioInstance().post(url);
  // }
}

void start_request(){
  final dio = Dio();
  var downloadURL = "https://edu-files-1251502357.cos.ap-shanghai.myqcloud.com/CourseTeacher_2.8.1.13_DailyBuild.dmg";
  dio
      .download(downloadURL, "/User/niegaotao/Desktop/腾讯课堂.dmg", onReceiveProgress:(int count, int total){
    if(total > 0){
      print("count=$count, total=$total");
    }
      })
      .then((value){print("$value");})
      .whenComplete((){
        print("结束了");})
      .catchError((error){
        print(error);
      });
}