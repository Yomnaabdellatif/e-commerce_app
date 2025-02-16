import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/CategoryResponseEntity.dart';

abstract class HomeTabStates {}
class HomeTabInitialState extends HomeTabStates{}
class CategoryLoadingState extends HomeTabStates{}
class CategorySuccessState extends HomeTabStates{
  CategoryOrBrandResponseEntity categoryResponseEntity;
  CategorySuccessState({required this.categoryResponseEntity});
}
class CategoryErrorState extends HomeTabStates{
  Failures failures;
  CategoryErrorState({required this.failures});}
class BrandsLoadingState extends HomeTabStates{}
class BrandsSuccessState extends HomeTabStates{
  CategoryOrBrandResponseEntity categoryResponseEntity;
  BrandsSuccessState({required this.categoryResponseEntity});
}
class BrandsErrorState extends HomeTabStates {
  Failures failures;

  BrandsErrorState({required this.failures});
}

