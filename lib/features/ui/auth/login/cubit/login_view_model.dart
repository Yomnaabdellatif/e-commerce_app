import 'package:ecommerce_app/domain/use_cases/login_use_case.dart';
import 'package:ecommerce_app/features/ui/auth/login/cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class LoginViewModel extends Cubit<LoginStates>{
  LoginUseCase loginUseCase;
  LoginViewModel({required this.loginUseCase}):super(LoginInitial());
  var formKey =GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController(text: "yomna@gmail.com");
  TextEditingController   passwordController=TextEditingController(text: "12345Asdf@");
void login()async{
  if(formKey.currentState?.validate()==true){
    emit(LoginLoading());
    var either=await loginUseCase.invoke(email: emailController.text, password: passwordController.text);
    either.fold((error){
      emit(LoginError(failures: error));
    }, (response){
      emit(LoginSuccess(responseEntity: response));
    });

  }
}
}