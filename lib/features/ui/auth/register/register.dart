import 'package:ecommerce_app/core/utilities/app_assets.dart';
import 'package:ecommerce_app/core/utilities/app_colors.dart';
import 'package:ecommerce_app/core/utilities/app_styles.dart';
import 'package:ecommerce_app/features/ui/widgets/custom_elevated_button.dart';
import 'package:ecommerce_app/features/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  static const String routeName="reg";
  const Register({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.primaryLight,
appBar: AppBar(backgroundColor: AppColors.primaryLight,),
      body:
    SingleChildScrollView(
      child: Container(

        margin: EdgeInsets.symmetric(horizontal: 10 ),
        child: Column(spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(AppAssets.routeImage)),
          Text("Full name",style: AppStyles.bold16White,),
          CustomTextFormField(hintText: "Full name"),
          Text("Email",style: AppStyles.bold16White,),
          CustomTextFormField(hintText: " Email"),
          Text("Password",style: AppStyles.bold16White,),
      
          CustomTextFormField(hintText: "Password"),
          Text("re-Password",style: AppStyles.bold16White,),
      
          CustomTextFormField(hintText: "re-Password"),
        CustomElevatedButton(buttonLabel: "Sign up", onClick: onClick)
      
        ],
        ),
      ),
    ),);
  }

  onClick() {
  }
}
