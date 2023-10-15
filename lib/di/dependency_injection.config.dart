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
    as _i12;
import 'package:tfg_v2/data/datasource/remote/remote_datasource.dart' as _i11;
import 'package:tfg_v2/data/services/api_service.dart' as _i3;
import 'package:tfg_v2/di/dependency_injection.dart' as _i27;
import 'package:tfg_v2/domain/model/plan.dart' as _i10;
import 'package:tfg_v2/domain/repository/social/category_repository.dart'
    as _i18;
import 'package:tfg_v2/domain/repository/social/plan_repository.dart' as _i22;
import 'package:tfg_v2/domain/repository/social/user_repository.dart' as _i17;
import 'package:tfg_v2/domain/use_cases/follow_user.dart' as _i19;
import 'package:tfg_v2/domain/use_cases/get_updated_logged_user.dart' as _i20;
import 'package:tfg_v2/domain/use_cases/user_join_quit_plan.dart' as _i23;
import 'package:tfg_v2/env/environment.dart' as _i14;
import 'package:tfg_v2/ui/navigation/navigator.dart' as _i15;
import 'package:tfg_v2/ui/viewmodel/create_plan/create_plan_viewmodel.dart'
    as _i24;
import 'package:tfg_v2/ui/viewmodel/direct_messages/direct_messages_viewmodel.dart'
    as _i4;
import 'package:tfg_v2/ui/viewmodel/home/home_viewmodel.dart' as _i21;
import 'package:tfg_v2/ui/viewmodel/login/login_viewmodel.dart' as _i7;
import 'package:tfg_v2/ui/viewmodel/notifications/notifications_viewmodel.dart'
    as _i8;
import 'package:tfg_v2/ui/viewmodel/plans/plan_detail_viewmodel.dart' as _i9;
import 'package:tfg_v2/ui/viewmodel/plans/plans_viewmodel.dart' as _i25;
import 'package:tfg_v2/ui/viewmodel/profile/profile_viewmodel.dart' as _i26;
import 'package:tfg_v2/ui/viewmodel/search/search_viewmodel.dart' as _i13;
import 'package:tfg_v2/ui/viewmodel/unavailable/unavailable_viewmodel.dart'
    as _i16;

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
    gh.factory<_i4.DirectMessagesViewModel>(
        () => _i4.DirectMessagesViewModel());
    gh.factory<_i5.LocalDatasource>(() => _i6.DefaultLocalDatasource());
    gh.factory<_i7.LoginViewModel>(() => _i7.LoginViewModel());
    gh.factory<_i8.NotificationsViewModel>(() => _i8.NotificationsViewModel());
    gh.factoryParam<_i9.PlanDetailViewModel, _i10.Plan, dynamic>((
      currentPlan,
      _,
    ) =>
        _i9.PlanDetailViewModel(currentPlan: currentPlan));
    gh.factory<_i11.RemoteDatasource>(
        () => _i12.DefaultRemoteDatasource(gh<_i3.ApiService>()));
    gh.factory<_i13.SearchViewModel>(() => _i13.SearchViewModel());
    gh.singleton<_i14.TfgEnv>(diModule.env);
    gh.singleton<_i15.TfgNavigator>(diModule.navigator);
    gh.factory<_i16.UnavailableViewModel>(() => _i16.UnavailableViewModel());
    gh.factory<_i17.UserRepository>(() => _i17.UserRepositoryImpl(
          gh<_i11.RemoteDatasource>(),
          gh<_i5.LocalDatasource>(),
        ));
    gh.factory<_i18.CategoryRepository>(
        () => _i18.PlanRepositoryImpl(gh<_i11.RemoteDatasource>()));
    gh.factory<_i19.FollowUserUseCase>(
        () => _i19.FollowUserUseCase(gh<_i17.UserRepository>()));
    gh.factory<_i20.GetUpdatedLoggedUserUseCase>(
        () => _i20.GetUpdatedLoggedUserUseCase(gh<_i17.UserRepository>()));
    gh.factory<_i21.HomeViewModel>(
        () => _i21.HomeViewModel(gh<_i20.GetUpdatedLoggedUserUseCase>()));
    gh.factory<_i22.PlanRepository>(
        () => _i22.PlanRepositoryImpl(gh<_i11.RemoteDatasource>()));
    gh.factory<_i23.UserJoinQuitPlanUseCase>(() => _i23.UserJoinQuitPlanUseCase(
          gh<_i22.PlanRepository>(),
          gh<_i17.UserRepository>(),
        ));
    gh.factory<_i24.CreatePlanViewModel>(() => _i24.CreatePlanViewModel(
          gh<_i18.CategoryRepository>(),
          gh<_i22.PlanRepository>(),
          gh<_i17.UserRepository>(),
        ));
    gh.factory<_i25.PlansViewModel>(() => _i25.PlansViewModel(
          gh<_i22.PlanRepository>(),
          gh<_i23.UserJoinQuitPlanUseCase>(),
          gh<_i17.UserRepository>(),
        ));
    gh.factoryParam<_i26.ProfileViewModel, String, bool>((
      userRef,
      isUserRefId,
    ) =>
        _i26.ProfileViewModel(
          userRef: userRef,
          isUserRefId: isUserRefId,
          joinQuitPlanUseCase: gh<_i23.UserJoinQuitPlanUseCase>(),
          followUserUseCase: gh<_i19.FollowUserUseCase>(),
          getUpdatedLoggedUserUseCase: gh<_i20.GetUpdatedLoggedUserUseCase>(),
        ));
    return this;
  }
}

class _$ApiServiceModule extends _i3.ApiServiceModule {}

class _$DiModule extends _i27.DiModule {}
