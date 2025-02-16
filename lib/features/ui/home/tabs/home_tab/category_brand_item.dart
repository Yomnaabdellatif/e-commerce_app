import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/utilities/app_styles.dart';
import 'package:ecommerce_app/domain/entities/CategoryResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utilities/app_colors.dart';

class CategoryBrandItem extends StatelessWidget {
  CategoryOrBrandEntity item;
  CategoryBrandItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
crossAxisAlignment: CrossAxisAlignment.center
      ,      children: [
        Expanded(flex: 2,
          child: CachedNetworkImage(
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator(color: AppColors.primaryLight,),),
            imageUrl: item.image??"",
          imageBuilder: (context,imageProvider){
              return  CircleAvatar(backgroundImage: imageProvider,radius: 45.r, );
          },
            errorWidget: (context, url, error) =>  Icon(Icons.error,color: AppColors.red,),
          ),
        ),
        SizedBox(height: 3.h,),
        Expanded(flex:1,child: Center(child: Text(item.slug!,style: AppStyles.bold14primaryLight,)))
      ],
    );
  }
}
