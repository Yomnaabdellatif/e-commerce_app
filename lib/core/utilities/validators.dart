class Validators {
  Validators._();
static String? validateEmail(String? value){
  RegExp emailRegex=RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  if(value==null){
    return "required";
  }
  else if(value.trim().isEmpty){
    return "required";
  }
  else if(emailRegex.hasMatch(value)==false){
    return "Enter Valid Email";
  }
  else {
    return null;
  }
  
}
  static String? validatePassword(String? value){
    RegExp passwordRegex=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if( value==null||value.trim().isEmpty){
      return "required Password";
    }
    else if(passwordRegex.hasMatch(value)==false){
      return " Password Should be Strong";
    }

    else if(value.length<8){
      return " Password  Must be 8 charters";
    }
    else {
      return null;
    }

  }

  static String? validateConfirmPassword(String? value,String? password){
    if( value==null||value.isEmpty){
      return "required Confirm Password";
    }

    else if(value!=password){
      return " Confirm Password not match with Password ";
    }
    else {
      return null;
    }

  }
  static String? validateUserName(String? value){
    RegExp userNameRegex=RegExp(r''
    r'^(?=.{4,20}$)(?:[a-zA-Z\d]+(?:(?:\.|-|_)[a-zA-Z\d])*)$');

    if( value==null||value.isEmpty){
      return "required UserName ";
    }
    else if(userNameRegex.hasMatch(value)==false){
      return "required Valid UserName ";

    }
    else {
      return null;
    }

  }
  static String? validateFullName(String? value){
    if( value==null||value.isEmpty){
      return "required FullName";
    }

    else {
      return null;
    }

  }
  static String? validatePhoneNumber(String? value){
    if( value==null||value.isEmpty){
      return "required Phone Number";
    }
    else if(value.trim().length!=11){
      return "Phone Number should be 11 digit";

    }
    else if(int.tryParse(value.trim())==null){
      return "Phone Number should Numbers only ";

    }

    else {
      return null;
    }

  }


}