// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:tfg_v2/data/datasource/local/default_local_datasource.dart'
    as _i6;
import 'package:tfg_v2/data/datasource/local/local_datasource.dart' as _i5;
import 'package:tfg_v2/data/datasource/remote/default_remote_datasource.dart'
    as _i8;
import 'package:tfg_v2/data/datasource/remote/remote_datasource.dart' as _i7;
import 'package:tfg_v2/data/services/api_service.dart' as _i3;
import 'package:tfg_v2/di/dependency_injection.dart' as _i15;
import 'package:tfg_v2/domain/repository/social/plan_repository.dart' as _i13;
import 'package:tfg_v2/domain/repository/social/user_repository.dart' as _i12;
import 'package:tfg_v2/env/environment.dart' as _i10;
import 'package:tfg_v2/ui/navigation/navigator.dart' as _i11;
import 'package:tfg_v2/ui/viewmodel/home/home_viewmodel.dart' as _i4;
import 'package:tfg_v2/ui/viewmodel/plans/plans_viewmodel.dart' as _i14;
import 'package:tfg_v2/ui/viewmodel/splash/splash_viewmodel.dart' as _i9;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final apiServiceModule = _$ApiServiceModule();
    final diModule = _$DiModule();
    gh.lazySingleton<_i3.ApiService>(() => apiServiceModule.httpClient);
    gh.factory<_i4.HomeViewModel>(() => _i4.HomeViewModel());
    gh.factory<_i5.LocalDatasource>(() => _i6.DefaultLocalDatasource());
    gh.factory<_i7.RemoteDatasource>(
        () => _i8.DefaultRemoteDatasource(gh<_i3.ApiService>()));
    gh.factory<_i9.SplashViewModel>(() => _i9.SplashViewModel());
    gh.singleton<_i10.TfgEnv>(diModule.env);
    gh.singleton<_i11.TfgNavigator>(diModule.navigator);
    gh.factory<_i12.UserRepository>(() => _i12.UserRepositoryImpl(
          gh<_i7.RemoteDatasource>(),
          gh<_i5.LocalDatasource>(),
        ));
    gh.factory<_i13.PlanRepository>(
        () => _i13.PlanRepositoryImpl(gh<_i7.RemoteDatasource>()));
    gh.factory<_i14.PlansViewModel>(
        () => _i14.PlansViewModel(gh<_i13.PlanRepository>()));
    return this;
  }
}

class _$ApiServiceModule extends _i3.ApiServiceModule {}

class _$DiModule extends _i15.DiModule {}
