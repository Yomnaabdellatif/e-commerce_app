import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/LoginResponseEntity.dart';
import 'package:ecommerce_app/domain/entities/RegisterResponseEntity.dart';

abstract class AuthRepository {
  Future<Either<Failures,RegisterResponseEntity>>register({required name,required email,
    required rePassword,required password,required phone
  });
  Future<Either<Failures,LoginResponseEntity>>login({required email,
    required password
  });
}