import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/model/plan.dart';
import 'package:tfg_v2/domain/model/user.dart';
import 'package:tfg_v2/domain/repository/social/plan_repository.dart';
import 'package:tfg_v2/domain/repository/social/user_repository.dart';
import 'package:tfg_v2/domain/use_cases/user_join_quit_plan.dart';
import 'package:tfg_v2/ui/navigation/navigator.dart';
import 'package:tfg_v2/ui/viewmodel/root_viewmodel.dart';

class PlanDetailViewModel extends RootViewModel<PlanDetailViewState> {
  PlanDetailViewModel({required this.planFromList})
      : super(Loading(plan: planFromList));

  final Plan planFromList; // could be outdated, but is used for fast-render

  TfgNavigator get navigator => getIt<TfgNavigator>();

  PlanRepository get _planRepository => getIt<PlanRepository>();

  UserRepository get _userRepository => getIt<UserRepository>();

  UserJoinQuitPlanUseCase get _joinQuitPlanUseCase =>
      getIt<UserJoinQuitPlanUseCase>();

  late User _currentUser;

  @override
  void onAttach() async {
    final currentUser = await _userRepository.getCurrentLoggedUser();
    currentUser.fold(
      (left) => emitValue(Error(error: left, plan: planFromList)),
      (right) => _currentUser = right,
    );
    refresh();
  }

  Future<void> refresh() async {
    final plan = await _planRepository.getPlan(planFromList.idPlan);
    if (plan.isLeft) {
      emitValue(Error(error: plan.left, plan: planFromList));
    }

    // TODO: mirar si hay otra mejor manera de pasar el usuario de "precarga"
    final creatorUser = await _userRepository.getUserById(plan.right.creatorId);
    if (creatorUser.isLeft) {
      emitValue(Error(error: creatorUser.left, plan: planFromList));
    }

    final joinedUsers =
        await _userRepository.getUserListById(plan.right.joinedUsers);
    if (joinedUsers.isLeft) {
      emitValue(Error(error: joinedUsers.left, plan: planFromList));
    }

    emitValue(
      Success(
        plan: plan.right,
        joinedUsers: joinedUsers.right,
        creatorUser: creatorUser.right,
      ),
    );
  }

  Future<void> joinButtonBehaviour({
    required String idPlan,
    required bool isJoin,
  }) async {
    final result = await _joinQuitPlanUseCase(idPlan: idPlan, isJoin: isJoin);
    result.fold(
      (left) => print('usecase error'),
      (right) => print('usecase success'),
    );
  }

  bool isJoinedChecker({required Plan plan}) =>
      plan.joinedUsers.contains(_currentUser.id);
}

sealed class PlanDetailViewState extends ViewState {
  final Plan plan;

  PlanDetailViewState({required this.plan});
}

class Loading extends PlanDetailViewState {
  Loading({required super.plan});
}

class Success extends PlanDetailViewState {
  final List<User> joinedUsers;
  final User creatorUser;

  Success({
    required super.plan,
    required this.joinedUsers,
    required this.creatorUser,
  });
}

class Error extends PlanDetailViewState {
  final AppError error;

  Error({required this.error, required super.plan});
}
