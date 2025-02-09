import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/RegisterResponseEntity.dart';
import 'package:ecommerce_app/domain/repository/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repository/auth/auth_repository.dart';
@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository{
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<Either<Failures, RegisterResponseEntity>> register
      ({required name, required email, required rePassword,
    required password, required phone})async {
   var either=await authRemoteDataSource.register(name: name, email: email, rePassword: rePassword, password: password, phone: phone);
  return either.fold((error)=>Left(error), (response)=>Right(response));
  }


}