import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/CategoryResponseEntity.dart';
import 'package:ecommerce_app/domain/entities/ProductsResponseEntity.dart';
import 'package:ecommerce_app/domain/repository/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:ecommerce_app/domain/repository/home/home_repository.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:HomeRepository)
class HomeRepositoryImpl implements HomeRepository{
  HomeRemoteDataSource homeRemoteDataSource;
  HomeRepositoryImpl({required this.homeRemoteDataSource});
  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getCategories() async{
   var either=await homeRemoteDataSource.getCategories();
   return either.fold((error)=>Left(error), (response)=>Right(response));


  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands() async{
    var either=await homeRemoteDataSource.getAllBrands();
    return either.fold((error)=>Left(error), (response)=>Right(response));

  }

  @override
  Future<Either<Failures, ProductsResponseEntity>> getAllProducts() async{
    var either=await homeRemoteDataSource.getAllProducts();
    return either.fold((error)=>Left(error), (response)=>Right( response));

  }


}