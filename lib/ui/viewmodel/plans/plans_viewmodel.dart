import 'package:injectable/injectable.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/model/plan.dart';
import 'package:tfg_v2/domain/repository/social/plan_repository.dart';
import 'package:tfg_v2/domain/use_cases/user_join_quit_plan.dart';
import 'package:tfg_v2/ui/viewmodel/root_viewmodel.dart';

@Injectable()
class PlansViewModel extends RootViewModel<PlansViewState> {
  final PlanRepository _planRepository;
  final UserJoinQuitPlanUseCase _joinQuitPlanUseCase;

  PlansViewModel(this._planRepository, this._joinQuitPlanUseCase)
      : super(Loading());

  @override
  void onAttach() async {
    refreshPlans();
  }

  Future<void> refreshPlans() async {
    final result = await _planRepository.getPlans();
    result.fold(
      (left) => emitValue(Error(left)),
      (right) => emitValue(
        Success(
          planList: right,
        ),
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
