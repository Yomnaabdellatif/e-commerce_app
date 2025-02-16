import 'package:ecommerce_app/domain/entities/ProductsResponseEntity.dart';

import '../../../../../../core/errors/failures.dart';

abstract class ProductTabStates {}
class ProductTabInitialState extends ProductTabStates{}
class LoadingProductsState extends ProductTabStates{}
class SuccessProductsState extends ProductTabStates{
ProductsResponseEntity productsResponseEntity  ;
SuccessProductsState({required this.productsResponseEntity});
}
class ErrorProductsState extends ProductTabStates{

  Failures failures;
  ErrorProductsState({required this.failures});
}
