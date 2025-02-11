import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/LoginResponseEntity.dart';
import 'package:ecommerce_app/domain/repository/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class LoginUseCase {

  AuthRepository authRepository;
  LoginUseCase({required this.authRepository});
  Future<Either<Failures,LoginResponseEntity>>invoke({required email, required password}){

   return authRepository.login(email: email, password: password);

  }
}