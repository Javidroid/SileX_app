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
    as _i7;
import 'package:tfg_v2/data/datasource/local/local_datasource.dart' as _i6;
import 'package:tfg_v2/data/datasource/remote/default_remote_datasource.dart'
    as _i14;
import 'package:tfg_v2/data/datasource/remote/remote_datasource.dart' as _i13;
import 'package:tfg_v2/data/services/api_service.dart' as _i3;
import 'package:tfg_v2/di/dependency_injection.dart' as _i26;
import 'package:tfg_v2/domain/model/plan.dart' as _i11;
import 'package:tfg_v2/domain/repository/social/plan_repository.dart' as _i23;
import 'package:tfg_v2/domain/repository/social/user_repository.dart' as _i19;
import 'package:tfg_v2/domain/use_cases/follow_user.dart' as _i20;
import 'package:tfg_v2/domain/use_cases/get_updated_logged_user.dart' as _i21;
import 'package:tfg_v2/domain/use_cases/user_join_quit_plan.dart' as _i24;
import 'package:tfg_v2/env/environment.dart' as _i17;
import 'package:tfg_v2/ui/navigation/navigator.dart' as _i18;
import 'package:tfg_v2/ui/viewmodel/create_plan/create_plan_viewmodel.dart'
    as _i4;
import 'package:tfg_v2/ui/viewmodel/direct_messages/direct_messages_viewmodel.dart'
    as _i5;
import 'package:tfg_v2/ui/viewmodel/home/home_viewmodel.dart' as _i22;
import 'package:tfg_v2/ui/viewmodel/login/login_viewmodel.dart' as _i8;
import 'package:tfg_v2/ui/viewmodel/notifications/notifications_viewmodel.dart'
    as _i9;
import 'package:tfg_v2/ui/viewmodel/plans/plan_detail_viewmodel.dart' as _i10;
import 'package:tfg_v2/ui/viewmodel/plans/plans_viewmodel.dart' as _i25;
import 'package:tfg_v2/ui/viewmodel/profile/profile_viewmodel.dart' as _i12;
import 'package:tfg_v2/ui/viewmodel/search/search_viewmodel.dart' as _i15;
import 'package:tfg_v2/ui/viewmodel/splash/splash_viewmodel.dart' as _i16;

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
    gh.factory<_i4.CreatePlanViewModel>(() => _i4.CreatePlanViewModel());
    gh.factory<_i5.DirectMessagesViewModel>(
        () => _i5.DirectMessagesViewModel());
    gh.factory<_i6.LocalDatasource>(() => _i7.DefaultLocalDatasource());
    gh.factory<_i8.LoginViewModel>(() => _i8.LoginViewModel());
    gh.factory<_i9.NotificationsViewModel>(() => _i9.NotificationsViewModel());
    gh.factoryParam<_i10.PlanDetailViewModel, _i11.Plan, dynamic>((
      planFromList,
      _,
    ) =>
        _i10.PlanDetailViewModel(planFromList: planFromList));
    gh.factoryParam<_i12.ProfileViewModel, String, bool>((
      userRef,
      isUserRefId,
    ) =>
        _i12.ProfileViewModel(
          userRef: userRef,
          isUserRefId: isUserRefId,
        ));
    gh.factory<_i13.RemoteDatasource>(
        () => _i14.DefaultRemoteDatasource(gh<_i3.ApiService>()));
    gh.factory<_i15.SearchViewModel>(() => _i15.SearchViewModel());
    gh.factory<_i16.SplashViewModel>(() => _i16.SplashViewModel());
    gh.singleton<_i17.TfgEnv>(diModule.env);
    gh.singleton<_i18.TfgNavigator>(diModule.navigator);
    gh.factory<_i19.UserRepository>(() => _i19.UserRepositoryImpl(
          gh<_i13.RemoteDatasource>(),
          gh<_i6.LocalDatasource>(),
        ));
    gh.factory<_i20.FollowUserUseCase>(
        () => _i20.FollowUserUseCase(gh<_i19.UserRepository>()));
    gh.factory<_i21.GetUpdatedLoggedUserUseCase>(
        () => _i21.GetUpdatedLoggedUserUseCase(gh<_i19.UserRepository>()));
    gh.factory<_i22.HomeViewModel>(
        () => _i22.HomeViewModel(gh<_i21.GetUpdatedLoggedUserUseCase>()));
    gh.factory<_i23.PlanRepository>(
        () => _i23.PlanRepositoryImpl(gh<_i13.RemoteDatasource>()));
    gh.factory<_i24.UserJoinQuitPlanUseCase>(() => _i24.UserJoinQuitPlanUseCase(
          gh<_i23.PlanRepository>(),
          gh<_i19.UserRepository>(),
        ));
    gh.factory<_i25.PlansViewModel>(() => _i25.PlansViewModel(
          gh<_i23.PlanRepository>(),
          gh<_i24.UserJoinQuitPlanUseCase>(),
          gh<_i19.UserRepository>(),
        ));
    return this;
  }
}

class _$ApiServiceModule extends _i3.ApiServiceModule {}

class _$DiModule extends _i26.DiModule {}
