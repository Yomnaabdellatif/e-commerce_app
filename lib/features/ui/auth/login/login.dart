import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/utilities/app_assets.dart';
import 'package:ecommerce_app/core/utilities/app_colors.dart';
import 'package:ecommerce_app/core/utilities/app_styles.dart';
import 'package:ecommerce_app/core/utilities/dialog_utils.dart';
import 'package:ecommerce_app/core/utilities/validators.dart';
import 'package:ecommerce_app/features/ui/auth/login/cubit/login_view_model.dart';
import 'package:ecommerce_app/features/ui/home/home_screen.dart';
import 'package:ecommerce_app/features/ui/widgets/custom_elevated_button.dart';
import 'package:ecommerce_app/features/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../register/register.dart';
import 'cubit/login_states.dart';

class Login extends StatefulWidget {
  static const String routeName="login";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var viewModel=getIt<LoginViewModel>();

bool visbilityPassword=true;
  bool visbilityRePassword=true;


  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel,LoginStates>(
      bloc: viewModel,
      listener: (context,state){
        if(state is LoginLoading){
          DialogUtils.showLoading(context: context, message: "Loading To Login");

        }
        if(state is LoginSuccess){

DialogUtils.hideLoading(context);
DialogUtils.showMessage(context: context, message: "Login Success",posActionName: "Ok",posAction: (){
  Navigator.pushReplacementNamed(context, HomeScreen.routeName);
});

        }  if(state is LoginError){
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context: context, message: state.failures.errorMessage);

        }

      },
      child: Scaffold(backgroundColor: AppColors.primaryLight,
      appBar: AppBar(backgroundColor: AppColors.primaryLight,),
        body:
      SingleChildScrollView(
        child: Container(

          margin: EdgeInsets.only(left: 16.w,right: 16.w,bottom:16.h ),
          child: Form(
            key: viewModel.formKey,
            child: Column(spacing: 12.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.asset(AppAssets.routeImage)),
              Text("Email",style: AppStyles.bold16White,),
              CustomTextFormField(hintText: " Email",controller: viewModel.emailController,validator:
              Validators.validateEmail,),
              Text("Password",style: AppStyles.bold16White,),

              CustomTextFormField(hintText: "Password",controller: viewModel.passwordController,obscureText: visbilityPassword,
                suffixIcon: IconButton(icon: visbilityPassword?Image(image: AssetImage(AppAssets.iconUnShowPassword)): Icon(Icons.remove_red_eye,color: AppColors.gray,)
                  ,onPressed: (){

                  visbilityPassword=!visbilityPassword;
                  setState(() {

                  });

                },),
                validator:Validators.validatePassword ,),
            Text.rich(TextSpan(children: [TextSpan(text: "Don’t have an account?",style:AppStyles.bold16White ),
             TextSpan(text: " Create Account",style: AppStyles.bold16White,recognizer: TapGestureRecognizer()
               ..onTap = () {
                 Navigator.of(context).pushNamed(
                     Register.routeName);
               })

            ]))
            ,

            CustomElevatedButton(buttonLabel: "Sign In", onClick: viewModel.login)

            ],
            ),
          ),
        ),
      ),),
    );
  }
}
