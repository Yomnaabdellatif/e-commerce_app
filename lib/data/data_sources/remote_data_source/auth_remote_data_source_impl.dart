import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/api/api_manger.dart';
import 'package:ecommerce_app/core/api/end_points.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/data/model/RegisterResponseDM.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repository/data_sources/remote_data_source/auth_remote_data_source.dart';
@Injectable(as:AuthRemoteDataSource )
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  ApiManger apiManger;
  AuthRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<Either<Failures, RegisterResponseDm>> register({required name, required email, required rePassword, required password, required phone})
  async{
    try{
    final List<ConnectivityResult> connectivityResult=await Connectivity().checkConnectivity();
    if(connectivityResult.contains(ConnectivityResult.wifi)||connectivityResult.contains(ConnectivityResult.mobile)){
      var response=await apiManger.postData(endPoint: EndPoints.signUpEndPoint,
        data:{
          "name": name,
          "email":email,
          "password":password,
          "rePassword":rePassword,
          "phone":phone
        }, );
      var registerResponse= RegisterResponseDm.fromJson(response.data);
      if(response.statusCode!>=200&&response.statusCode!<300){
        return Right(registerResponse);

      }else{
        print(registerResponse.message);
        return Left(ServerError(errorMessage: registerResponse.message!));

      }
    }else {
      return Left(NetworkError(errorMessage: "No Internet Connection"));
    }}catch(e){
     return Left(ServerError(errorMessage: e.toString()));


    }

 
  }

}