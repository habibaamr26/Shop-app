

import 'package:dio/dio.dart';


class diohelper {
  static late Dio dio;

  static init()
  {
    dio=Dio(
      BaseOptions(
        baseUrl: "https://student.valuxapps.com/api/",                           // server name
        receiveDataWhenStatusError: true,

      )
    );
  }

 static Future<Response> getdata({
   required String path,
    Map<String, dynamic>? queryParameters,
   String lang="en",
   String? token,
})
{

  dio.options.headers={
    "lang":lang,
    "Authorization":token,
"Content-Type":"application/json"
  };
 return dio.get(path,queryParameters:queryParameters );
}


// give it email and oassword give me all data
  static Future<Response> Postdata({
    String lang="en",
    String? token,
    required String path,
    Map<String, dynamic>? queryParameters,
    required Map<String, dynamic>? data
  })
  {
    dio.options.headers={
      "lang":lang,
      "Authorization":token,
      "Content-Type":"application/json"
    };
    return dio.post(path,queryParameters:queryParameters,data: data );
  }



 static Future<Response> putdata({
    String lang="en",
    String? token,
    required String path,
    Map<String, dynamic>? queryParameters,
    required Map<String, dynamic>? data
  })
  {
    dio.options.headers={
      "lang":lang,
      "Authorization":token,
      "Content-Type":"application/json"
    };
    return dio.put(path,queryParameters:queryParameters,data: data );
  }
}