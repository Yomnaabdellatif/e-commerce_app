import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../entities/RegisterResponseEntity.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failures,RegisterResponseEntity>>register({required name,required email,
    required rePassword,required password,required phone
  });

}