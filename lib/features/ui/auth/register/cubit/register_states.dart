import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/RegisterResponseEntity.dart';

abstract class RegisterStates {}
class RegisterInitial extends RegisterStates{}

class RegisterLoading extends RegisterStates{}
class RegisterError extends RegisterStates{
  Failures failures;
  RegisterError({required this.failures});
}
class RegisterSuccess extends RegisterStates{
  RegisterResponseEntity responseEntity;
  RegisterSuccess({required this.responseEntity});
}