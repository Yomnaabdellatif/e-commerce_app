import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/repository/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../core/errors/failures.dart';
import '../entities/RegisterResponseEntity.dart';
@injectable
class RegisterUseCase {
  AuthRepository authRepository;
  RegisterUseCase({required this.authRepository});
  Future<Either<Failures, RegisterResponseEntity>> invoke({required name,required email,
    required rePassword,required password,required phone
  }){
   return authRepository.register(name: name, email: email,
        rePassword: rePassword, password: password, phone: phone);
  }
}