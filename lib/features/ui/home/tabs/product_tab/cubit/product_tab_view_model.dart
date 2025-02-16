import 'package:ecommerce_app/domain/entities/ProductsResponseEntity.dart';
import 'package:ecommerce_app/domain/use_cases/get_all_products_use_case.dart';
import 'package:ecommerce_app/features/ui/home/tabs/product_tab/cubit/product_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable

class ProductTabViewModel extends Cubit<ProductTabStates>{
  GetAllProductsUseCase getAllProductsUseCase;
  ProductTabViewModel({required this.getAllProductsUseCase}):super(ProductTabInitialState());
List<ProductEntity> productList=[];
   getAllProducts()async{
     emit(LoadingProductsState());
    var either=await getAllProductsUseCase.invoke();
    either.fold((error){
      emit(ErrorProductsState(failures: error));
    }, (response){
      productList=response.data!;
      emit(SuccessProductsState(productsResponseEntity: response));

    });

  }
}