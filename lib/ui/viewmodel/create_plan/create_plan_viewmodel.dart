import 'package:injectable/injectable.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/ui/viewmodel/root_viewmodel.dart';

@Injectable()
class CreatePlanViewModel extends RootViewModel<CreatePlanViewState> {
  CreatePlanViewModel() : super(Success());

  // TfgNavigator get navigator => getIt<TfgNavigator>();

  int get currentPageIndex => _currentPageIndex;
  int _currentPageIndex = 0;

  void nextPage() {
    _currentPageIndex++;
    emitValue(Success());
  }

  void finishOperation() {}

  void cancelOperation() {}

  @override
  void onAttach() async {}
}

sealed class CreatePlanViewState extends ViewState {}

class Loading extends CreatePlanViewState {}

class Success extends CreatePlanViewState {
  Success();
}

class Error extends CreatePlanViewState {
  final AppError error;

  Error(this.error);
}
