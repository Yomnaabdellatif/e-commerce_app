import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/LoginResponseEntity.dart';

abstract class LoginStates {}
class LoginInitial extends LoginStates{}

class LoginLoading extends LoginStates{}
class LoginError extends LoginStates{
  Failures failures;
  LoginError({required this.failures});
}
class LoginSuccess extends LoginStates{
  LoginResponseEntity responseEntity;
  LoginSuccess({required this.responseEntity});
}