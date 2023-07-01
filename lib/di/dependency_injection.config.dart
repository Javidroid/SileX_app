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
    as _i4;
import 'package:tfg_v2/data/datasource/local/local_datasource.dart' as _i3;
import 'package:tfg_v2/di/dependency_injection.dart' as _i8;
import 'package:tfg_v2/env/environment.dart' as _i6;
import 'package:tfg_v2/ui/navigation/navigator.dart' as _i7;
import 'package:tfg_v2/ui/viewmodel/splash/splash_viewmodel.dart' as _i5;

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
    final diModule = _$DiModule();
    gh.factory<_i3.LocalDatasource>(() => _i4.DefaultLocalDatasource());
    gh.factory<_i5.SplashViewModel>(() => _i5.SplashViewModel());
    gh.singleton<_i6.TfgEnv>(diModule.env);
    gh.singleton<_i7.TfgNavigator>(diModule.navigator);
    return this;
  }
}

class _$DiModule extends _i8.DiModule {}
