// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/data_sources/remote_data_source/auth_remote_data_source_impl.dart'
    as _i373;
import '../../data/data_sources/remote_data_source/home_remote_data_source_impl.dart'
    as _i886;
import '../../data/repositories/auth/auth_repository_impl.dart' as _i24;
import '../../data/repositories/home/home_repository_impl.dart' as _i161;
import '../../domain/repository/auth/auth_repository.dart' as _i912;
import '../../domain/repository/data_sources/remote_data_source/auth_remote_data_source.dart'
    as _i163;
import '../../domain/repository/data_sources/remote_data_source/home_remote_data_source.dart'
    as _i710;
import '../../domain/repository/home/home_repository.dart' as _i839;
import '../../domain/use_cases/get_all_brands_use_case.dart' as _i773;
import '../../domain/use_cases/get_all_categories_use_case.dart' as _i201;
import '../../domain/use_cases/get_all_products_use_case.dart' as _i939;
import '../../domain/use_cases/login_use_case.dart' as _i471;
import '../../domain/use_cases/register_use_case.dart' as _i479;
import '../../features/ui/auth/login/cubit/login_view_model.dart' as _i245;
import '../../features/ui/auth/register/cubit/register_view_model.dart'
    as _i873;
import '../../features/ui/home/cubit/home_screen_view_model.dart' as _i714;
import '../../features/ui/home/tabs/home_tab/cubit/home_tab_view_model.dart'
    as _i976;
import '../../features/ui/home/tabs/product_tab/cubit/product_tab_view_model.dart'
    as _i774;
import '../api/api_manger.dart' as _i339;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i714.HomeScreenViewModel>(() => _i714.HomeScreenViewModel());
    gh.singleton<_i339.ApiManger>(() => _i339.ApiManger());
    gh.factory<_i710.HomeRemoteDataSource>(
        () => _i886.HomeRemoteDataSourceImpl(apiManger: gh<_i339.ApiManger>()));
    gh.factory<_i839.HomeRepository>(() => _i161.HomeRepositoryImpl(
        homeRemoteDataSource: gh<_i710.HomeRemoteDataSource>()));
    gh.factory<_i163.AuthRemoteDataSource>(
        () => _i373.AuthRemoteDataSourceImpl(apiManger: gh<_i339.ApiManger>()));
    gh.factory<_i912.AuthRepository>(() => _i24.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i163.AuthRemoteDataSource>()));
    gh.factory<_i773.GetAllBrandsUseCase>(() =>
        _i773.GetAllBrandsUseCase(homeRepository: gh<_i839.HomeRepository>()));
    gh.factory<_i201.GetAllCategoriesUseCase>(() =>
        _i201.GetAllCategoriesUseCase(
            homeRepository: gh<_i839.HomeRepository>()));
    gh.factory<_i939.GetAllProductsUseCase>(() => _i939.GetAllProductsUseCase(
        homeRepository: gh<_i839.HomeRepository>()));
    gh.factory<_i774.ProductTabViewModel>(() => _i774.ProductTabViewModel(
        getAllProductsUseCase: gh<_i939.GetAllProductsUseCase>()));
    gh.factory<_i471.LoginUseCase>(
        () => _i471.LoginUseCase(authRepository: gh<_i912.AuthRepository>()));
    gh.factory<_i479.RegisterUseCase>(() =>
        _i479.RegisterUseCase(authRepository: gh<_i912.AuthRepository>()));
    gh.factory<_i873.RegisterViewModel>(() =>
        _i873.RegisterViewModel(registerUseCase: gh<_i479.RegisterUseCase>()));
    gh.factory<_i976.HomeTabViewModel>(() => _i976.HomeTabViewModel(
          getAllCategoriesUseCase: gh<_i201.GetAllCategoriesUseCase>(),
          getAllBrandsUseCase: gh<_i773.GetAllBrandsUseCase>(),
        ));
    gh.factory<_i245.LoginViewModel>(
        () => _i245.LoginViewModel(loginUseCase: gh<_i471.LoginUseCase>()));
    return this;
  }
}
