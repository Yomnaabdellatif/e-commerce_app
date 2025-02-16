import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/api/api_manger.dart';
import 'package:ecommerce_app/core/api/end_points.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/data/model/CategoryResponseDM.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repository/data_sources/remote_data_source/home_remote_data_source.dart';
import '../../model/ProductResponseDM.dart';
@Injectable(as:HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource{
  ApiManger apiManger;

  HomeRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<Either<Failures, CategoryOrBrandResponseDm>> getCategories() async{
    try{
      final List<ConnectivityResult> connectivityResult=await Connectivity().checkConnectivity();
      if(connectivityResult.contains(ConnectivityResult.wifi)||connectivityResult.contains(ConnectivityResult.mobile)){
        var response=await apiManger.getData(endPoint: EndPoints.getAllCategoriesEndPoint,);
    
        var categoryResponse= CategoryOrBrandResponseDm.fromJson(response.data);
        if(response.statusCode!>=200&&response.statusCode!<300){
          return Right(categoryResponse);

        }else{
          print(categoryResponse.message);
          return Left(ServerError(errorMessage: categoryResponse.message!));

        }
      }else {
        return Left(NetworkError(errorMessage: "No Internet Connection"));
      }}catch(e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseDm>> getAllBrands()async {
    try{
      final List<ConnectivityResult> connectivityResult=await Connectivity().checkConnectivity();
      if(connectivityResult.contains(ConnectivityResult.wifi)||connectivityResult.contains(ConnectivityResult.mobile)){
        var response=await apiManger.getData(endPoint: EndPoints.getAllBrandsEndPoint,);

        var categoryResponse= CategoryOrBrandResponseDm.fromJson(response.data);
        if(response.statusCode!>=200&&response.statusCode!<300){
          return Right(categoryResponse);

        }else{
          print(categoryResponse.message);
          return Left(ServerError(errorMessage: categoryResponse.message!));

        }
      }else {
        return Left(NetworkError(errorMessage: "No Internet Connection"));
      }}catch(e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, ProductResponseDm>> getAllProducts() async{
    try{
      final List<ConnectivityResult> connectivityResult=await Connectivity().checkConnectivity();
      if(connectivityResult.contains(ConnectivityResult.wifi)||connectivityResult.contains(ConnectivityResult.mobile)){
        var response=await apiManger.getData(endPoint: EndPoints.getAllProductsEndPoint,);

        var productResponse= ProductResponseDm.fromJson(response.data);
        if(response.statusCode!>=200&&response.statusCode!<300){
          return Right(productResponse);

        }else{
          print(productResponse.message);
          return Left(ServerError(errorMessage: productResponse.message!));

        }
      }else {
        return Left(NetworkError(errorMessage: "No Internet Connection"));
      }}catch(e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }





}
