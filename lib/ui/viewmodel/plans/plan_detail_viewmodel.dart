import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/model/plan.dart';
import 'package:tfg_v2/domain/model/user.dart';
import 'package:tfg_v2/domain/repository/social/plan_repository.dart';
import 'package:tfg_v2/domain/repository/social/user_repository.dart';
import 'package:tfg_v2/ui/navigation/navigator.dart';
import 'package:tfg_v2/ui/viewmodel/root_viewmodel.dart';

class PlanDetailViewModel extends RootViewModel<PlanDetailViewState> {
  PlanDetailViewModel({required this.planId}) : super(Loading());
  final String planId;

  TfgNavigator get navigator => getIt<TfgNavigator>();

  PlanRepository get _planRepository => getIt<PlanRepository>();

  UserRepository get _userRepository => getIt<UserRepository>();

  @override
  void onAttach() async {
    refresh();
  }

  Future<void> refresh() async {
    final plan = await _planRepository.getPlan(planId);

    if (plan.isLeft) {
      emitValue(Error(plan.left));
    }

    final joinedUsers =
        await _userRepository.getUserList(plan.right.joinedUsers);

    print(joinedUsers.right.length);

    if (joinedUsers.isLeft) {
      emitValue(Error(joinedUsers.left));
    }

    emitValue(Success(plan: plan.right, joinedUsers: joinedUsers.right));
  }
}

sealed class PlanDetailViewState extends ViewState {}

class Loading extends PlanDetailViewState {}

class Success extends PlanDetailViewState {
  final Plan plan;
  final List<User> joinedUsers;

  Success({required this.plan, required this.joinedUsers});
}

class Error extends PlanDetailViewState {
  final AppError error;

  Error(this.error);
}
