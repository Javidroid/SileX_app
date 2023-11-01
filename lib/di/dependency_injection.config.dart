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
    as _i12;
import 'package:tfg_v2/data/datasource/remote/remote_datasource.dart' as _i11;
import 'package:tfg_v2/data/services/api_service.dart' as _i3;
import 'package:tfg_v2/data/services/auth/auth0_services.dart' as _i4;
import 'package:tfg_v2/di/dependency_injection.dart' as _i32;
import 'package:tfg_v2/domain/model/plan.dart' as _i10;
import 'package:tfg_v2/domain/repository/auth/auth_repository.dart' as _i18;
import 'package:tfg_v2/domain/repository/social/category_repository.dart'
    as _i19;
import 'package:tfg_v2/domain/repository/social/plan_repository.dart' as _i26;
import 'package:tfg_v2/domain/repository/social/user_repository.dart' as _i17;
import 'package:tfg_v2/domain/use_cases/auth/login.dart' as _i23;
import 'package:tfg_v2/domain/use_cases/auth/logout.dart' as _i25;
import 'package:tfg_v2/domain/use_cases/social/follow_user.dart' as _i20;
import 'package:tfg_v2/domain/use_cases/social/get_updated_logged_user.dart'
    as _i21;
import 'package:tfg_v2/domain/use_cases/social/user_join_quit_plan.dart'
    as _i28;
import 'package:tfg_v2/env/environment.dart' as _i15;
import 'package:tfg_v2/ui/navigation/navigator.dart' as _i16;
import 'package:tfg_v2/ui/viewmodel/create_plan/create_plan_viewmodel.dart'
    as _i29;
import 'package:tfg_v2/ui/viewmodel/direct_messages/direct_messages_viewmodel.dart'
    as _i5;
import 'package:tfg_v2/ui/viewmodel/home/home_viewmodel.dart' as _i22;
import 'package:tfg_v2/ui/viewmodel/login/login_viewmodel.dart' as _i24;
import 'package:tfg_v2/ui/viewmodel/notifications/notifications_viewmodel.dart'
    as _i8;
import 'package:tfg_v2/ui/viewmodel/plans/plan_detail_viewmodel.dart' as _i9;
import 'package:tfg_v2/ui/viewmodel/plans/plans_viewmodel.dart' as _i30;
import 'package:tfg_v2/ui/viewmodel/profile/profile_viewmodel.dart' as _i31;
import 'package:tfg_v2/ui/viewmodel/search/search_viewmodel.dart' as _i13;
import 'package:tfg_v2/ui/viewmodel/sign_up/sign_up_viewmodel.dart' as _i14;
import 'package:tfg_v2/ui/viewmodel/splash/splash_viewmodel.dart' as _i27;

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
    gh.factory<_i4.AuthService>(() => _i4.AuthService());
    gh.factory<_i5.DirectMessagesViewModel>(
        () => _i5.DirectMessagesViewModel());
    gh.factory<_i6.LocalDatasource>(() => _i7.DefaultLocalDatasource());
    gh.factory<_i8.NotificationsViewModel>(() => _i8.NotificationsViewModel());
    gh.factoryParam<_i9.PlanDetailViewModel, _i10.Plan, dynamic>((
      currentPlan,
      _,
    ) =>
        _i9.PlanDetailViewModel(currentPlan: currentPlan));
    gh.factory<_i11.RemoteDatasource>(() => _i12.DefaultRemoteDatasource(
          gh<_i3.ApiService>(),
          gh<_i4.AuthService>(),
        ));
    gh.factory<_i13.SearchViewModel>(() => _i13.SearchViewModel());
    gh.factory<_i14.SignUpViewModel>(() => _i14.SignUpViewModel());
    gh.singleton<_i15.TfgEnv>(diModule.env);
    gh.singleton<_i16.TfgNavigator>(diModule.navigator);
    gh.factory<_i17.UserRepository>(() => _i17.UserRepositoryImpl(
          gh<_i11.RemoteDatasource>(),
          gh<_i6.LocalDatasource>(),
        ));
    gh.factory<_i18.AuthRepository>(
        () => _i18.PlanRepositoryImpl(gh<_i11.RemoteDatasource>()));
    gh.factory<_i19.CategoryRepository>(
        () => _i19.PlanRepositoryImpl(gh<_i11.RemoteDatasource>()));
    gh.factory<_i20.FollowUserUseCase>(
        () => _i20.FollowUserUseCase(gh<_i17.UserRepository>()));
    gh.factory<_i21.GetUpdatedLoggedUserUseCase>(
        () => _i21.GetUpdatedLoggedUserUseCase(gh<_i17.UserRepository>()));
    gh.factory<_i22.HomeViewModel>(
        () => _i22.HomeViewModel(gh<_i21.GetUpdatedLoggedUserUseCase>()));
    gh.factory<_i23.LoginUseCase>(() => _i23.LoginUseCase(
          gh<_i18.AuthRepository>(),
          gh<_i17.UserRepository>(),
        ));
    gh.factory<_i24.LoginViewModel>(
        () => _i24.LoginViewModel(gh<_i23.LoginUseCase>()));
    gh.factory<_i25.LogoutUseCase>(() => _i25.LogoutUseCase(
          gh<_i18.AuthRepository>(),
          gh<_i17.UserRepository>(),
        ));
    gh.factory<_i26.PlanRepository>(
        () => _i26.PlanRepositoryImpl(gh<_i11.RemoteDatasource>()));
    gh.factory<_i27.SplashViewModel>(
        () => _i27.SplashViewModel(gh<_i21.GetUpdatedLoggedUserUseCase>()));
    gh.factory<_i28.UserJoinQuitPlanUseCase>(() => _i28.UserJoinQuitPlanUseCase(
          gh<_i26.PlanRepository>(),
          gh<_i17.UserRepository>(),
        ));
    gh.factory<_i29.CreatePlanViewModel>(() => _i29.CreatePlanViewModel(
          gh<_i19.CategoryRepository>(),
          gh<_i26.PlanRepository>(),
          gh<_i17.UserRepository>(),
        ));
    gh.factory<_i30.PlansViewModel>(() => _i30.PlansViewModel(
          gh<_i26.PlanRepository>(),
          gh<_i28.UserJoinQuitPlanUseCase>(),
          gh<_i17.UserRepository>(),
        ));
    gh.factoryParam<_i31.ProfileViewModel, String, bool>((
      userRef,
      isUserRefId,
    ) =>
        _i31.ProfileViewModel(
          userRef: userRef,
          isUserRefId: isUserRefId,
          joinQuitPlanUseCase: gh<_i28.UserJoinQuitPlanUseCase>(),
          followUserUseCase: gh<_i20.FollowUserUseCase>(),
          getUpdatedLoggedUserUseCase: gh<_i21.GetUpdatedLoggedUserUseCase>(),
        ));
    return this;
  }
}

class _$ApiServiceModule extends _i3.ApiServiceModule {}

class _$DiModule extends _i32.DiModule {}
