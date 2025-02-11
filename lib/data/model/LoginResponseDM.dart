import 'package:ecommerce_app/domain/entities/LoginResponseEntity.dart';

class LoginResponseDm extends LoginResponseEntity{
  LoginResponseDm({
      super.message,
    super.user,
    super.token,});

  LoginResponseDm.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? LoginUserDM.fromJson(json['user']) : null;
    token = json['token'];
  }



}

class LoginUserDM extends LoginUserEntity {
  LoginUserDM({
      super.name,
      super.email,
      this.role,});

  LoginUserDM.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
  String? role;



}