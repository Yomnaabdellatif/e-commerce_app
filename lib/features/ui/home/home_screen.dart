import 'package:ecommerce_app/core/utilities/app_assets.dart';
import 'package:ecommerce_app/core/utilities/app_colors.dart';
import 'package:ecommerce_app/features/ui/home/cubit/home_screen_states.dart';
import 'package:ecommerce_app/features/ui/home/cubit/home_screen_view_model.dart';
import 'package:ecommerce_app/features/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName="home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
var viewModel=HomeScreenViewModel();


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel,HomeStates>(bloc: viewModel,
      builder: (context,state){
return Scaffold(appBar:
AppBar(
  toolbarHeight: 113.h,
  title: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ImageIcon(AssetImage(AppAssets.routeImage),color: AppColors.primaryLight,size: 50.h,),
      Row(
        children: [
          SizedBox(height: 50.h,width: 348.w,
            child: CustomTextFormField(
              iconColor: AppColors.primaryLight,
              hintText: "Search",
              borderColor: AppColors.primaryLight,
              prefixIcon: ImageIcon(AssetImage(AppAssets.iconSearch),),
            ),
          ),
          SizedBox(width: 10.w),
          ImageIcon(AssetImage(AppAssets.iconCart)),
        ],
      ),
    ],
  ),
)
  ,   bottomNavigationBar: ClipRRect(
    borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(15), topRight: Radius.circular(15)),
    child: SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      child: BottomNavigationBar(
        onTap: viewModel.changeSelectedIndex,
        elevation: 0,
        currentIndex: viewModel. selectedIndex,
        backgroundColor: AppColors.primaryLight,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryLight,
        unselectedItemColor: AppColors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          customBottomNavBarItem(isSelected:viewModel. selectedIndex==0,selectedIcon:AppAssets.iconHomeSelected,unSelectedIcon: AppAssets.iconHomeUnSelected )
          ,customBottomNavBarItem(isSelected: viewModel. selectedIndex==1,selectedIcon:AppAssets.iconCategorySelected,unSelectedIcon: AppAssets.iconCategoryUnSelected )
          ,customBottomNavBarItem(isSelected: viewModel. selectedIndex==2,selectedIcon:AppAssets.iconFavoriteSelected,unSelectedIcon: AppAssets.iconFavoriteUnSelected )
          ,customBottomNavBarItem(isSelected: viewModel. selectedIndex==3,selectedIcon:AppAssets.iconUserSelected,unSelectedIcon: AppAssets.iconUserUnSelected )
        ],
      ),
    ),
  ),body:
 viewModel.appTabs[viewModel.selectedIndex],);
      },
    );
  }
}
   BottomNavigationBarItem customBottomNavBarItem({required String selectedIcon,required String unSelectedIcon,
     required bool isSelected}) {

  return BottomNavigationBarItem(
    label: "h",
    icon: CircleAvatar(radius: 21.r,
      backgroundColor: isSelected? AppColors.white:AppColors.transparent,
foregroundColor: isSelected?AppColors.primaryLight:AppColors.white,
    child: ImageIcon(AssetImage(isSelected?selectedIcon:unSelectedIcon)),)

  );

}

