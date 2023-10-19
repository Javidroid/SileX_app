import 'package:injectable/injectable.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/model/plan.dart';
import 'package:tfg_v2/domain/model/user.dart';
import 'package:tfg_v2/domain/repository/social/plan_repository.dart';
import 'package:tfg_v2/domain/repository/social/user_repository.dart';
import 'package:tfg_v2/domain/use_cases/user_join_quit_plan.dart';
import 'package:tfg_v2/ui/viewmodel/root_viewmodel.dart';

@Injectable()
class PlansViewModel extends RootViewModel<PlansViewState> {
  final PlanRepository _planRepository;
  final UserRepository _userRepository;
  final UserJoinQuitPlanUseCase _joinQuitPlanUseCase;

  late User _currentUser;

  PlansViewModel(
    this._planRepository,
    this._joinQuitPlanUseCase,
    this._userRepository,
  ) : super(Loading());

  @override
  void onAttach() async {
    final currentUser = await _userRepository.getCurrentLoggedUser();
    currentUser.fold(
      (left) => emitValue(Error(left)),
      (right) => _currentUser = right,
    );
    refreshPlans();
  }

  Future<void> refreshPlans() async {
    emitValue(Loading());
    final result = await _planRepository.getPlans();
    result.fold(
      (left) => emitValue(Error(left)),
      (right) => emitValue(Success(planList: right)),
    );
  }

  Future<void> joinButtonBehaviour({
    required Plan plan,
    required bool isJoin,
  }) async {
    final result = await _joinQuitPlanUseCase(
      localPlan: plan,
      isJoin: isJoin,
    );
    result.fold(
      (left) => print('usecase error'), // TODO: emit error snackbar
      (right) => {},
    );
    emitValue(Success(planList: (state as Success).planList));
  }

  bool isJoinedChecker({required Plan plan}) =>
      plan.joinedUsers.contains(_currentUser.id);
}

sealed class PlansViewState extends ViewState {}

class Loading extends PlansViewState {}

class Success extends PlansViewState {
  final List<Plan> planList;

  Success({
    required this.planList,
  });
}

class Error extends PlansViewState {
  final AppError error;

  Error(this.error);
}
