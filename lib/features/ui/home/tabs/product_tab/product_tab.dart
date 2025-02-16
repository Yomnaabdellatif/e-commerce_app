import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/utilities/app_colors.dart';
import 'package:ecommerce_app/features/ui/home/tabs/product_tab/cubit/product_tab_states.dart';
import 'package:ecommerce_app/features/ui/home/tabs/product_tab/cubit/product_tab_view_model.dart';
import 'package:ecommerce_app/features/ui/home/tabs/product_tab/product_details.dart';
import 'package:ecommerce_app/features/ui/home/tabs/product_tab/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductTab extends StatelessWidget {
  var viewModel=getIt<ProductTabViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductTabViewModel,ProductTabStates>(
      bloc: viewModel..getAllProducts(),
      builder: (context,state){
        if(state is LoadingProductsState){
          return Center(child: CircularProgressIndicator(color: AppColors.primaryLight,));
        }else if(state is SuccessProductsState){

          return Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [

              Expanded(

                  child: GridView.builder(gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10.h,crossAxisSpacing: 7.w,childAspectRatio: 2/3.2.h),
                      itemCount: viewModel.productList.length,
                      itemBuilder: (context,index){
                        return InkWell(child: ProductItem(product: viewModel.productList[index],),
                        onTap: (){

                          Navigator.pushNamed(context,ProductDetails. routeName,arguments: viewModel.productList[index]);
                        },);
                      })),
              // Expanded(child: Container())
            ],





          ),
                  )
        ;}
        return Text("NO DATA");

      },

    );
  }
}
