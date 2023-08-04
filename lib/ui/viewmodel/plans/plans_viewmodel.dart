import 'package:injectable/injectable.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/model/plan.dart';
import 'package:tfg_v2/domain/repository/social/plan_repository.dart';
import 'package:tfg_v2/ui/viewmodel/root_viewmodel.dart';

@Injectable()
class PlansViewModel extends RootViewModel<PlansViewState> {
  final PlanRepository _planRepository;

  PlansViewModel(this._planRepository) : super(Loading());

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
          onRefresh: refreshPlans,
        ),
      ),
    );
  }
}

sealed class PlansViewState extends ViewState {}

class Loading extends PlansViewState {}

class Success extends PlansViewState {
  final List<Plan> planList;
  final Function() onRefresh;

  Success({
    required this.planList,
    required this.onRefresh,
  });
}

class Error extends PlansViewState {
  final AppError error;

  Error(this.error);
}
