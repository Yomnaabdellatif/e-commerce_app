
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utilities/app_colors.dart';
import '../../../core/utilities/app_styles.dart';


class CustomElevatedButton extends StatelessWidget {
  Widget? icon;
  String buttonLabel;
  TextStyle? labelStyle;
  Color backgroundColor;
Function onClick;
  CustomElevatedButton({
    this.backgroundColor=AppColors.white,
    this.labelStyle,
    required this.buttonLabel,
 this.icon,
    required this.onClick
   });

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(onPressed: (){
      onClick();
    },
        style: ElevatedButton.
    styleFrom(backgroundColor:backgroundColor,elevation: 0,
            disabledBackgroundColor: AppColors.transparent,overlayColor:AppColors.transparent
            ,padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 40.w),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35.r),

        ) ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
    children: [
      icon?? SizedBox(),
      SizedBox(width: 5.w,),
      Text(buttonLabel,style:labelStyle ?? AppStyles.semi20primaryLight,)

        ],
    ));
  }
}
