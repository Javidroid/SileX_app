import 'package:injectable/injectable.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/ui/viewmodel/root_viewmodel.dart';

@Injectable()
class HomeViewModel extends RootViewModel<HomeViewState> {
  HomeViewModel() : super(Loading());

  @override
  void onAttach() async {
    emitValue(Success());
  }
}

sealed class HomeViewState extends ViewState {}

class Loading extends HomeViewState {}

class Success extends HomeViewState {
  Success();
}

class Error extends HomeViewState {
  final AppError error;

  Error(this.error);
}
