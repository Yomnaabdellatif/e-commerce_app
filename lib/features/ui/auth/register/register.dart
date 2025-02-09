import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/utilities/app_assets.dart';
import 'package:ecommerce_app/core/utilities/app_colors.dart';
import 'package:ecommerce_app/core/utilities/app_styles.dart';
import 'package:ecommerce_app/core/utilities/dialog_utils.dart';
import 'package:ecommerce_app/core/utilities/validators.dart';
import 'package:ecommerce_app/features/ui/auth/register/cubit/register_states.dart';
import 'package:ecommerce_app/features/ui/auth/register/cubit/register_view_model.dart';
import 'package:ecommerce_app/features/ui/widgets/custom_elevated_button.dart';
import 'package:ecommerce_app/features/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends StatefulWidget {
  static const String routeName="reg";

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var viewModel=getIt<RegisterViewModel>();

bool visbilityPassword=true;
  bool visbilityRePassword=true;


  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel,RegisterStates>(
      bloc: viewModel,
      listener: (context,state){
        if(state is RegisterLoading){
          DialogUtils.showLoading(context: context, message: "Loading");

        }
        if(state is RegisterSuccess){

DialogUtils.hideLoading(context);
DialogUtils.showMessage(context: context, message: "Success Register");

        }  if(state is RegisterError){
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
              Text("Full name",style: AppStyles.bold16White,),
              CustomTextFormField(hintText: "Full name",controller: viewModel.nameController,validator: Validators.validateFullName,),
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
              Text("re-Password",style: AppStyles.bold16White,),

              CustomTextFormField(hintText: "re-Password",controller: viewModel.rePasswordController,obscureText: visbilityRePassword
                  ,validator:(value)=>
                Validators.validateConfirmPassword(value,viewModel.passwordController.text),
                suffixIcon:  IconButton(icon: visbilityRePassword? Image(image: AssetImage(AppAssets.iconUnShowPassword)): Icon(Icons.remove_red_eye,color: AppColors.gray,)
                  ,onPressed: (){
                    visbilityRePassword=!visbilityRePassword;
                    setState(() {

                    });

                  },),

              ),
                Text("Phone",style: AppStyles.bold16White,),

                CustomTextFormField(hintText: "Phone",controller: viewModel.phoneController,keyBoardType: TextInputType.phone,validator: Validators.validatePhoneNumber,),
            CustomElevatedButton(buttonLabel: "Sign up", onClick: viewModel.register)

            ],
            ),
          ),
        ),
      ),),
    );
  }
}
