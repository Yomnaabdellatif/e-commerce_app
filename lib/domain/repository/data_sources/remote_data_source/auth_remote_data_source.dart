import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../entities/LoginResponseEntity.dart';
import '../../../entities/RegisterResponseEntity.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failures,RegisterResponseEntity>>register({required name,required email,
    required rePassword,required password,required phone
  });
  Future<Either<Failures,LoginResponseEntity>>login({required email,
    required password
  });

}