
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_styles.dart';

class AppTheme {

  static final ThemeData lightTheme=ThemeData(
    primaryColor: AppColors.primaryLight,
    scaffoldBackgroundColor:AppColors.white,
      bottomNavigationBarTheme:
      BottomNavigationBarThemeData(
        elevation: 0,
        showUnselectedLabels: true,
          selectedLabelStyle: AppStyles.bold12White,
        unselectedLabelStyle: AppStyles.bold12White,
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.white,
      iconTheme: IconThemeData(color: AppColors.primaryLight))



  );



}