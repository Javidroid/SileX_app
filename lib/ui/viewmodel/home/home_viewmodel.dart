import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/model/user.dart';
import 'package:tfg_v2/domain/use_cases/get_updated_logged_user.dart';
import 'package:tfg_v2/ui/navigation/navigator.dart';
import 'package:tfg_v2/ui/viewmodel/root_viewmodel.dart';

@Injectable()
class HomeViewModel extends RootViewModel<HomeViewState> {
  final GetUpdatedLoggedUserUseCase _getCurrentUserUseCase;

  HomeViewModel(this._getCurrentUserUseCase) : super(Loading());

  TfgNavigator get navigator => getIt<TfgNavigator>();

  @override
  void onAttach() async {
    final result = _getCurrentUserUseCase();
    result.fold(
      (left) => navigator.toUnavailable(left), // todo make redirector
      (right) => emitValue(Success(loggedUser: right)),
    );
  }
}

sealed class HomeViewState extends ViewState {}

class Loading extends HomeViewState {}

class Success extends HomeViewState {
  final User loggedUser;

  Success({required this.loggedUser});
}

class Error extends HomeViewState {
  final AppError error;

  Error(this.error);
}
