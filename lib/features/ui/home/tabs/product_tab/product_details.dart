
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce_app/core/utilities/app_assets.dart';
import 'package:ecommerce_app/core/utilities/app_colors.dart';
import 'package:ecommerce_app/core/utilities/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../../../../domain/entities/ProductsResponseEntity.dart';
import '../../../widgets/custom_elevated_button.dart';

class ProductDetails extends StatefulWidget {
  static const String routeName="details";

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  List<Color> colors=[
    Colors.black,
    Colors.green,
    Colors.red,
    Colors.yellow,
    Colors.blueAccent,
    Colors.pinkAccent,
  ];

  List<int> sizes=[38,39,40,41,42];

  int itemCount=0;

  @override
  Widget build(BuildContext context) {
     var args = ModalRoute.of(context)!.settings.arguments as ProductEntity;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.primaryDark),
        title: Text(
          'Product Details',
          style:AppStyles.bold14primaryLight,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: ImageIcon(
                AssetImage(AppAssets.iconSearch),
                color: AppColors.primaryLight,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: AppColors.primaryLight,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 50.h),
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10.h,
              children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: AppColors.primaryLight)),
              child:
              ImageSlideshow(
                initialPage: 0,
                indicatorColor: AppColors.primaryDark,
                indicatorBackgroundColor: AppColors.gray,
                indicatorBottomPadding: 20.h,
                autoPlayInterval: 90000,
                isLoop: true,
                children: args.images!
                    .map((url) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    url,
                    fit: BoxFit.fill,
                    width: 210.w,
                    height: 300.h,
                  ),
                ))
                    .toList(),
              ),),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Expanded(
                child: AutoSizeText(args.title!,style: AppStyles.semi16primaryLight,maxLines: 3,

                ),
              ),
                AutoSizeText("EGP ${args.price}",style: AppStyles.semi16primaryLight,)

            ],),
            Row(
              spacing:10.w,
              children: [
                Container(padding:  EdgeInsets.all(3.w),
                    decoration: BoxDecoration(border: Border.all(color: AppColors.gray,),borderRadius: BorderRadius.circular(16.r)),
                    child: Text(
                      "${args.sold!.toString()} sold ",style: AppStyles.semi16primaryLight,)),
                Row(children: [ Icon(Icons.star,color: AppColors.yellow,),
                  AutoSizeText("${args.ratingsAverage.toString()}(${args.ratingsQuantity})",style: AppStyles.semi10primaryLight,),
                 ],),
                 Spacer(),
                Container(decoration: BoxDecoration(color: AppColors.primaryLight,borderRadius: BorderRadius.circular(35.r)),

                child: Row(
                  children: [
                    IconButton(onPressed: (){
                      if(itemCount>0){
                      itemCount--;}
                      setState(() {
                      });
                    }, icon: Icon(Icons.remove_circle_outline,color: AppColors.white,)),
                    AutoSizeText("$itemCount",style: AppStyles.semi16White,),
                    IconButton(onPressed: (){itemCount++;
                      setState(() {

                      });}, icon: Icon(Icons.add_circle_outline,color: AppColors.white,))

                  ],


                ),)



              ],),
            Text("Description",style: AppStyles.semi20primaryLight,),
                ReadMoreText(args.description!,style: AppStyles.semi14Gray, trimMode: TrimMode.Line,
                  trimLines: 2,
                  colorClickableText: AppColors.primaryLight,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',),
                Row(children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                    Text("Total Price ",style: AppStyles.semi16Gray,),
                    Text("EGP${(args.price!)*itemCount} ",style: AppStyles.semi20primaryLight ,)
                  ],),
                  Spacer(),
                  CustomElevatedButton(buttonLabel: "Add to cart",labelStyle: AppStyles.semi16White,
                    onClick: (){},backgroundColor: AppColors.primaryLight,
                    icon:Icon(
                    Icons.add_shopping_cart,
                    color: AppColors.white,
                  ) ,)

                ],)





              ]),
        ),
      ),
    );
  }
}