import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/domain/entities/CategoryResponseEntity.dart';
import 'package:ecommerce_app/domain/repository/home/home_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetAllBrandsUseCase {
  HomeRepository homeRepository;
  GetAllBrandsUseCase({required this.homeRepository});
  Future <Either<Failures,CategoryOrBrandResponseEntity>>invoke(){
   return homeRepository.getAllBrands();
  }


}