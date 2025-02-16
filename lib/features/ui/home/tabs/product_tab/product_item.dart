import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/utilities/app_assets.dart';
import 'package:ecommerce_app/core/utilities/app_styles.dart';
import 'package:ecommerce_app/domain/entities/ProductsResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utilities/app_colors.dart';

class ProductItem extends StatelessWidget {
  ProductEntity product;
   ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return  Container(clipBehavior: Clip.antiAlias,
      decoration:
      BoxDecoration(color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
        border:Border.all(color: AppColors.gray)
      ),
      child: Column(

          children: [
        Expanded(
          flex:4 ,
          child: Stack(
            alignment: Alignment.topRight,
            children: [

            ClipRRect(borderRadius: BorderRadius.circular(15.r),
              child: CachedNetworkImage(
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator(color: AppColors.primaryLight,),),
                 fit: BoxFit.fill,
                imageUrl: product.imageCover??"",
                width: double.infinity,
                errorWidget: (context, url, error) =>  Icon(Icons.error,color: AppColors.red,),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 5.w,top: 5.h),
              child:
              CircleAvatar(child: ImageIcon( AssetImage(AppAssets.iconFavoriteUnSelected),color: AppColors.primaryLight,),backgroundColor: AppColors.white,),
            )
          ],),
        ),

        Expanded(flex: 4,
          child: Padding(
            padding: EdgeInsets.only(right: 5.w,left: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(product.title!,style: AppStyles.semi12primaryLight,maxLines: 3,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AutoSizeText("EGP ${product.price!}",style: AppStyles.semi12primaryLight,),
                    AutoSizeText("${product.price!*1.5}EGP",style: AppStyles.semi12primaryLight.copyWith(decoration:TextDecoration.lineThrough ),),

                  ],
                ),
                Row(children: [
                  AutoSizeText("Review(${product.ratingsAverage.toString()})",style: AppStyles.semi10primaryLight,),
                Icon(Icons.star,color: AppColors.yellow,),Spacer(),
                ImageIcon(AssetImage(AppAssets.iconAdd),color: AppColors.primaryLight,)
              ],),

            ],),
          ),
        )


    ]));
  }
}
