import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/model/plan.dart';
import 'package:tfg_v2/domain/repository/social/plan_repository.dart';
import 'package:tfg_v2/ui/viewmodel/root_viewmodel.dart';

@Injectable()
class PlansViewModel extends RootViewModel<PlansViewState> {
  final _repository = getIt<PlanRepository>();

  PlansViewModel() : super(Loading());

  @override
  void onAttach() async {
    final result = _repository.getPlans();
    result.fold(
      (left) => emitValue(Error(left)),
      (right) => emitValue(Success(planSet: right)),
    );
  }
}

sealed class PlansViewState extends ViewState {}

class Loading extends PlansViewState {}

class Success extends PlansViewState {
  final Set<Plan> planSet;

  Success({required this.planSet});
}

class Error extends PlansViewState {
  final AppError error;

  Error(this.error);
}
