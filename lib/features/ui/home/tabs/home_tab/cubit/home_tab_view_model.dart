import 'package:ecommerce_app/domain/entities/CategoryResponseEntity.dart';
import 'package:ecommerce_app/domain/use_cases/get_all_brands_use_case.dart';
import 'package:ecommerce_app/domain/use_cases/get_all_categories_use_case.dart';
import 'package:ecommerce_app/features/ui/home/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class HomeTabViewModel extends Cubit<HomeTabStates>{
  GetAllCategoriesUseCase getAllCategoriesUseCase;
    GetAllBrandsUseCase getAllBrandsUseCase;
  List<CategoryOrBrandEntity> categoryList=[];
  List<CategoryOrBrandEntity> brandList=[];
  HomeTabViewModel({required this.getAllCategoriesUseCase,required this.getAllBrandsUseCase}):super(HomeTabInitialState());

getAllCategories()async{
  emit(CategoryLoadingState());

  var either=await getAllCategoriesUseCase.invoke();
 either.fold((error){
   emit(CategoryErrorState(failures: error));
 }, (response){
   categoryList=response.data!;
   emit(CategorySuccessState(categoryResponseEntity: response));
   getAllBrands();
 });
}

  getAllBrands()async{
    emit(BrandsLoadingState());

    var either=await getAllBrandsUseCase.invoke();
    either.fold((error){
      emit(BrandsErrorState(failures: error));
    }, (response){
      brandList=response.data!;
      emit(BrandsSuccessState(categoryResponseEntity: response));
    });
  }
}