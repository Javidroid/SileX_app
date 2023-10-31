import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/model/plan.dart';
import 'package:tfg_v2/domain/model/user.dart';
import 'package:tfg_v2/domain/repository/social/plan_repository.dart';
import 'package:tfg_v2/domain/repository/social/user_repository.dart';
import 'package:tfg_v2/domain/use_cases/social/user_join_quit_plan.dart';
import 'package:tfg_v2/ui/navigation/navigator.dart';
import 'package:tfg_v2/ui/viewmodel/root_viewmodel.dart';

@injectable
class PlanDetailViewModel extends RootViewModel<PlanDetailViewState> {
  PlanDetailViewModel({
    @factoryParam required this.currentPlan,
  }) : super(Loading(plan: currentPlan));

  Plan currentPlan; // inits from outdated list, but updates on refresh

  TfgNavigator get navigator => getIt<TfgNavigator>();

  PlanRepository get _planRepository => getIt<PlanRepository>();

  UserRepository get _userRepository => getIt<UserRepository>();

  UserJoinQuitPlanUseCase get _joinQuitPlanUseCase =>
      getIt<UserJoinQuitPlanUseCase>();

  User? _currentUser;

  bool get isPlanCreatedByCurrentUser {
    if (_currentUser == null) return false;
    return currentPlan.creatorId == _currentUser!.id;
  }

  @override
  void onAttach() async {
    final currentUser = await _userRepository.getCurrentLoggedUser();
    currentUser.fold(
      (left) => emitValue(Error(error: left, plan: currentPlan)),
      (right) => _currentUser = right,
    );
    refresh();
  }

  Future<void> refresh() async {
    final plan = await _planRepository.getPlan(currentPlan.idPlan);
    if (plan.isLeft) {
      emitValue(Error(error: plan.left, plan: currentPlan));
    }

    currentPlan = plan.right;

    final creatorUser = await _userRepository.getUserById(
      currentPlan.creatorId,
    );
    if (creatorUser.isLeft) {
      emitValue(Error(error: creatorUser.left, plan: currentPlan));
    }

    final joinedUsers = await _userRepository.getUserListById(
      currentPlan.joinedUsers,
    );
    if (joinedUsers.isLeft) {
      emitValue(Error(error: joinedUsers.left, plan: currentPlan));
    }

    emitValue(
      Success(
        plan: currentPlan, // updated plan
        joinedUsers: joinedUsers.right,
        creatorUser: creatorUser.right,
      ),
    );
  }

  Future<void> joinButtonBehaviour({
    required Plan plan,
    required bool isJoin,
    required void Function(BuildContext context) onError,
  }) async {
    final result = await _joinQuitPlanUseCase(localPlan: plan, isJoin: isJoin);
    result.fold(
      (left) => onError,
      (right) => null,
    );
    refresh();
  }

  bool isJoinedChecker({required Plan plan}) =>
      plan.joinedUsers.contains(_currentUser!.id);

  Future<void> deletePlan({
    required void Function(BuildContext context) onError,
  }) async {
    final result = await _planRepository.deletePlan(currentPlan.idPlan);
    result.fold(
      (left) => onError,
      (right) => null,
    );
  }
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
