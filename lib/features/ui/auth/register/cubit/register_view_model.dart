import 'package:ecommerce_app/domain/use_cases/register_use_case.dart';
import 'package:ecommerce_app/features/ui/auth/register/cubit/register_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class RegisterViewModel extends Cubit<RegisterStates>{
  RegisterUseCase registerUseCase;
  RegisterViewModel({required this.registerUseCase}):super(RegisterInitial());
  TextEditingController nameController=TextEditingController(text: "yomna");
  TextEditingController emailController=TextEditingController(text: "yomna@gmail.com");
  TextEditingController rePasswordController=TextEditingController(text: "12345Asdf@");
  TextEditingController passwordController=TextEditingController(text: "12345Asdf@");
  TextEditingController phoneController=TextEditingController(text: "01275258565");
  var formKey =GlobalKey<FormState>();


  void register()async{
    if(formKey.currentState?.validate()==true){
    emit(RegisterLoading());
   var either=await  registerUseCase.invoke(name: nameController.text,
        email: emailController.text,
        rePassword: rePasswordController.text,
        password: passwordController.text,
        phone: phoneController.text);
   either.fold((error){
     emit(RegisterError(failures: error));
   }, (response){
     emit(RegisterSuccess(responseEntity: response));
   });
  }}
}