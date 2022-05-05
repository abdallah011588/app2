
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
class dioHelper {

  static late Dio dio;
  //https://newsapi.org/
  // v2/everything?
  // q=tesla&from=2022-01-13&sortBy=publishedAt&apiKey=API_KEY
  static init(){
    dio=Dio(
        BaseOptions(
          baseUrl: 'https://student.valuxapps.com/api/',//'https://newsapi.org/',//'https://student.valuxapps.com/api/',
          receiveDataWhenStatusError: true,
          connectTimeout: 5000,
          receiveTimeout: 3000,
        ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String,dynamic>? query,
    String lang = 'en',
    String? token,

  })async
  {
    /*Dio().get(
    url, options: Options(
    method: "GET", headers: { "Authorization": "Bearer ${LocalStorage().getString(Keys.token)}", }
    ))
    );*/
    dio.options.headers =
    {
      'lang': lang,
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };

    return await dio.get(url,queryParameters: query);
  }



  static Future<Response> posData({
     required String url,
     required Map<String ,dynamic> data,
     Map<String ,dynamic>? query,
     String lang='en',
     String? token,
  })async
  {
    dio.options.headers={
      'lang' : lang,
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
      };

    return await dio.post(
        url,
        queryParameters: query,
        data: data
    );
  }




  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String ?token,
  }) async
  {
    dio.options.headers =
    {
      'lang': lang,
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };

    return dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }



}