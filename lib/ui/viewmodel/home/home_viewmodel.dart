import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:tfg_v2/di/dependency_injection.dart';
import 'package:tfg_v2/domain/model/errors.dart';
import 'package:tfg_v2/domain/model/social/user.dart';
import 'package:tfg_v2/domain/use_cases/social/get_updated_logged_user.dart';
import 'package:tfg_v2/ui/navigation/navigator.dart';
import 'package:tfg_v2/ui/viewmodel/root_viewmodel.dart';

@Injectable()
class HomeViewModel extends RootViewModel<HomeViewState> {
  final GetUpdatedLoggedUserUseCase _getUpdatedCurrentUser;

  HomeViewModel(this._getUpdatedCurrentUser) : super(Loading());

  TfgNavigator get navigator => getIt<TfgNavigator>();

  @override
  void onAttach() async {
    onStart();
  }

  void onStart() {
    emitValue(Loading());
    final result = _getUpdatedCurrentUser();
    result.fold(
      (left) => emitValue(Error(left)),
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
