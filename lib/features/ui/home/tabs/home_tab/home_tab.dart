import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/utilities/app_assets.dart';
import 'package:ecommerce_app/core/utilities/app_styles.dart';
import 'package:ecommerce_app/domain/entities/CategoryResponseEntity.dart';
import 'package:ecommerce_app/features/ui/home/tabs/home_tab/category_brand_item.dart';
import 'package:ecommerce_app/features/ui/home/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:ecommerce_app/features/ui/home/tabs/home_tab/cubit/home_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utilities/app_colors.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
List<String> imageList=[AppAssets.announcement1,AppAssets.announcement2,AppAssets.announcement3];

var viewModel=getIt<HomeTabViewModel>();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getAllBrands();
    viewModel.getAllCategories();
  }
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(child:
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(

        children: [
      buildAnnouncement(announcementList: imageList),
          breakLine( text: 'Category'),
          BlocBuilder<HomeTabViewModel,HomeTabStates>(
            bloc: viewModel..getAllCategories(),
              builder: (context,state){
                return buildCategoryBrandSec(viewModel.categoryList);

                // if(state is CategorySuccessState){
            //   print("Current State in category sec11111: $state");
            //
            //   return buildCategoryBrandSec(viewModel.categoryList);
            // }else {
            //   print("Current State in category sec222222: $state");
            //
            //   return Text("NO DATA Loaded");
            // }
            }),
          breakLine( text: 'Brands'),
          BlocBuilder<HomeTabViewModel,HomeTabStates>(
              bloc: viewModel..getAllBrands(),

              builder: (context,state){
                return buildCategoryBrandSec(viewModel.brandList);

                // if(state is BrandsSuccessState){
                //   print("Current State in brand sec 1111: $state");
                //
                //   return buildCategoryBrandSec(viewModel.brandList);

                // }
                // else {
                //   print("Current State in brand sec22222: $state");
                //   return Text("NO DATA Loaded");
                // }


              })



        ],

      ),
    ),);
  }
}

ImageSlideshow buildAnnouncement({required List<String> announcementList }){
  // List<String> announcementList;
  return ImageSlideshow(
      height: 200.h,
      width: 398.w,
      indicatorColor: AppColors.primaryLight,
      indicatorBackgroundColor: AppColors.gray,
      initialPage: 0,
      isLoop: true,
      indicatorPadding:8.w ,
      indicatorBottomPadding: 16.h,
      autoPlayInterval: 5000,
      children: announcementList.map((image){
        return Image.asset(image,fit: BoxFit.fill,
        );
      }).toList()
    // [
    //   Image.asset(announcementList[0])
    // ]

  );
}
Row breakLine({required String text}){

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(text,style: AppStyles.semi20primaryLight,),
      Text("View all",style: AppStyles.semi16primaryLight,)


    ],);
}
SizedBox buildCategoryBrandSec(List<CategoryOrBrandEntity> list){
  return SizedBox(
    height: 288.h,
    child: GridView.builder(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount
      (crossAxisCount: 2) , itemBuilder: (context,index){
      return CategoryBrandItem(item: list[index]);
    },itemCount: list.length,scrollDirection: Axis.horizontal,),

  );

}

