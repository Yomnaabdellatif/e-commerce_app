import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/entities/CategoryResponseEntity.dart';
import 'package:ecommerce_app/domain/entities/ProductsResponseEntity.dart';

import '../../../core/errors/failures.dart';

abstract class HomeRepository {
 Future<Either<Failures,CategoryOrBrandResponseEntity>>getCategories();
 Future<Either<Failures,CategoryOrBrandResponseEntity>>getAllBrands();
 Future<Either<Failures,ProductsResponseEntity>>getAllProducts();

}