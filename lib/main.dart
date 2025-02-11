import 'package:ecommerce_app/features/ui/auth/register/register.dart';
import 'package:ecommerce_app/features/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/di.dart';
import 'core/utilities/app_theme.dart';
import 'core/utilities/bloc_obsever.dart';
import 'features/ui/auth/login/login.dart';

void main(){
  configureDependencies();
  Bloc.observer = MyBlocObserver();

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
    designSize: Size(430,932),
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (context,child){

      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: Login.routeName,
        routes: {
          Register.routeName:(context)=>Register(),
          Login.routeName:(context)=>Login(),
      HomeScreen.routeName:(context)=>HomeScreen(),


        },);}





      );}}
