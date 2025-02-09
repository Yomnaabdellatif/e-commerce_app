import 'package:ecommerce_app/domain/entities/RegisterResponseEntity.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"yomna1s@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YTY3YzIwZmE3ODk1ZTgxZjE3NGNmOSIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzM4OTY0MDAwLCJleHAiOjE3NDY3NDAwMDB9.VLC8KaUws1gnuUznc6AkkSsuPShwpGJwff5TWS1z8oI"

class RegisterResponseDm extends RegisterResponseEntity{
  RegisterResponseDm({
      super.message,
      super.user,
      super.token,
      super.statusMsg
  });

  RegisterResponseDm.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }


}

/// name : "Ahmed Abd Al-Muti"
/// email : "yomna1s@gmail.com"
/// role : "user"

class User extends UserEntity {
  User({
      super.name,
      super.email,
      this.role,});

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? role;


}