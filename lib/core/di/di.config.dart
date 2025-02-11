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
import '../../data/repositories/auth/auth_repository_impl.dart' as _i24;
import '../../domain/repository/auth/auth_repository.dart' as _i912;
import '../../domain/repository/data_sources/remote_data_source/auth_remote_data_source.dart'
    as _i163;
import '../../domain/use_cases/login_use_case.dart' as _i471;
import '../../domain/use_cases/register_use_case.dart' as _i479;
import '../../features/ui/auth/login/cubit/login_view_model.dart' as _i245;
import '../../features/ui/auth/register/cubit/register_view_model.dart'
    as _i873;
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
    gh.singleton<_i339.ApiManger>(() => _i339.ApiManger());
    gh.factory<_i163.AuthRemoteDataSource>(
        () => _i373.AuthRemoteDataSourceImpl(apiManger: gh<_i339.ApiManger>()));
    gh.factory<_i912.AuthRepository>(() => _i24.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i163.AuthRemoteDataSource>()));
    gh.factory<_i479.RegisterUseCase>(() =>
        _i479.RegisterUseCase(authRepository: gh<_i912.AuthRepository>()));
    gh.factory<_i471.LoginUseCase>(
        () => _i471.LoginUseCase(authRepository: gh<_i912.AuthRepository>()));
    gh.factory<_i873.RegisterViewModel>(() =>
        _i873.RegisterViewModel(registerUseCase: gh<_i479.RegisterUseCase>()));
    gh.factory<_i245.LoginViewModel>(
        () => _i245.LoginViewModel(loginUseCase: gh<_i471.LoginUseCase>()));
    return this;
  }
}
