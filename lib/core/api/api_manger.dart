import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/api/api_cosntants.dart';
import 'package:injectable/injectable.dart';
@singleton
class ApiManger {
  final dio=Dio();
  Future<Response> getData({
   required String endPoint,
    Map<String, dynamic>? queryParameters,   Options? options,
    Map<String, dynamic>? headers

  }){
    return dio.get(ApiConstants.baseUrl+endPoint,
    queryParameters: queryParameters,options: Options(validateStatus:(status)=>true,headers: headers ),);

  }

  Future<Response> postData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,   Options? options,  Object? data,Map<String, dynamic>? headers

  }){
    return dio.post("${ApiConstants.baseUrl}$endPoint",data: data,

        queryParameters: queryParameters,options: Options(validateStatus: (status)=>true,headers:headers ));

  }
}