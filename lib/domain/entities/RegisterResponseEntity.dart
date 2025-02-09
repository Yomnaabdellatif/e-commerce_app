/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"yomna1@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YTY1ZjdmZmE3ODk1ZTgxZjE1MWU0ZSIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzM4OTU2NjcxLCJleHAiOjE3NDY3MzI2NzF9.gx67srRvI0dw_G1EzOGbzrOqZTPZsm5X81AN7n7u34w"

class RegisterResponseEntity {
  RegisterResponseEntity({
      this.message, 
      this.user, 
      this.token,
     this.statusMsg

  });


  String? message;
  UserEntity? user;
  String? token;
  String? statusMsg;


}

/// name : "Ahmed Abd Al-Muti"
/// email : "yomna1@gmail.com"
/// role : "user"

class UserEntity {
  UserEntity({
      this.name, 
      this.email, 
  });

  String? name;
  String? email;
}