import 'package:ecommerce_app/features/ui/auth/register/register.dart';
import 'package:flutter/material.dart';

import 'core/utilities/app_theme.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: Register.routeName,
      routes: {
        Register.routeName:(context)=>Register()
      },





    );
  }
}
